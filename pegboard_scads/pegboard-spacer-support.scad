/**
 * @file
 * @brief Pegboard spacer and bottom support combination.
 * @author Mike Larson
 * @version 99e4615
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
 */


include <shortcuts.scad>
include <units.scad>

function inch_to_mm(n) = n * inch;


module rounded_shape_2d(r, fn = 32)
{
    $fn = fn;
    offset(r) offset(-r) children();
}

/**
 * @brief Pegboard spacer and bottom support combination.
 * @param print_orientation T = print orientation, F = display orientation
 * @note print_orientation if true, holes in Z direction & supports in gap.
 * If false, display orientation = holes in Y direction.
 */
module pegboard_spacer_support(
                width,
                screw_to_top_height, screw_to_pb_edge_height,
                pb_edge_to_bot_height,
                front_thickness, slot_thickness, back_thickness,
                screw_diameter, screw_head_diameter, screw_head_height,
                cr = 0.8,
                print_orientation = true)
{
    thickness = front_thickness + slot_thickness + back_thickness;
    height = screw_to_top_height + screw_to_pb_edge_height +
                pb_edge_to_bot_height;
    bot_to_screw_center = pb_edge_to_bot_height + screw_to_pb_edge_height;

    module side_view()
    {
        pts = [[0, 0], [thickness, 0], [thickness, height],
                [thickness - front_thickness, height],
                [thickness - front_thickness, pb_edge_to_bot_height],
                [back_thickness, pb_edge_to_bot_height],
                [back_thickness, height],
                [0, height]
        ];

        polygon(pts);
    }

    module screw_cutout()
    {
        shaft_height = thickness - screw_head_height + eps;
        translate([0, 0, -eps])
            union() {
                cylinder(d = screw_diameter, h = shaft_height, center = false);
                translate([0, 0, shaft_height])
                    cylinder(d1 = screw_diameter, d2 = screw_head_diameter,
                        h = screw_head_height + eps,
                        center = false);
            }
    }

    module spacer_support()
    {
        difference() {
            trt([width, 0, 0], [0, -90, 0])             // Flat, back on +XY
                intersection() {
                    // Basic shape, but only vertical sides rounded
                    linear_extrude(width)
                        rounded_shape_2d(cr)
                            side_view();
                    // Cube with rounded horizontal edges
                    trt([thickness, 0, 0], [0, -90, 0]) // thkns, hgt, width
                        linear_extrude(thickness)       // width, hgt, thkns
                            rounded_shape_2d(cr)
                                square([width, height]);
            }
            translate([width / 2, bot_to_screw_center, 0])
                screw_cutout();
        }
    }

    rx = print_orientation ? 0 : 90;
    ty = print_orientation ? 0 : thickness;
    trt([0, ty, 0], [rx, 0, 0])
        // Note: getting an annoying artifact at the top of the screw head
        // cutout in preview mode. This is the only way I know to get rid of
        // the artifact
        render()
            spacer_support();
}

