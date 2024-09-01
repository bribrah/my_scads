/**
 * @file
 * @brief Top level pegboard thing selector.
 * @author Mike Larson
 * @version bc8db16
 * @date jul-11-2022
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

which_pegboard_thing = "";    // ["",pegboard-hooks,pegboard-tray,pegboard-tool-and-cup-holder,pegboard-1s-6in1-charger-holder,pegboard-loop-shaped-charger-holder,pegboard-spacer,pegboard-spacer-support,pegboard-to-shelf-standard,showcase]

flip_for_print = false;

$fn = 64;

/* [Pegboard General Parameters] */

pegboard_hole_separation_mm = 25.4;                     // [0.0:0.1:100.0]

// The following is used by both the tray and loop shaped holder things

// Extra offset from tray back top to anchor hook (mm)
pgbd_thng_hook_offset_from_top = 2;


/* [Pegboard Hook Parameters] */

// Hook length (mm)
pgbd_hook_length = 25;                                  // [0.0:0.1:1000.0]

// Hook diameter (mm)
pgbd_hook_diameter = 5;                                 // [0.0:0.1:100.0]

// Hook angle (deg)
pgbd_hook_angle = 2;                                    // [0.0:0.1:90.0]

// Number of (front) hooks
pgbd_num_hooks = 1;                                     // [1:50]

// Number of anchor hooks
pgbd_num_anchor_hooks = 1;                              // [1:10]

// For num_hooks > 1, gap length = hook side-to-side distance
pgbd_hook_s2s_separation = 6;                           // [0.0:0.1:100.0]

// Hook edge to back plate top distance
pgbd_hook_offset_to_top = 0;                            // [-100.0:0.1:100.0]

// Minimum hook side to back plate side distance
pgbd_hook_dist_to_side = 4;                             // [0.0:0.1:100.0]

// Anchor hook edge to back plate edge distance
pgbd_anchor_hook_offset_to_edge = 1.2;                  // [0.0:0.1:100.0]

// Tip arc radius (mm)
pgbd_hook_tip_radius = 4;                               // [0.0:0.1:100.0]

// Tip arc angle (deg)
pgbd_hook_tip_angle = 30;                               // [0.0:0.1:90.0]

// Back plate thickness (mm)
pgbd_hook_back_plate_thickness = 2.4;                   // [0.0:0.1:1000.0]

// Back plate corner rounding (mm)
pgbd_hook_back_plate_corner_rounding = 1.0;             // [0.0:0.1:10.0]

// Small taper around middle edges
pgbd_hook_back_plate_taper = 0.4;                       // [0.0:0.1:10.0]

// + value makes anchors longer/narrower, - value makes anchors shorter/fatter
pgbd_hook_anchor_extra_clearance = 0.0;                 // [-10.0:0.1:10.0]


/* [Pegboard Tray Parameters] */

// Tray width (mm)
pgbd_tray_width = 90;                                   // [0.0:0.1:1000.0]

// Tray front-to-back depth (mm)
pgbd_tray_depth = 65;                                   // [0.0:0.1:1000.0]

// Tray height (mm)
pgbd_tray_height = 35;                                  // [0.0:0.1:1000.0]

// Tray thickness (mm)
pgbd_tray_thickness = 1.8;                              // [0.0:0.1:1000.0]

// Length of slight upwards slant at front of tray (mm)
pgbd_tray_lip_len = 12.7;                               // [0.0:0.1:1000.0]

// Angle of slight upwards slant at front of tray (deg)
pgbd_tray_lip_angle = 10;                               // [0.0:0.1:360.0]

// The tray side is horizontal for a bit, then slants downward to meet
// the front part of the lip

// Side top rear, horizontal front-to-back length (mm)
pgbd_tray_side_top_horiz_len = 25;                      // [0.0:0.1:1000.0]

// Number of anchor hooks and nubs
pgbd_tray_num_anchors = 2;


/* [Pegboard Tool and Cup Holder Parameters] */

// Tool and cup holder hole diameter
pgbd_tandc_hldr_hole_diameter = 41;                     // [0.0:0.1:1000.0]

// Tool and cup holder hole count
pgbd_tandc_hldr_hole_count = 4;

// Tool and cup holder space between holes
pgbd_tandc_hldr_hole_spacing = 5;                       // [0.0:0.1:100.0]

// Tool and cup holder side-to-side inset
pgbd_tandc_hldr_hole_s2s_inset = 5;                     // [0.0:0.1:100.0]

// Tool and cup holder front-to-back inset
pgbd_tandc_hldr_hole_f2b_inset = 8;                     // [0.0:0.1:100.0]

// Tool and cup holder tray back height
pgbd_tandc_hldr_tray_height = 20;                       // [0.0:0.1:1000.0]

// Tool and cup holder tray number of anchors
pgbd_tandc_hldr_num_anchors = 3;


/* [Pegboard Spacer Parameters] */

// Pegboard spacer (outer) rim diameter (mm)
pgbd_spacer_rim_od = 25.4;                              // [0.0:0.1:1000.0]

// Pegboard spacer middle outside diameter (mm)
pgbd_spacer_mid_od = 18;                                // [0.0:0.1:1000.0]

// Pegboard spacer inside diameter (mm)
pgbd_spacer_id = 4;                                     // [0.0:0.1:1000.0]

// Pegboard spacer height (mm)
pgbd_spacer_height = 19.05;                             // [0.0:0.1:100.0]

// Pegboard spacer rim height (mm)
pgbd_spacer_rim_height = 2;                             // [0.0:0.1:100.0]


/* [Pegboard Spacer Support Parameters] */

// Spacer/support width (inch)
pgbd_spc_sup_width_in = 1;                           // [0.0:0.1:10.0]

// Spacer/support fastener center to top height (inch)
pgbd_spc_sup_screw_to_top_height_in = 0.375;         // [0.000:0.001:10.0]

// Spacer/support fastener center to pegboard edge height (inch)
pgbd_spc_sup_screw_to_pb_edge_height_in = 0.375;     // [0.000:0.001:10.0]

// Spacer/support pegboard edge to bottom height (inch)
pgbd_spc_sup_pb_edge_to_bot_height_in = 0.375;       // [0.000:0.001:10.0]

// Pegboard spacer (behind pegboard) thickness (inch)
pgbd_spc_sup_back_thickness_in = 0.75;

// Support front thickness  (inch)
pgbd_spc_sup_front_thickness_in = 0.375;

// Slot depth (= standard pegboard thickness) (inch)
pgbd_spc_sup_slot_depth_in = 0.1875;

// Spacer Support Screw Hole Parameters]
// Note: dimensioned for a 2-1/2" (6.35cm) #8 deck screw

// Screw thread diameter (mm)
pgbd_spc_sup_screw_diameter = 4.5;                   // [0.00:0.01:10.0]

// Screw head diameter (mm)
pgbd_spc_sup_screw_head_diameter = 8.3;              // [0.00:0.01:10.0]

// Screw head height (mm)
pgbd_spc_sup_screw_head_height = 4.4;                // [0.00:0.01:10.0]


/* [Shelf Standard to Pegboard Guide Hook Parameters] */

// Standard to pegboard guide parameters

// U-shaped hook height (mm)
pgbd_s2pbh_hook_height = 9;                             // [0.0:0.1:100.0]

// U-shaped hook front-to-back thickness (mm)
pgbd_s2pbh_hook_thickness = 3.2;                        // [0.0:0.1:100.0]

// Staff extends hook on one side (mm)
pgbd_s2pbh_staff_height = 3.2;                          // [0.0:0.1:100.0]

// Hook corner radius
pgbd_s2pbh_hook_cr = 0.2;                               // [0.0:0.1:10.0]

// Front plate height (mm), if 0, then calculate automatically
pgbd_s2pbh_front_plate_height = 0;                      // [0.0:0.1:100.0]

// Front plate thickness (mm)
pgbd_s2pbh_front_plate_thickness = 3.2;                 // [0.0:0.1:100.0]

// Front plate fastener mounting hole width, default is for 4 holes + a bit
pgbd_s2pbh_front_plate_hole_width_in = 3.5;             // [0.0:0.1:10.0]

// Front plate hole to edge length (mm), default makes width 100mm
pgbd_s2pbh_front_plate_hole_to_edge_len = 5.55;         // [0.0:0.1:100.0]

// Extra double wedge support in front
pgbd_s2pbh_front_support_thickness = 0.4;               // [0.0:0.1:10.0]

// Peg board top edge to first hole center, varies from ~1/2" to ~9/16" (inches)
pegboard_top_to_hole_center_in = 0.5;                   // [0.00:0.01:10.00]

// Shelf Standard Parameters

// Wall thickness (mm)
shelf_standard_wall_thickness = 2.5;                    // [0.00:0.01:10.00]

// Slot width (inches)
shelf_standard_slot_width_in = 0.125;                   // [0.00:0.01:10.00]

// Slot separation (center-to-center, inches)
shelf_standard_slot_separation_in = 0.4375;             // [0.000:0.01:1.00]


/* [Pegboard Loop Style Holder Parameters] */

// Width of one holder (mm)
pgbd_loop_holder_width = 10.0;

// Charger top front-to-back depth not including the rubber feet (mm, not used)
pgbd_loop_holder_depth_top_no_feet = 26.6;

// Charger top front-to-back depth including the rubber feet (mm)
pgbd_loop_holder_depth_top = 31.0;

// Charger bottom front-to-back depth including the rubber feet (mm)
pgbd_loop_holder_depth_bot = 27.25;

// Charger bottom total height (mm)
pgbd_loop_holder_height = 86.1;

// Bottom height before overhang (mm, a bit less than the actual measurement)
pgbd_loop_holder_height_bot = 29;

// Tray thickness (mm)
pgbd_loop_holder_thickness = 1.8;

/* [Pegboard 1S 6in1 Charger Holder Parameters] */

// Dimensions based on Happymodel 1s LIPO/LIHV 6in1 Charger.

// Charger width (mm)
pgbd_6in1_chrgr_width = 83;                         // [0.0:0.1:1000.0]

// Charger height (mm)
pgbd_6in1_chrgr_height = 52.25;                     // [0.0:0.1:1000.0]

// Charger foot diameter (mm)
pgbd_6in1_chrgr_foot_diameter = 2.85;               // [0.00:0.01:10.00]

// Width foot center to foot center (mm)
pgbd_6in1_chrgr_width_foot_to_foot = 75.2;          // [0.00:0.01:100.00]

// Height foot center to foot center (mm)
pgbd_6in1_chrgr_height_foot_to_foot = 45.45;        // [0.0:0.1:100.0]

// Charger bottom to XT60 connector bottom
pgbd_6in1_chrgr_bot_to_xt60_bot = 5;                // [0.0:0.1:100.0]

// Front-to-back tilt angle
pgbd_chrgr_hldr_tilt_angle = 15;                    // [0.0:0.1:100.0]

// Holder support thickness (mm)
pgbd_chrgr_hldr_support_thickness = 2.4;            // [0.0:0.1:10.0]

// Width of bottom rim - supports charger (mm)
pgbd_chrgr_hldr_bot_sup_rim_width = 3.6;            // [0.0:0.1:100.0]

// Height lip that keeps charger from sliding off front edge (mm)
pgbd_chrgr_hldr_lip_height = 8;                     // [0.0:0.1:100.0]

// Anchor hook edge to back plate edge distance (mm)
pgbd_chrgr_hldr_anchor_hook_offset_to_edge = 1.2;   // [0.0:0.1:100.0]

// Back plate corner rounding
pgbd_chrgr_hldr_back_plate_corner_rounding = 1.5;   // [0.0:0.1:10.0]

// Number of anchor hooks
pgbd_chrgr_hldr_num_anchor_hooks = 2;               // [1:10]

// Hole clearance (mm)
pgbd_chrgr_hldr_hole_clearance = 1.0;               // [0.0:0.1:10.0]

// Side-to-side, top-to-bottom clearance (mm)
pgbd_chrgr_hldr_bottom_plate_clearance = 0.4;       // [0.0:0.1:10.0]


/* [Debug] */

// Debug first, pre-rotate translation
pgbrd_thngs_debug_translation1 = [0, 0, 0];             // [-1000.0:0.1:1000.0]
// Debug rotation
pgbrd_thngs_debug_rotation = [0, 0, 0];                 // [-1000.0:0.1:1000.0]
// Debug second, post-rotate translation
pgbrd_thngs_debug_translation2 = [0, 0, 0];             // [-1000.0:0.1:1000.0]

// Debug color string or "#" modifier or "%" modifier
pgbrd_thngs_debug_color_mod_str = "";
// Debug color alpha value
pgbrd_thngs_debug_color_alpha = 1.0;                    // [0.0:0.1:1.0]

/* [JSON Comments] */

pgbrd_thngs_json_comments = "";


/* [Hidden] */

include <shortcuts.scad>
include <debug.scad>

include <pegboard-thing-utils.scad>
use <pegboard-hooks.scad>
use <pegboard-tray.scad>
use <pegboard-tool-and-cup-holder.scad>
use <pegboard-1s-6in1-charger-holder.scad>
use <pegboard-loop-shaped-holder.scad>
use <pegboard-spacer.scad>
use <pegboard-spacer-support.scad>
use <pegboard-to-shelf-standard.scad>

/**
 * @brief Echo a suggested part filename based on customizable parameters.
 */
pgbrd_thngs_filename_conventions = "l=length w=width d=depth t=thickness ll=lip-length la=lip-angle hd=hook-diameter bpt=back-plate-thicknessnh=num-hooks na=num-anchors ha=hook-angle sep=hook-s2s-separation fp=flip-for-print";

module pgbrd_thngs_echo_part_filename(part_name)
{
    echo(str("Filename conventions: ", pgbrd_thngs_filename_conventions));
}

module pegboard_thing_select(which_part)
{
    module hook_thing(num_hooks = pgbd_num_hooks,
                num_anchor_hooks = pgbd_num_anchor_hooks)
    {
        easy = false;
        if(easy)
            pegboard_hooks(         // Test defaults w/ just common parameters
                num_hooks = num_hooks,
                hook_length = pgbd_hook_length,
                num_anchor_hooks = num_anchor_hooks,
                flip_for_print = flip_for_print
            );
        else
            pegboard_hooks(
                hook_diameter = pgbd_hook_diameter,
                hook_length = pgbd_hook_length,
                hook_angle = pgbd_hook_angle,
                tip_radius = pgbd_hook_tip_radius,
                tip_angle = pgbd_hook_tip_angle,
                num_hooks = num_hooks,
                hook_s2s_separation = pgbd_hook_s2s_separation,
                hook_offset_to_top = pgbd_hook_offset_to_top,
                hook_dist_to_side = pgbd_hook_dist_to_side,
                back_plate_thickness = pgbd_hook_back_plate_thickness,
                num_anchor_hooks = num_anchor_hooks,
                hook_nub_shaft_diameter = pgbd_hook_nub_shaft_diameter,
                hook_nub_shaft_length = pgbd_hook_nub_shaft_length,
                anchor_hook_offset_to_edge = pgbd_anchor_hook_offset_to_edge,
                pegboard_hole_separation = pegboard_hole_separation_mm,
                back_plate_corner_rounding =
                        pgbd_hook_back_plate_corner_rounding,
                back_plate_taper = pgbd_hook_back_plate_taper,
                extra_clearance = pgbd_hook_anchor_extra_clearance,
                flip_for_print = flip_for_print
            );
    }

    module tray_thing(
                lip_len = pgbd_tray_lip_len,
                lip_angle = pgbd_tray_lip_angle,
                side_top_horiz_len = pgbd_tray_side_top_horiz_len
            )
    {
        pegboard_tray(
            pgbd_tray_width, pgbd_tray_depth, pgbd_tray_height,
            pgbd_tray_thickness,
            lip_len, lip_angle,
            side_top_horiz_len,
            pgbd_tray_num_anchors,
            anchor_hook_offset_from_top = pgbd_thng_hook_offset_from_top);
    }

    module tool_and_cup_holder_thing(
                hole_diameter = pgbd_tandc_hldr_hole_diameter,
                hole_count = pgbd_tandc_hldr_hole_count,
                hole_spacing = pgbd_tandc_hldr_hole_spacing,
                hole_s2s_inset = pgbd_tandc_hldr_hole_s2s_inset,
                hole_f2b_inset = pgbd_tandc_hldr_hole_f2b_inset,
                tray_height = pgbd_tandc_hldr_tray_height,
                num_anchors = pgbd_tandc_hldr_num_anchors
            )
    {
        pegboard_tool_and_cup_holder(
                hole_diameter = hole_diameter,
                hole_count = hole_count,
                hole_spacing = pgbd_tandc_hldr_hole_spacing,
                hole_s2s_inset = hole_s2s_inset,
                hole_f2b_inset = hole_f2b_inset,
                tray_height = tray_height,
                num_anchors = pgbd_tandc_hldr_num_anchors
            );
    }

    module battery_charger_holder_1s_6in1_thing()
    {
        pegboard_6in1_battery_charger_holder(
                chrgr_width = pgbd_6in1_chrgr_width,
                chrgr_height = pgbd_6in1_chrgr_height,
                support_thickness = pgbd_chrgr_hldr_support_thickness,
                tilt_angle = pgbd_chrgr_hldr_tilt_angle,
                rim_width = pgbd_chrgr_hldr_bot_sup_rim_width,
                lip_height = pgbd_chrgr_hldr_lip_height,
                width_foot_to_foot = pgbd_6in1_chrgr_width_foot_to_foot,
                height_foot_to_foot = pgbd_6in1_chrgr_height_foot_to_foot,
                foot_diameter = pgbd_6in1_chrgr_foot_diameter,
                bot_to_xt60_bot = pgbd_6in1_chrgr_bot_to_xt60_bot,
                num_anchor_hooks = pgbd_chrgr_hldr_num_anchor_hooks,
                anchor_hook_offset_to_edge =
                    pgbd_chrgr_hldr_anchor_hook_offset_to_edge,
                corner_rounding = pgbd_chrgr_hldr_back_plate_corner_rounding,
                bottom_plate_clearance = pgbd_chrgr_hldr_bottom_plate_clearance,
                hole_clearance = pgbd_chrgr_hldr_hole_clearance,
        );
    }

    module battery_charger_holder_loop_shaped_thing()
    {
        pegboard_loop_shaped_holder(
            holder_width = pgbd_loop_holder_width,
            holder_depth_top = pgbd_loop_holder_depth_top,
            holder_depth_bot = pgbd_loop_holder_depth_bot,
            holder_height = pgbd_loop_holder_height,
            holder_height_bot = pgbd_loop_holder_height_bot,
            holder_thickness = pgbd_loop_holder_thickness,
            hook_offset_from_top = pgbd_thng_hook_offset_from_top);
    }

    module spacer_thing()
    {
        pegboard_spacer(
                rim_od = pgbd_spacer_rim_od,
                mid_od = pgbd_spacer_mid_od,
                id = pgbd_spacer_id,
                height = pgbd_spacer_height,
                rim_height = pgbd_spacer_rim_height);
    }

    module spacer_support_thing(print_orientation = true)
    {
        support_width = inch_to_mm(pgbd_spc_sup_width_in);
        support_screw_to_top_height =
            inch_to_mm(pgbd_spc_sup_screw_to_top_height_in);
        support_screw_to_pb_edge_height =
            inch_to_mm(pgbd_spc_sup_screw_to_pb_edge_height_in);
        support_pb_edge_to_bot_height =
            inch_to_mm(pgbd_spc_sup_pb_edge_to_bot_height_in);
        support_back_thickness = inch_to_mm(pgbd_spc_sup_back_thickness_in);
        support_front_thickness = inch_to_mm(pgbd_spc_sup_front_thickness_in);
        support_slot_depth = inch_to_mm(pgbd_spc_sup_slot_depth_in);

        pegboard_spacer_support(
                width = support_width,
                screw_to_top_height = support_screw_to_top_height,
                screw_to_pb_edge_height = support_screw_to_pb_edge_height,
                pb_edge_to_bot_height = support_pb_edge_to_bot_height,
                front_thickness = support_front_thickness,
                slot_thickness = support_slot_depth,
                back_thickness = support_back_thickness,
                screw_diameter = pgbd_spc_sup_screw_diameter,
                screw_head_diameter = pgbd_spc_sup_screw_head_diameter,
                screw_head_height = pgbd_spc_sup_screw_head_height,
                print_orientation = print_orientation);
    }

    module pegboard_to_shelf_standard_thing(print_orientation = false)
    {
        pegboard_to_shelf_standard(
            front_plate_hole_width =
                inch_to_mm(pgbd_s2pbh_front_plate_hole_width_in),
            front_plate_hole_to_edge_len =
                pgbd_s2pbh_front_plate_hole_to_edge_len,
            front_plate_height = pgbd_s2pbh_front_plate_height,
            front_plate_thickness = pgbd_s2pbh_front_plate_thickness,
            front_support_thickness = pgbd_s2pbh_front_support_thickness,
            hook_height = pgbd_s2pbh_hook_height,
            staff_height = pgbd_s2pbh_staff_height,
            hook_thickness = pgbd_s2pbh_hook_thickness,
            peg_board_hole_diameter = inch_to_mm(pegboard_hole_diameter_in),
            peg_board_thickness = inch_to_mm(pegboard_thickness_in),
            peg_board_top_to_hole_center =
                inch_to_mm(pegboard_top_to_hole_center_in),
            shelf_standard_slot_width =
                inch_to_mm(shelf_standard_slot_width_in),
            shelf_standard_slot_separation =
                inch_to_mm(shelf_standard_slot_separation_in),
            shelf_standard_wall_thickness = shelf_standard_wall_thickness,
            print_orientation = print_orientation
        );
    }

    module showcase()
    {
        tray_width = pgbd_tray_width;
        row_length = 110;
        chgr_hldr_6in1_width = 110;
        spacer_sup_tx = chgr_hldr_6in1_width + tray_width - 25;
        std_spacer_tx = chgr_hldr_6in1_width + tray_width + 20;
        tray2_tx = chgr_hldr_6in1_width;
        tandc_tx = std_spacer_tx;

        pgbd_hooks_color = "gray";
        pgbd_tray_color = "royalblue";
        pgbd_charger_holder_color = "mediumseagreen";
        pgbd_support_color = "orangered";

        module trtl(l)
        {
            trt(l[0], l[1], l[2])
                children(0);
        }

        pgbd_hook_xfrms = [
            // second translate, rotation, first translate
            [[40, 30, 0], [0, 0, -90], [0, 0, 0]],
            [[100, 30, 0], [0, 0, -90], [0, 0, 0]],
            [[240, 30, 0], [0, 0, -90], [0, 0, 0]],
        ];
        pgbd_hook_params = [
            // num_hooks, num_anchor_hooks
            [1, 1],
            [3, 1],
            [12, 3],
        ];

        pgbd_tray_xfrms = [
            // second translate, rotation, first translate
            [[0, 60 + row_length, 0], [0, 0, -90], [0, 0, 0]],
            [[tray2_tx, 60 + row_length, 0], [0, 0, -90], [0, 0, 0]],
        ];
        pgbd_tray_params = [
            // lip_len, lip_angle, side_top_horiz_len
            [ pgbd_tray_lip_len, pgbd_tray_lip_angle,
                pgbd_tray_side_top_horiz_len],
            [20, 90, pgbd_tray_side_top_horiz_len],
        ];

        pgbd_tandc_hldr_xfrms = [
            // second translate, rotation, first translate
            [[tandc_tx, 60 + row_length, 0], [0, 0, -90], [0, 0, 0]],
        ];
        pgbd_tandc_params = [
            // hole count
            [3]
        ];

        pgbd_spacer_support_xfrms = [
            [spacer_sup_tx, row_length * 2 + 20, 0], [0, 0, 0], [0, 0, 0]
        ];

        pgbd_std_to_spacer_xfrms = [
            [std_spacer_tx, row_length * 2 + 20, 0], [0, 0, 0], [0, 0, 0]
        ];

        pgbd_charger_holder_1s_6in1_xfrms = [
            [0, row_length * 2, 0], [0, 0, 0], [0, 0, 0]
        ];

        pgbd_charger_holder_loop_shaped_x1_xfrms = [
            [chgr_hldr_6in1_width, row_length * 2, 0], [0, 0, 0], [0, 0, 0]
        ];


        for(i = [0 : len(pgbd_hook_params) - 1])
            trtl(pgbd_hook_xfrms[i])
                color(pgbd_hooks_color)
                    hook_thing(
                        num_hooks = pgbd_hook_params[i][0],
                        num_anchor_hooks = pgbd_hook_params[i][1]);
        for(i = [0 : len(pgbd_tray_params) - 1])
            trtl(pgbd_tray_xfrms[i])
                color(pgbd_tray_color)
                    tray_thing(
                        lip_len = pgbd_tray_params[i][0],
                        lip_angle = pgbd_tray_params[i][1],
                        side_top_horiz_len = pgbd_tray_params[i][2]
                    );
        for(i = [0 : len(pgbd_tandc_params) - 1])
            trtl(pgbd_tandc_hldr_xfrms[i])
                color(pgbd_tray_color)
                    tool_and_cup_holder_thing(
                        hole_count = pgbd_tandc_params[i][0]
                    );
        trtl(pgbd_spacer_support_xfrms)
            color(pgbd_support_color)
                spacer_support_thing(print_orientation = false);
        trtl(pgbd_std_to_spacer_xfrms)
            color(pgbd_support_color)
                pegboard_to_shelf_standard_thing(print_orientation = false);
        trtl(pgbd_charger_holder_1s_6in1_xfrms)
            color(pgbd_charger_holder_color)
                battery_charger_holder_1s_6in1_thing();
        trtl(pgbd_charger_holder_loop_shaped_x1_xfrms)
            color(pgbd_charger_holder_color)
                battery_charger_holder_loop_shaped_thing();
    }

    pgbrd_thngs_echo_part_filename(which_part);

    if(which_part == "pegboard-hooks") {
        hook_thing();
    } else if(which_part == "pegboard-tray") {
        tray_thing();
    } else if(which_part == "pegboard-tool-and-cup-holder") {
        tool_and_cup_holder_thing();
    } else if(which_part == "pegboard-1s-6in1-charger-holder") {
        battery_charger_holder_1s_6in1_thing();
    } else if(which_part == "pegboard-loop-shaped-charger-holder") {
        battery_charger_holder_loop_shaped_thing();
    } else if(which_part == "pegboard-spacer") {
        spacer_thing();
    } else if(which_part == "pegboard-spacer-support") {
        spacer_support_thing();
    } else if(which_part == "pegboard-to-shelf-standard") {
        pegboard_to_shelf_standard_thing();
    } else if(which_part == "showcase") {
        showcase();
    }
}

color_mod(pgbrd_thngs_debug_color_mod_str, pgbrd_thngs_debug_color_alpha)
    trt(pgbrd_thngs_debug_translation2,
            pgbrd_thngs_debug_rotation,
            pgbrd_thngs_debug_translation1)
        pegboard_thing_select(which_pegboard_thing);


