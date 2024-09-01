/**
 * @file
 * @brief Pegboard hooks
 * @author Mike Larson
 * @version 4c6fffb
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

// Default parameters

// Hook length (mm)
pgbd_dflt_hook_length = 70;                          // [0.0:0.1:1000.0]

// Hook diameter (mm)
pgbd_dflt_hook_diameter = 7;                         // [0.0:0.1:100.0]

// Hook angle (deg)
pgbd_dflt_hook_angle = 45;                            // [0.0:0.1:90.0]

// Number of (front) hooks
pgbd_dflt_num_hooks = 4;                             // [1:50]

// Number of anchor hooks
pgbd_dflt_num_anchor_hooks = 3;                      // [1:10]

// For num_hooks > 1, gap length = hook side-to-side distance
pgbd_dflt_hook_s2s_separation = 10;                   // [0.0:0.1:100.0]

// Hook edge to back plate top distance
pgbd_dflt_hook_offset_to_top = 0;                    // [-100.0:0.1:100.0]

// Minimum hook side to back plate side distance
pgbd_dflt_hook_dist_to_side = 4;                     // [0.0:0.1:100.0]

// Anchor hook edge to back plate edge distance
pgbd_dflt_anchor_hook_offset_to_edge = 1.2;          // [0.0:0.1:100.0]

// Tip arc radius (mm)
pgbd_dflt_hook_tip_radius = 10;                       // [0.0:0.1:100.0]

// Tip arc angle (deg)
pgbd_dflt_hook_tip_angle = 180;                       // [0.0:0.1:90.0]

// Back plate thickness (mm)
pgbd_default_hook_back_plate_thickness = 5;        // [0.0:0.1:1000.0]

// Back plate corner rounding (mm)
pgbd_dflt_hook_back_plate_corner_rounding = 1.0;     // [0.0:0.1:10.0]

// Small taper around middle edges
pgbd_dflt_hook_back_plate_taper = 0.4;               // [0.0:0.1:10.0]

// + value makes anchors longer/narrower, - value makes anchors shorter/fatter
pgbd_dflt_hook_anchor_extra_clearance = 0.0;         // [-10.0:0.1:10.0]

include <shortcuts.scad>
include <pegboard-thing-utils.scad>

// Maximum hook fillet height based on hook radius and back plate top height
function max_hook_fillet_height(hook_radius, bp_top_height) =
                    bp_top_height / 2 - hook_radius;


/**
 * @brief Single anchor convienence module.
 */
module one_anchor(shaft_diameter, shaft_length, which_part,
                extra_clearance = 0)
{
    anchor_hook_and_nub(
                which_part = which_part,
                hook_nub_shaft_diameter = shaft_diameter - extra_clearance,
                hook_nub_shaft_length = shaft_length + extra_clearance);
}

/**
 * @brief Models anchor multiple anchor hooks, placed according to
 *  the specified number of anchor hooks and back plate top width.
 */
module anchor_hooks(num_anchor_hooks, back_plate_top_width,
                shaft_diameter, shaft_length,
                extra_clearance = 0)
{
    placement = pegboard_anchor_placement(back_plate_top_width,
                            num_anchor_hooks);
    start = num_anchor_hooks > 1 ? placement[0] - back_plate_top_width / 2 : 0;
    incr  = placement[1];

    module info()
    {
        echo(start = start);
        echo(incr = incr);
    }

    //info();

    for(i = [0 : num_anchor_hooks - 1])
        translate([0, start + (incr * i), 0])
            rotate([90, 0, 0])
                one_anchor(
                        shaft_diameter,
                        shaft_length,
                        which_part = "hook",
                        extra_clearance = extra_clearance);
}

/**
 * @brief The back plate is what the hooks attach to in the front
 *  and anchors attach to in the back.
 */
module back_plate(
            back_plate_height,
            back_plate_top_height,
            back_plate_top_width,
            back_plate_bot_height,
            back_plate_thickness,
            num_anchor_hooks,
            anchor_hook_offset_to_edge,
            back_plate_corner_rounding = 1.0,
            back_plate_taper = 0.4,
            pegboard_hole_separation = pegboard_hole_separation,
            shaft_diameter = pgbd_hook_nub_shaft_diameter
        )
{
    sep = pegboard_hole_separation;
    dte = anchor_hook_offset_to_edge;
    //top_width = shaft_diameter + (num_anchor_hooks - 1) * sep + dte * 2;
    top_width = back_plate_top_width;
    bot_width = shaft_diameter + dte * 2;
    // A longer horizontal stroke at the top or bottom, as in E T
    ear_width = (top_width - bot_width) / 2;
    top_height = back_plate_top_height;
    bot_height = back_plate_bot_height;
    height = back_plate_height;
    cr = back_plate_corner_rounding;
    taper = back_plate_taper;

    opts = [[ear_width, 0], [ear_width + bot_width, 0],
            [ear_width + bot_width, bot_height],
            [top_width, bot_height],
            [top_width, height],
            [0, height],
            [0, bot_height],
            [ear_width, bot_height],
    ];

    s = bot_width;
    pts = [
            [ear_width, 0],                             // Bot, lt
            [ear_width + bot_width, 0],                 // Bot, rt

            [ear_width + bot_width, s],
            [ear_width + bot_width - taper, s + taper],
            [ear_width + bot_width - taper, bot_height],
            [top_width, bot_height],

            [top_width, height],                        // Top, rt
            [0, height],                                // Top, lt

            [0, bot_height],
            [ear_width + taper, bot_height],
            [ear_width + taper, s + taper],
            [ear_width, s],
    ];
    trt([0, -top_width / 2, 0], [90, 0, 90])
        linear_extrude(back_plate_thickness)
            offset(r = cr) offset(delta = -cr)
                polygon(pts);
}

/**
 * @brief Models one or more hook parts of a pegboard hook.
 */
module pegboard_front_hooks(hook_diameter, hook_length, hook_angle,
            tip_radius,
            tip_angle,
            num_hooks,
            hook_dist_to_side,
            back_plate_top_height,
            back_plate_top_width_hook_based
        )
{
    diameter = hook_diameter;
    // Extra length due to up angle
    extra = diameter * sin(hook_angle);
    // Total length
    length = hook_length + extra;

    module circular_hook_and_cap(shaft_diameter, radius, angle)
    {
        union() {
            // Hook shape in Q3
            //rotate([0, 0, 180])
            trt([-radius, 0, 0], [90, 0, 0])
                union() {
                    rotate_extrude(angle = angle)
                        translate([radius, 0, 0])
                            circle(d = shaft_diameter);
                    trt([0, 0, 0], [0, 0, angle], [radius, 0, 0])
                        sphere(d = shaft_diameter);
                }
        }
    }

    // One hook, centered on X in the +X direction
    module one_hook()
    {
        union() {
            difference() {
                trt([0, 0, 0], [0, 90 - hook_angle, 0], [0, 0, -extra])
                    union() {
                        cylinder(d = diameter, h = length, center = false);
                        translate([0, 0, length])
                            circular_hook_and_cap(diameter, tip_radius,
                                        tip_angle);

                        hook_radius = hook_diameter / 2;
                        ro = max_hook_fillet_height(hook_radius,
                                back_plate_top_height);
                        pgbd_round_fillet_shape(hook_radius, ro, fn = $fn);
                    }
                // Removes part of shaft rotated into -X
                // Note: extra * 2 to account for translate (above) & rotate
                e2 = extra * 2;
                deps2 = diameter + eps2;
                translate([-e2, -diameter / 2, -diameter / 2])
                    cube([e2 + eps, deps2, deps2], center = false);
            }
        }
    }

    // Usable width = back_plate_top_width - anchor_hook_offset_to_edge * 2
    // For placement, use hook centers to determine separation
    l = back_plate_top_width_hook_based - hook_dist_to_side * 2 - hook_diameter;
    sep = num_hooks > 1 ? l / (num_hooks - 1) : 0;
    start = num_hooks > 1 ? -l / 2 : 0;
    for(i = [0 : num_hooks - 1])
        translate([0, start + sep * i, 0])
            one_hook();
}

/**
 * @brief Top level module assembles the hook(s), back plate, anchor
 *  hook(s), and anchor nub (if #anchors = 1). Also optionally flips the
 *  part to a convienent print orientation.
 */
module pegboard_hooks(
                hook_diameter = pgbd_dflt_hook_diameter,
                hook_length = pgbd_dflt_hook_length,
                hook_angle = pgbd_dflt_hook_angle,
                tip_radius = pgbd_dflt_hook_tip_radius,
                tip_angle = pgbd_dflt_hook_tip_angle,
                num_hooks = pgbd_dflt_num_hooks,
                hook_s2s_separation = pgbd_dflt_hook_s2s_separation,
                hook_offset_to_top = pgbd_dflt_hook_offset_to_top,
                hook_dist_to_side = pgbd_dflt_hook_dist_to_side,
                back_plate_thickness = pgbd_default_hook_back_plate_thickness,
                num_anchor_hooks = pgbd_dflt_num_anchor_hooks,
                hook_nub_shaft_diameter = pgbd_hook_nub_shaft_diameter,
                hook_nub_shaft_length = pgbd_hook_nub_shaft_length,
                anchor_hook_offset_to_edge =
                            pgbd_dflt_anchor_hook_offset_to_edge,
                pegboard_hole_separation = inch_to_mm(1),
                back_plate_corner_rounding =
                            pgbd_dflt_hook_back_plate_corner_rounding,
                back_plate_taper = pgbd_dflt_hook_back_plate_taper,
                extra_clearance = pgbd_dflt_hook_anchor_extra_clearance,
                flip_for_print = false
            )
{
    back_plate_top_height = hook_nub_shaft_diameter +
            anchor_hook_offset_to_edge * 2;
    back_plate_bot_height = pegboard_hole_separation;
    back_plate_height = back_plate_top_height + back_plate_bot_height;

    // Back plate top width based on hook diameter and hook spacing
    back_plate_top_width_hook_based =
            (hook_s2s_separation + hook_diameter) * (num_hooks - 1) +
            hook_dist_to_side * 2 +
            hook_diameter;

    // Back plate top width based on anchors
    back_plate_top_width_anchor_based = pegboard_max_width(num_anchor_hooks) +
            anchor_hook_offset_to_edge * 2;

    // Back plate top width
    back_plate_top_width = max(back_plate_top_width_hook_based,
                                back_plate_top_width_anchor_based);


    shaft_diameter = hook_nub_shaft_diameter;
    anchors_tz =
        -shaft_diameter / 2 -               // Nub shaft top on X
        pegboard_hole_separation +          // Hook shaft top on X
        back_plate_height -                 // Hook shaft top = back plate top
        anchor_hook_offset_to_edge;         // Move down offset
    hook_tz = back_plate_height - back_plate_top_height / 2 +
        hook_offset_to_top;

    height_at_anchor_hook_top =
            back_plate_height - anchor_hook_offset_to_edge -
            shaft_diameter +
            pgbd_anchor_hook_height(hook_nub_shaft_diameter,
                    hook_nub_shaft_length);

    flip_list = flip_for_print ?
                    [[0, 0, height_at_anchor_hook_top], [0, 180, 0]] :
                    [[0, 0, 0], [0, 0, 0]];

    trt(flip_list[0], flip_list[1])
        union() {
            translate([0, 0, anchors_tz])
                union() {
                    if(num_anchor_hooks == 1)
                        one_anchor(
                                hook_nub_shaft_diameter,
                                hook_nub_shaft_length,
                                which_part = "nub",
                                extra_clearance = extra_clearance);
                    anchor_hooks(num_anchor_hooks, back_plate_top_width,
                        hook_nub_shaft_diameter,
                        hook_nub_shaft_length,
                        extra_clearance = extra_clearance);
                }
            translate([back_plate_thickness, 0, hook_tz])
                pegboard_front_hooks(
                    hook_diameter,
                    hook_length,
                    hook_angle,
                    tip_radius,
                    tip_angle,
                    num_hooks,
                    hook_dist_to_side,
                    back_plate_top_height,
                    back_plate_top_width_hook_based);
            back_plate(
                back_plate_height,
                back_plate_top_height,
                back_plate_top_width,
                back_plate_bot_height,
                back_plate_thickness,
                num_anchor_hooks,
                anchor_hook_offset_to_edge,
                back_plate_corner_rounding = back_plate_corner_rounding,
                back_plate_taper = back_plate_taper,
                pegboard_hole_separation = pegboard_hole_separation
            );
        }
}

pegboard_hooks();

