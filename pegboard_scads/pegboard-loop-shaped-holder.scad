/**
 * @file
 * @brief Pegboard loop for holding stepped rectangular objects.
 * @author Mike Larson
 * @version 4f8e12c
 * @date mar-06-2022
 * @copyright Copyright (C) 2022  Mike Larson

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 * @note Dimensioned for a Tenergy TB6B battery charger. The loop may
 *  have a step feature in front for objects that have different top
 *  and bottom thicknesses. In general, print two of these (one for each
 *  side) to secure the object to the pegboard.
 */

// Width of one holder (mm)
pgbd_dflt_loop_holder_width = 10.0;

// Charger top front-to-back depth not including the rubber feet (mm, not used)
pgbd_dflt_loop_holder_depth_top_no_feet = 26.6;

// Charger top front-to-back depth including the rubber feet (mm)
pgbd_dflt_loop_holder_depth_top = 31.0;

// Charger bottom front-to-back depth including the rubber feet (mm)
pgbd_dflt_loop_holder_depth_bot = 27.25;

// Charger bottom total height (mm)
pgbd_dflt_loop_holder_height = 86.1;

// Bottom height before overhang (mm, a bit less than the actual measurement)
pgbd_dflt_loop_holder_height_bot = 29;

// Tray thickness (mm)
pgbd_dflt_loop_holder_thickness = 1.8;

// Extra offset from tray back top to hook (mm)
pgbd_dflt_thng_hook_offset_from_top = 2;


include <shortcuts.scad>
include <pegboard-thing-utils.scad>


/**
 * @brief Pegboard holder for stepped rectangular objects like a battery
 *  charger (one side).
 */
module pegboard_loop_shaped_holder(
            holder_width = pgbd_dflt_loop_holder_width,
            holder_depth_top = pgbd_dflt_loop_holder_depth_top,
            holder_depth_bot = pgbd_dflt_loop_holder_depth_bot,
            holder_height = pgbd_dflt_loop_holder_height,
            holder_height_bot = pgbd_dflt_loop_holder_height_bot,
            holder_thickness = pgbd_dflt_loop_holder_thickness,
            hook_offset_from_top = pgbd_dflt_thng_hook_offset_from_top,
            hook_nub_separation = pegboard_hook_nub_separation,
            hook_nub_shaft_diameter = pgbd_hook_nub_shaft_diameter)
{
    hook_nub_shaft_radius = hook_nub_shaft_diameter / 2;
    module holder_block()
    {
        ddiff = holder_depth_top - holder_depth_bot;
        pts = [ [0,0], [holder_depth_top - ddiff, 0],
                [holder_depth_top - ddiff, holder_height_bot],
                [holder_depth_top, holder_height_bot],
                [holder_depth_top, holder_height],
                [0, holder_height],
        ];
        polygon(pts);
    }

    module holder_wall()
    {
        ht = holder_thickness;
        ht2 = ht / 2;
        linear_extrude(holder_width)
            translate([ht, ht, 0])
                difference() {
                    offset(holder_thickness)
                        holder_block();
                    holder_block();
            }
    }

    module holder()
    {
        union() {
            translate([0, 0, -holder_width / 2])
                holder_wall();
            ty = -hook_nub_shaft_radius - hook_nub_separation + holder_height -
                    hook_offset_from_top;
            translate([0, ty, 0])
                anchor_hook_and_nub();
        }
    }
    holder();
}
