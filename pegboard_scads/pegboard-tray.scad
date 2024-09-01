/**
 * @file
 * @brief Pegboard tray with up-sloped front lip
 * @author Mike Larson
 * @version ac26d3a
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
 *
 * @note Hooks are automatically spaced based on number of anchors and
 * tray width.
 */

// Default parameters

// Tray width (mm)
pgbd_dflt_tray_width = 90;                              // [0.0:0.1:1000.0]

// Tray front-to-back depth (mm)
pgbd_dflt_tray_depth = 65;                              // [0.0:0.1:1000.0]

// Tray height (mm)
pgbd_dflt_tray_height = 35;                             // [0.0:0.1:1000.0]

// Tray thickness (mm)
pgbd_dflt_tray_thickness = 1.8;                         // [0.0:0.1:1000.0]

// Length of slight upwards slant at front of tray (mm)
pgbd_dflt_tray_lip_len = 12.7;                          // [0.0:0.1:1000.0]

// Angle of slight upwards slant at front of tray (deg)
pgbd_dflt_tray_lip_angle = 10;                          // [0.0:0.1:360.0]

// The tray side is horizontal for a bit, then slants downward to meet
// the front part of the lip

// Side top rear, horizontal front-to-back length (mm)
pgbd_dflt_tray_side_top_horiz_len = 25;                 // [0.0:0.1:1000.0]

// Number of anchor hooks and nubs
pgbd_dflt_tray_num_anchors = 2;

// Extra offset from tray back top to anchor hook (mm)
pgbd_dflt_tray_anchor_hook_offset_from_top = 2;         // [0.0:0.1:100.0]


include <units.scad>
include <shortcuts.scad>
include <pegboard-thing-utils.scad>


// @sa https://en.wikipedia.org/wiki/Rotation_matrix
// Rv = | cos(A)  -sin(A) | . | x | = | x * cos(A) - y * sin(A) |
//      | sin(A)   cos(A) |   | y | = | x * sin(A) + y * cos(A) |
// @sa rotate (parkinbot-utils/transformations-as-functions.scad)
function rot(p, A) =
            let(x = p[0], y = p[1])
                [x * cos(A) - y * sin(A), x * sin(A) + y * cos(A)];


/**
 * @brief Tray without pegs.
 * @param width Side to side length
 * @param depth Front to back length
 * @param height Top to bottom length
 * @note Extruded up along +Z in starting in +XY.
 */
module pegboard_tray_no_pegs(width, depth, height, thickness,
                lip_len, lip_angle,
                side_top_horiz_len)
{
    lip_rise = lip_len * sin(lip_angle);
    lip_run = lip_len * cos(lip_angle);
    // pre-intersected lip points, CCW, starting with bottom left
    bottom_back_pts =
        let(p0x = depth - lip_run,
            p1y = lip_rise,
            p2x = (lip_angle == 90) ? depth - thickness : depth,
            p2y = p1y + ((lip_angle == 90) ? 0 : thickness / cos(lip_angle)),
            p3x = p0x - thickness * cos(90 - lip_angle))
        concat(
            [[0, 0]],
            [[p0x, 0], [depth, p1y], [p2x, p2y], [p3x, thickness]],
            [[thickness, thickness], [thickness, height], [0, height]]
        );
    side_pts = [
        [0, 0], [depth - lip_run, 0],
            [depth, lip_rise],
            [side_top_horiz_len, height],
            [0, height],
    ];

    module bottom_back(width)
    {
        // Note: make the lip longer and then cut it off at the angle that
        // matches the diagional side angle
        linear_extrude(width)
            intersection() {
                polygon(bottom_back_pts);
                polygon(side_pts);
            }
    }

    module one_side(thickness)
    {
        linear_extrude(thickness)
            polygon(side_pts);
    }

    union() {
        one_side(thickness);
        translate([0, 0, width - thickness])
            one_side(thickness);
        bottom_back(width);
    }
}

/**
 * @brief Pegboard tray with pegs.
 * @note Tray in +XY, hook/nubs in -X+Y
 */
module pegboard_tray(width, depth, height, thickness, lip_len, lip_angle,
                side_top_horiz_len, num_anchors = pgbd_dflt_tray_num_anchors,
                anchor_hook_offset_from_top =
                    pgbd_dflt_tray_anchor_hook_offset_from_top,
                hook_nub_separation = pegboard_hook_nub_separation,
                hook_nub_shaft_diameter = pgbd_hook_nub_shaft_diameter,
                which_anchor_part = "both")
{
    hook_nub_shaft_radius = hook_nub_shaft_diameter / 2;
    hole_spacing = pegboard_hole_separation;
    placement = pegboard_anchor_placement(width, num_anchors);
    inset = placement[0];
    incr  = placement[1];
    trt([0, width, 0], [90, 0, 0])      // Tray in +XY, H/N in -X+Y
        union() {
            // First move anchor hook down so top touches X axis (1st 2 terms),
            // then up tray height so top of hook shaft aligned with top
            // of tray, then move down offset from top
            ty = -hook_nub_shaft_radius - hook_nub_separation + height -
                    anchor_hook_offset_from_top;
            for(i = [0 : num_anchors - 1])
                translate([0, ty, inset + (i * incr)])
                    anchor_hook_and_nub(which_part = which_anchor_part);
            pegboard_tray_no_pegs(width, depth, height, thickness,
                        lip_len, lip_angle,
                        side_top_horiz_len);
    }
}

