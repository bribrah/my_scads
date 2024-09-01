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

// ===== Included file shortcuts.scad =====
/**
* @file
* @brief OpenSCAD shortcuts and various other small utilities.
* @author Mike Larson
* @version 500b88b
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

// ===== Included file units.scad =====
/*
* Basic units.
*
* Originally by Hans Häggström, 2010.
* Dual licenced under Creative Commons Attribution-Share Alike 3.0 and LGPL2 or later
*/


mm = 1;
cm = 10 * mm;
dm = 100 * mm;
m = 1000 * mm;

inch = 25.4 * mm;

X = [1, 0, 0];
Y = [0, 1, 0];
Z = [0, 0, 1];

M3 = 3*mm;
M4 = 4*mm;
M5 = 5*mm;
M6 = 6*mm;
M8 = 8*mm;


// When a small distance is needed to overlap shapes for boolean cutting, etc.
epsilon = 0.01*mm;

// ===== End included file units.scad =====

eps = epsilon;
eps2 = epsilon * 2;

/// Transforms

// Translate t1, rotate r, translate t2
module trt(t2, r, t1 = [0, 0, 0])
{
translate(t2)
rotate(r)
translate(t1)
children();
}

// ===== End included file shortcuts.scad =====
// ===== Included file debug.scad =====
/**
* @file
* @brief Debug functions and modules.
* @author Mike Larson
* @version 576b20d
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

/**
* @brief "echo" utility that can be invoked inside functions
* @sa See OpenSCAD tips and tricks section 5 "Debug"
* https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Tips_and_Tricks#Debug
* @note Set this to enable: $_debug = true;
*/
function debugTap(o, s) = let(
nothing = [ for (i = [1:1]) if ($_debug) echo(str(s, ": ", o)) ]) o;

/**
* @brief Color + modifier command, applies a standard color or
*  one of the modifier characters to the child objects.
*/
module color_mod(color = undef, alpha = undef)
{
function is_valid_str(str) = (str != undef) && (str != "");

module local_color(color, alpha)
{
if(alpha != undef)
color(color, alpha) children();
else
color(color, 1.0) children();
}

if(is_valid_str(color)) {
if(color == "*")            // Doesn't work?
*children();
else if(color == "!")       // Only works once if applied to many
!children();
else if(color == "#")
#children();
else if(color == "%")
%children();
else
local_color(color, alpha)
children();
} else {
children();
}
}

/**
* @brief Similar to color command, except can be disabled and has
* special modifier colors.
*/
module debug_color(color = undef, alpha = undef, debug_enable = false)
{
function is_debug_enabled() = debug_enable;
if(is_debug_enabled()) {
color_mod(color = color, alpha = alpha)
children();
} else {
children();
}
}

/**
* @brief Echo viewport parameters in human readable form and in the
*  command line --camera format.
* @todo Does this belong in debug.scad?
*/
module echo_viewport_params()
{
// WIP $vpf (requires version 2021.01), not needed for --camera
echo(str("Viewport: translate = ", $vpt, " rotate = ", $vpr, " distance = ", $vpd, " FOV = ", $vpf));
echo(str("--camera ", $vpt.x, ",", $vpt.y, ",", $vpt.z, ",",
$vpr.x, ",", $vpr.y, ",", $vpr.z, ",",
$vpd));
}
// ===== End included file debug.scad =====

// ===== Included file pegboard-thing-utils.scad =====
/**
* @file
* @brief Utility modules for pegboard holders
* @author Mike Larson
* @version 8baabaa
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

// ===== Included file shape-functions.scad =====
/**
* @file
* @brief Functions that generate point lists for various shapes.
* @author Mike Larson
* @version 998e25d
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

fshapes_which_test = ""; // ["",circle_points-plot-points,circle_points-polygon,circle_points-echo-CCW-CW,square,isosceles-triangle-angle,isosceles-triangle-height,triangle-rounded-top-test,trapezoid-know-angle,trapezoid-know-height,right-trapezoid-points,parallelogram-test,sc-rect-test]

shape_fcns_sc_rect_test_both_ends = true;
shape_fcns_test_center_flag = true;

/* [Hidden] */

// ===== Included file param.scad =====
/**
* @file
* @brief Parameter fetching utility functions.
* @author Mike Larson
* @version 9c46ee6
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

/**
* @brief Fetch an item from a list, returning defval if the input
*  list is undefined or the item at the index parameter does not
*  exist.
* @note Do not see same functionality in BOSL2/arrays.scad.
* @note Useful when a parameter list has optional items at the end.
*/
function list_fetch_item(lst, index, defval = 0) =
((lst != undef) && (lst[index] != undef)) ? lst[index] : defval;

/**
* @brief If the input params is a scalar, return it. If params is a
*  list and the input index is a valid index for the list, return
*  params[index]. Otherwise return defval.
* @note Similar to list_fetch_item but takes a scalar or a list
*/
function fetch_param(params, index, defval = 0) =
(!is_list(params) && (params != undef)) ? params :
list_fetch_item(params, index, defval);


/**
* @brief If the input 'p' is a number, return it. Otherwise, 'p'
*  must be a list of llen items, in which case, return the item
*  at the input index.
* @note Useful shortcut for when the items in a list of a known size have
*  the same value or when changing an existing function's parameter
*  from a number to a number or a list for backwards compatibility.
*/
function fetch_param_num_or_list_of_n(p, index, llen = 2) =
assert(is_num(p) || (is_list(p) && (len(p) == llen)),
str("p must be a number or a list of ", llen, " items"))
assert(is_num(p) || (index < llen), "invalid index")
is_num(p) ? p : p[index];

// ===== End included file param.scad =====

/**
* @brief Return a list of 2D points that form a square with the input
* width and height.
* @param w width (X)
* @param h height (Y)
* @param r corner radius
* @param o offset
* @param center true = center @ origin, false = in Q1 w/ B/L sides on XY
* @todo Replace w,h -> [w,h]
*/
function square_points(w, h, r = 0, o = [0, 0], center = false) =
let(o2 = center ? o + [-w / 2, -h / 2] : o)
(r == 0) ?
[[o2.x, o2.y], [w + o2.x, o2.y],
[w + o2.x, h + o2.y], [o2.x, h + o2.y]
] :
concat(
//[[o2.x + r, o2.y]],
circle_points(r = r, sa = 270, ea = 360,
offset = [w + o2.x - r, o2.y + r]),
circle_points(r = r, sa = 0, ea = 90,
offset = [w + o2.x - r, h + o2.y - r]),
circle_points(r = r, sa = 90, ea = 180,
offset = [o2.x + r, h + o2.y - r]),
circle_points(r = r, sa = 180, ea = 270,
offset = [o2.x + r, o2.y + r]));

/**
* @brief Return a list of 2D points that form an octogon with the input
* side length.
*/
function octogon_points(side_len) =
let(l2 = sin(45) * side_len) [
[l2, 0], [l2 + side_len, 0], [l2 * 2 + side_len, l2],
[l2 * 2 + side_len, l2 + side_len],
[l2 + side_len, l2 * 2 + side_len],
[l2, l2 * 2 + side_len],
[0, l2 + side_len],
[0, l2]
];

/**
* @brief Return a list of 2D points at intervals 'incr' for a semi-circle of
* radius 'r' starting at angle 'sa' and ending at angle 'ea'. If ea > sa,
* then the points are CCW ordered, otherwise they are CW ordered.
* @note The output number of points is (ea - sa) / incr + 1 if ea > sa.
* @sa arc,circle (thehans/FunctionalOpenSCAD/functional.scad)
*/
function circle_points(r, sa, ea, offset = [0, 0], circ_fa = 5) =
ea > sa ?
[ for(a = [sa : circ_fa : ea]) [r * cos(a), r * sin(a)] + offset ] :
[ for(a = [sa : -circ_fa : ea]) [r * cos(a), r * sin(a)] + offset ] ;

/**
* @brief Semi-circle points + offset.
* @note Useful for building 2D shapes with rounded corners or that are
* built from multiple semi-circles.
* @note depricated, use circle_points
*/
function circle_points_offset(cr, sa, ea, offset, circ_fa = 5) =
let(pts = circle_points(cr, sa, ea, circ_fa = circ_fa))
[ for(i = pts) i + offset ];

/**
* @brief Return points for an isosceles triangle with a rounded apex
* (vertex opposite the base) given triangle height, base width,
* top radius, and possible number of top segments.
* @sa See diagram in design-doc.scad
*/
function triangle_rounded_top_points(height, base_width, top_radius,
circle_fa = 5) =
let(
r = top_radius,
h = height,
half_bw = base_width / 2,

// Height at circle center
h1 = h - r,

// base side of right triangle w/ tip at end of circle,
// other side from x = 0 to h1
w2 = half_bw - r,

// Top angle of same right triangle
// Also angle tangent line at circle diagional line
// intersection
A = atan(w2 / h1),

// Round top
cir_pts = [ let(cp = circle_points(r, A, 180 - A,
circ_fa = circle_fa))
for(i = cp) [i[0], i[1] + h1] ],
// Right line seg
rls_pts = [[0, 0], [half_bw, 0]] ,
// Left line seg
lls_pts = [[-half_bw, 0]]
) concat(rls_pts, cir_pts, lls_pts) ;

/*
* @brief Isosceles triangle points.
* @param b Base length
* @param h Height or undef if A != undef
* @param A Base angle or undef if h != undef
*/
function isosceles_triangle_points(b, h = undef, A = undef, center = false) =
let( b2 = b / 2,
h_ = (h != undef) ? h : tan(A) * b2)
center ?
[[-b2, 0], [b2, 0], [0, h_]] :
[[0, 0], [b, 0], [b2, h_]];

/*
* @brief Isosceles trapezoid points.
* @note Trapezoid top/bottom and front/back sides are parallel,
* left/right sides are not parallel.
* @param sz [bottom_width, top_width, height] if angle undef or
*      [bottom_width, height] if angle defined
* @param off optional offset to add to all XY coordinates (scalar or list)
* @param angle base to side angle
*/
function isosceles_trapezoid_points(sz, angle = undef, off = undef,
center = false) =
let(bw     = sz[0],
height = (angle == undef) ? sz[2] : sz[1],
tw     = (angle == undef) ? sz[1] :
isosceles_trapezoid_top_len(bw, height, angle),
n = (bw - tw) / 2,
offx = (off == undef) ? 0 : (is_list(off) ? off.x : off),
offy = (off == undef) ? 0 : (is_list(off) ? off.y : off),
tx = center ? -bw / 2 : 0,
ty = center ? -height / 2 : 0)

[ [offx + tx, offy + ty], [bw - offx + tx, offy + ty],
[bw - n - offx + tx, height - offy + ty],
[n + offx + tx, height - offy + ty]
];

/*
* The following applies to the isosceles trapezoid shapes.
* Uncentered orientation
*
*     Y
*     |       a (top)
*     |     ____________
*     |    /|           \
*     |   / |            \
*     |  /  | height      \ side leg
*     | /   |              \
*     |/    |           ang \
*     +------------------------ X
*          b (bottom, base)
*/

// Isoceles trapezoid height
// a = top length, b = bottom length, c = side length
function isosceles_trapezoid_height(a, b, c) =
sqrt(pow(c, 2) - pow(b - a, 2) / 4);

// Determine the isosceles trapezoid base to side angle from top length,
// bottom length, and height
// First determine the side length, then the angle from the height
// and the side length
// a = top length, b = bottom length, h = height
function isosceles_trapezoid_angle(a, b, h) =
atan(h / ((b - a) / 2));

// Isoceles trapezoid top length from bottom length, height, and angle
function isosceles_trapezoid_top_len(b, h, angle) = b - (h / tan(angle) * 2);

function isosceles_trapezoid_bot_len(a, h, angle) = a + (h / tan(angle) * 2);

function isosceles_trapezoid_side_len(a, b, h) =
sqrt(pow(h, 2) + pow((b - a) / 2, 2));

/*
* @brief Points of a right trapezoid, which has 2 adjacent right angles.
*  The side with the 2 adjacent right angles is on the bottom.
* @param sz [bottom_width, h1, h2] if angle undef or
*  [bottom_width, h1] if angle defined
* @param angle Base-hypotenuse angle of the triangle formed by the top
*  and a horizontal line that intersects the top/right sides.
* @note h1 = left side, h2 = right side
* @todo h1 < h2
*/
function right_trapezoid_points(sz, angle = undef, off = undef) =
let(
bw = sz[0],
h1 = sz[1],
h2 = (angle == undef) ? sz[2] : (h1 - bw * tan(angle)),
offx = (off == undef) ? 0 : (is_list(off) ? off.x : off),
offy = (off == undef) ? 0 : (is_list(off) ? off.y : off)
)
[ [ offx, offy], [bw + offx, offy],
[bw + offx, h2 + offy], [offx, h1 + offy]
];

/**
* @brief Parallelogram points
*/
function parallelogram_points(sz, angle = 90) =
let(p = [cos(angle) * sz.y, sin(angle) * sz.y])
[[0, 0], [sz.x, 0], [sz.x + p.x, p.y], p];

/**
* @brief One or two semicircles with a rectangle in the middle.
* @param sz [width_including_SC_ends, height]
* @param both_ends true = SC @ both ends, false = SC right end only
* @param center true = rectangle centered, false = shape in +XY
* @note SC diameter = height. If both_ends = false, then width >= height / 2.
*  If both_ends = true, then width >= height
* @todo Rename to racetrack_oval_points to be consistent with racetrack_oval
*  in shape-modules.scad. Note parameters are different though.
*/
function racetrack_oval_points(sz, both_ends = false, center = false) =
let(
height = sz.y,
r = height / 2,
rect_width = sz.x - (both_ends ? height : r),
tx = center ?
(both_ends ? -rect_width / 2 : -sz.x / 2) :
(both_ends ? r : 0),
ty = center ? -height / 2 : 0,
pts = concat(
[[0, 0]],
circle_points_offset(r, 270, 360 + 90, [rect_width, r]),
both_ends ?
circle_points_offset(r, 90, 270, [0, r]) :
[[0, height]]
)
)
[ for(i = pts) i + [tx, ty] ];

// Depricate interface, use racetrack_oval_points instead
function sc_rect_points(sz, both_ends = false, center = false) =
racetrack_oval_points(sz = sz, both_ends = both_ends,
center = center);
/**
* @brief U-shape constructed from line segs.
*/
function u_shape_points_lsegs(width, height, upside_down = false) =
upside_down ?
[[width, 0], [width, height], [0, height], [0, 0]] :
[[0, height], [0, 0], [width, 0], [width, height]];

/**
* @brief U-shape constructed from rectangles.
* @param thickness number or [vert-member-thickness, horz-member-thickness]
*/
function u_shape_points_rects(width, height, thickness, upside_down = false) =

let(vthkns = fetch_param_num_or_list_of_n(thickness, 0),
hthkns = fetch_param_num_or_list_of_n(thickness, 1))

upside_down ?
[[0, 0], [vthkns, 0], [vthkns, height - hthkns],
[width - vthkns, height - hthkns],
[width - vthkns, 0], [width, 0],
[width, height], [0, height]] :

[[0, height], [0, 0], [width, 0], [width, height],
[width - vthkns, height],
[width - vthkns, hthkns],
[vthkns, hthkns], [vthkns, height]];

/**
* @brief U-shape constructed from either line segs (thickness == 0) or
*  rectangles (thickness != 0).
*/
function u_shape_points(width, height, thickness = 0, upside_down = false) =
(thickness == 0) ?
u_shape_points_lsegs(width, height, upside_down) :
u_shape_points_rects(width, height, thickness, upside_down);

module fshapes_test(which, center = false)
{
circle_radius = 10;
sa = 0;
ea = 180;
//  incr = 15;
incr = 10;

module test_point(p, r = 0.1)
{
translate(p) circle(r = r);
}

module draw_trap(sz, angle, height_z, center = true)
{
linear_extrude(height_z)
polygon(
isosceles_trapezoid_points(sz = sz, angle = angle,
center = center)
);
}

if(which == "circle_points-plot-points") {
color("blue")
for(p = circle_points(circle_radius, sa, ea, incr))
test_point(p, 0.2);
} else if(which == "circle_points-polygon") {
polygon(points = circle_points(circle_radius, sa, ea, incr));
} else if(which == "circle_points-echo-CCW-CW") {
//      sa = 270;
//      ea = 360;
sa = 0;
ea = 90;
echo("CCW  = ", circle_points(circle_radius, sa, ea, incr));
echo("CW = ", circle_points(circle_radius, ea, sa, incr));
} else if(which == "square") {
width = 6;
height = 10;
corner_radius = 1;
offsets = [1, 1];
center = shape_fcns_test_center_flag;
%polygon(square_points(w = width, h = height, r = corner_radius,
o = offsets, center = center));
} else if(which == "isosceles-triangle-angle") {
base_len = 10;
angle = 30;
echo(str("Height = ", tan(angle) * (base_len / 2)));
// isosceles triangle w/ angle
polygon(isosceles_triangle_points(base_len, A = angle));
} else if(which == "isosceles-triangle-height") {
base_len = 10;
height = 2.88675;
// isosceles triangle w/ height
polygon(isosceles_triangle_points(base_len, h = height));
} else if(which == "triangle-rounded-top-test") {
triangle_height = 12;
triangle_base_len = 8;
rnd_triangle_top_radius = 2;
polygon(
triangle_rounded_top_points(triangle_height, triangle_base_len,
rnd_triangle_top_radius));
} else if(which == "trapezoid-know-angle") {
// Know bottom, angle, height (H), and thickness (height_z)
height_z = 5;                           // As above
b = 20;                                 // As above
H = 4;                                  // As above
angle = 33;
t = isosceles_trapezoid_top_len(b, H, angle);
//          echo(t = t);
draw_trap([b, t, H], undef, height_z);
} else if(which == "trapezoid-know-height") {
// Know top, bottom, and height H
height_z = 5;                           // As above
b = 20;                                 // As above
H = 4;                                  // As above
d = 8;                                  // Makes angle ~33 deg
angle = isosceles_trapezoid_angle(d, b, H);
//          echo(angle = angle);
draw_trap([b, H], angle, height_z);
} else if(which == "right-trapezoid-points") {
base_len = 10;
angle = 10;
h1 = 5;
h2 = h1 - base_len * tan(angle);
off = undef;
sz1 = [base_len, h1];
sz2 = [base_len, h1, h2];
union() {
polygon(right_trapezoid_points(sz1, angle, off));
translate([base_len * 1.5, 0, 0])
polygon(right_trapezoid_points(sz2, undef, off));
}
} else if(which == "parallelogram-test") {
sz = [10, 5];
angle = 135;
polygon(parallelogram_points(sz, angle));
} else if(which == "sc-rect-test") {
pts = sc_rect_points([10, 5],
both_ends = shape_fcns_sc_rect_test_both_ends,
center = shape_fcns_test_center_flag);
%polygon(pts);
}
}

fshapes_test(fshapes_which_test);

// ===== End included file shape-functions.scad =====
// units.scad already included, not re-including it

// Hook and nub center-to-center separation (inch)
pegboard_hook_nub_separation_in = 1;

// Pegboard hole dameter (inch)
pegboard_hole_diameter_in = 0.25;

// Pegboard thickness (inch)
pegboard_thickness_in = 0.1875;            // [0.0000:0.0005:1.0000]

// Pegboard hole separation (inch)
pegboard_hole_separation_in = 1;

function inch_to_mm(n) = n * inch;

pegboard_hole_diameter = inch_to_mm(pegboard_hole_diameter_in);
pegboard_thickness = inch_to_mm(pegboard_thickness_in);
pegboard_hole_separation = inch_to_mm(pegboard_hole_separation_in);
pegboard_hook_nub_separation = inch_to_mm(pegboard_hook_nub_separation_in);

pgbd_gen_clearance = 0.4;

// Hook/nub shaft diameter
pgbd_hook_nub_shaft_diameter = pegboard_hole_diameter - pgbd_gen_clearance;

pgbd_hook_nub_shaft_length = pegboard_thickness + pgbd_gen_clearance;

// Height of an anchor hook
function pgbd_anchor_hook_height(
hook_nub_shaft_diameter = pgbd_hook_nub_shaft_diameter,
hook_nub_shaft_length = pgbd_hook_nub_shaft_length
) = let(shaft_radius = hook_nub_shaft_diameter / 2)
hook_nub_shaft_diameter +
// rotate_extrude center radius (see below) + shaft radius
(hook_nub_shaft_length - shaft_radius) +
// Cap height
shaft_radius;

// Calculate the width required for 'nanchors' anchors
function pegboard_max_width(nanchors,
hole_spacing = pegboard_hole_separation) =
(nanchors - 1) * hole_spacing +
pegboard_shaft_fillet_radius() * 2;

// Determine first anchor distance from side and distance to next anchor
// placement parameters
function pegboard_anchor_placement(
width,
nanchors,
hole_spacing = pegboard_hole_separation
) =
let(shaft_fillet_radius = pegboard_shaft_fillet_radius(),
usable_width = width - shaft_fillet_radius * 2,
// The +1 because the first hole is @ usable_width = 0
max_holes = floor(usable_width / hole_spacing) + 1,
// First peg @ hole 0
// max_holes - 1 = number of holes left after first one
// nanchors - 1 = number of hooks except first one
// incr must be an integer
incr = (nanchors > 1) ?
(max_holes - 1) / (nanchors - 1) :
0,
// Try to distribute anchors evenly starting from
// left side, placing anchors spaced 1 or more holes
// apart. If this doesn't work, then put all of the
// anchors in the middle.
in_middle = (floor(incr) != incr),
hole_dist = (!in_middle ?
incr :
floor(max_holes / nanchors)) * hole_spacing,
inset = !in_middle ?
(width - ((max_holes - 1) * hole_spacing)) / 2 :
(usable_width - (nanchors - 1) * hole_dist) / 2
)
[inset, hole_dist];

/**
* @brief Draw a round filleted shape
* @param r size of round shape, fillet inside radius
* @param fr height and width of fillet (i.e. fillet radius)
*/
module pgbd_round_fillet_shape(r, fr, fn = 32)
{
$fn = fn;
rotate_extrude() {
translate([r, 0, 0]) {
difference() {
square([fr, fr]);
translate([fr, fr, 0]) circle(r = fr);
}
}
}
}

/**
* @brief Total hook length including the shaft.
*/
function pegboard_hook_length(
pb_thickness = pegboard_thickness + pgbd_gen_clearance,
pb_hole_diameter = pegboard_hole_diameter - pgbd_gen_clearance) =
(pb_thickness + pb_hole_diameter / 2) +     // Hook
pb_thickness;                               // Shaft

/**
* @brief Radius of the fillet at the base of the hook and nub shafts.
*/
function pegboard_shaft_fillet_radius(
pb_hole_diameter = pegboard_hole_diameter - pgbd_gen_clearance) =
let(hd = pb_hole_diameter, hr = hd / 2) 1.25 * hr;

/**
* @brief Models a pegboard anchor hook (top piece) and nub (bottom piece)
* @param which_part "both", "hook", "nub", or "neither"
*/
module anchor_hook_and_nub(hook_nub_separation = pegboard_hook_nub_separation,
hook_nub_shaft_diameter = pgbd_hook_nub_shaft_diameter,
hook_nub_shaft_length = pgbd_hook_nub_shaft_length,
which_part = "both")
{
enable_hook = ((which_part == "both") || (which_part == "hook"));
enable_nub  = ((which_part == "both") || (which_part == "nub"));
hd = hook_nub_shaft_diameter;           // hook diameter
bt = hook_nub_shaft_length;             // board thickness

module cap()
{
// Notes: I originally used a rotated_extruded half-circle
// polygon, but this resulted in a CGAL error (see below).
// So use a sphere instead. Don't bother lopping off the bottom,
// it will be unioned with the shaft or hook anyway.
// Here's the CGAL error;
// ERROR: CGAL error in CGAL_Nef_polyhedron3(): CGAL ERROR: assertion violation! Expr: e->incident_sface() != SFace_const_handle() File: /usr/include/CGAL/Nef_S2/SM_const_decorator.h Line: 329

sphere(r = hd / 2);
}

module shaft(cap_enable = false, fillet_enable = false)
{
union() {
// Shaft centered on X, with its base on the YZ plane and top
// in the -X direction
rotate([0, -90, 0])
union() {
cylinder(h = bt, d = hd, center = false);
if(fillet_enable)
pgbd_round_fillet_shape(hd / 2, hd / 8);
}
if(cap_enable)
translate([-bt, 0, 0])
rotate([0, -90, 0])
cap();
}
}

module hook()
{
union() {
// Move back to union with shaft/nub
translate([-bt, 0, 0])
// Hook shape bottom circle centered on X, top in +Y
translate([0, bt, 0])
union() {
// Hook shape in Q3
rotate([0, 0, 180])
// Hook shape in Q1
rotate_extrude(angle = 90)
translate([bt, 0, 0])
circle(d = hd);
translate([-bt, 0, 0])
rotate([-90, 0, 0])
cap();
}
shaft(fillet_enable = true);
}
}

union() {
// Hook
if(enable_hook)
translate([0, pegboard_hook_nub_separation, 0])
hook();
// Nub
if(enable_nub)
shaft(cap_enable = true, fillet_enable = true);
}
}

// ===== End included file pegboard-thing-utils.scad =====
// ===== Included file pegboard-hooks.scad =====
/**
* @file
* @brief Pegboard hooks
* @author Mike Larson
* @version 4c6fffb
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

// Default parameters

// Hook length (mm)
pgbd_dflt_hook_length = 25;                          // [0.0:0.1:1000.0]

// Hook diameter (mm)
pgbd_dflt_hook_diameter = 5;                         // [0.0:0.1:100.0]

// Hook angle (deg)
pgbd_dflt_hook_angle = 2;                            // [0.0:0.1:90.0]

// Number of (front) hooks
pgbd_dflt_num_hooks = 1;                             // [1:50]

// Number of anchor hooks
pgbd_dflt_num_anchor_hooks = 1;                      // [1:10]

// For num_hooks > 1, gap length = hook side-to-side distance
pgbd_dflt_hook_s2s_separation = 6;                   // [0.0:0.1:100.0]

// Hook edge to back plate top distance
pgbd_dflt_hook_offset_to_top = 0;                    // [-100.0:0.1:100.0]

// Minimum hook side to back plate side distance
pgbd_dflt_hook_dist_to_side = 4;                     // [0.0:0.1:100.0]

// Anchor hook edge to back plate edge distance
pgbd_dflt_anchor_hook_offset_to_edge = 1.2;          // [0.0:0.1:100.0]

// Tip arc radius (mm)
pgbd_dflt_hook_tip_radius = 4;                       // [0.0:0.1:100.0]

// Tip arc angle (deg)
pgbd_dflt_hook_tip_angle = 30;                       // [0.0:0.1:90.0]

// Back plate thickness (mm)
pgbd_default_hook_back_plate_thickness = 2.4;        // [0.0:0.1:1000.0]

// Back plate corner rounding (mm)
pgbd_dflt_hook_back_plate_corner_rounding = 1.0;     // [0.0:0.1:10.0]

// Small taper around middle edges
pgbd_dflt_hook_back_plate_taper = 0.4;               // [0.0:0.1:10.0]

// + value makes anchors longer/narrower, - value makes anchors shorter/fatter
pgbd_dflt_hook_anchor_extra_clearance = 0.0;         // [-10.0:0.1:10.0]

// shortcuts.scad already included, not re-including it
// pegboard-thing-utils.scad already included, not re-including it

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

// ===== End included file pegboard-hooks.scad =====
// ===== Included file pegboard-tray.scad =====
/**
* @file
* @brief Pegboard tray with up-sloped front lip
* @author Mike Larson
* @version ac26d3a
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


// units.scad already included, not re-including it
// shortcuts.scad already included, not re-including it
// pegboard-thing-utils.scad already included, not re-including it


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

// ===== End included file pegboard-tray.scad =====
// ===== Included file pegboard-tool-and-cup-holder.scad =====
/**
* @file
* @brief Pegboard tool or small cup holder - basically a pegboard tray
*  with evenly spaced holes.
* @author Mike Larson
* @version 2f489e3
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
* @note Uses: 1) tool holder or 2) insert small condiment cups into holes
*  and use as small parts holder
*/

// ===== Included file duplicate-shapes.scad =====
/**
* @file
* @brief Arrange a list polgon-ized paths or objects in a specified pattern.
* @author Mike Larson
* @version 5ae3656
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
* @note TBR alternative names arrange, place_shape, shape_gen, shape_pattern, ...
* @sa BOSL2/distributors.scad
*/

// shortcuts.scad already included, not re-including it
// shape-functions.scad already included, not re-including it

/**
* @param Converts an offset relative to the right (positive) edge of a box
*  to an offset relative to the Y axis
* @note Useful when mirroring about YX plane (normal vector = [1, 0, 0]
*/
function ds_edge_to_center(dist, width, centered = true) =
centered ? (width / 2 - dist) : (width - dist);

function ds_bottom_to_center(dist, height, centered = true) =
centered ? (dist - height / 2) : dist;

// Center point convenience functions

function ds_center_point(sz) = sz / 2;
function ds_center_point_x_off(cp) = cp.x;
function ds_center_point_y_off(cp) = cp.y;
function ds_center_point_x(cp) = [cp.x, 0];
function ds_center_point_y(cp) = [0, cp.y];

/*
* Start/end/length <-> offset/inset/length conversion functions
*/

/**
* @brief Convert start/end/length -> offset/inset
*/
function ds_sel_to_oi(start, end, length) =
[start + end - length, length - end];

/**
* @brief Convert offset/inset/length -> start/end
*/
function ds_oil_to_se(offset, inset, length) =
[offset + inset, length - inset];


module ds_basic_shape(path, offsets, index)
{
o2 = is_undef(offsets) ? [0, 0, 0] : offsets;
translate(o2)
if(path != undef)
polygon(path);
else
children(index);
}

/**
* @brief Duplicate the child object evenly spaced in a line in the specified
*  direction.
* @param count Number of child object instances
* @param length Line length
* @param direction Direction vector
* @param offset Starting offset
* @param inset Offset inwards (both ends)
* @param inset Offset inwards (both ends)
* @sa BOSL2 distributors.scad
* @todo rename to position_in_line
* @note Derived from replicate_in_line (position.scad)
*/
module duplicate_in_line(
count,
length,
direction = [1, 0, 0],
offset = 0,
inset = 0,
path = undef,
index = 0,                  // Child index
debug = false)
{
my_name = "duplicate_in_line";
se = ds_oil_to_se(offset, inset, length);
start = se[0];
end = se[1];

module info()
{
echo(str(my_name, ": length = ", length));
echo(str(my_name, ": start = ", start));
echo(str(my_name, ": end = ", end));
}

module txlt(direction, d)
{
if(debug)
echo(str(my_name, ".txlt: d = ", d));
t = [d * direction[0], d * direction[1], d * direction[2]];
translate(t) children(0);
}

module distribute(count, length, direction)
{
if(debug)
echo(str(my_name, ".distribute: length = ", length));
for(i = [0 : count - 1])
txlt(direction, length / (count - 1) * i) children(0);
}

if(debug)
info();

txlt(direction, start)
//length - start - (length - end) = end - start
distribute(count, end - start, direction)
ds_basic_shape(path, offsets = undef, index = index)
children(index);
}

/**
* @brief Arrange one or more copies of a path or child object according to
*  the input shape parameters.
* @param shape_params [pattern-specifier, count, bounding-box, shape-offsets, pattern-specific, path]
* @param index Child index used by duplicate_shapes
* @param mv move vector [X, Y, Z] applied to all shape instances after dup'ing
* @note All shape_params are optional, use undef as place holder
* @note Path, if present, is polygon-ized
*
* pattern-specifier item: "mirror", (rectangular) "corners", "center", "line",
*  undef (single copy of path/child, offset by offsets shape_params item)
*  TBD "circle" (count, radius/length ([sa, ea])
* bounding-box item:
*  line: [length, 0]
*  undef: N/A
*  others: [bb_size_x, bb_size_y]
* shape-offsets item: applied to each shape instance individually
*  line: [offset, inset]
*  others: translate each path/child by [X, Y, Z]
* pattern-specific item:
*  mirror: mirror vector, [X, Y, Z], same as OpenSCAD mirror parameter
*  corners: [X, Y] bounding box sizes
*              TBR start_angle per position.scad, but should be optional
*              to disable rotation
*  line: direction vector [X, Y, Z]
*  center, undef: N/A
* center-point: additional pattern-specific parameter used by "mirror"
*  and "center".
*  mirror: definies the origin which the shape is mirrored about
*  center: this is just another offset, which would likely be calculated by
*  ds_center_point.
*
*/
module duplicate_shape(shape_params, index = 0, mv = [0, 0, 0])
{
pattern = shape_params[0];          // placement specifier or undef
count   = shape_params[1];          // # of objects to place
box_sz  = shape_params[2];          // bounding box size
shape_offsets_in = shape_params[3]; // [X, Y, Z], [X, Y], [X], or undef
pattern_params = shape_params[4];   // pattern specific or undef
path = shape_params[5];             // path or undef

shape_offsets = is_undef(shape_offsets_in) ? [0, 0, 0] : shape_offsets_in;

module pattern_select(path, offsets, pattern, pattern_params, index)
{
// Note: position module (position.scad) has the following types:
// "circle", "rectangle", "line"
if(pattern == "mirror") {
cp = [box_sz.x / 2, box_sz.y / 2];
mv = pattern_params;
union() {
// vmul (see BOSL2/vectors.scad)
//cp2 = vmul([cp.x, cp.y, 0], mv);
cp2 = [for(i = [0 : 1 : len(cp) - 1]) cp[i] * mv[i]];
translate(cp2)
ds_basic_shape(path, offsets, index)
children(index);
mirror(mv)
translate(cp2 * -1)
ds_basic_shape(path, offsets, index)
children(index);
}
} else if(pattern == "corners") {
// TBD use count for # corners (default 0 = 4 corners)
// TBd module duplicate_at_corners
// Note: positive offsets are inward from corners
assert(!is_undef(box_sz));
// TBD can this be generalized for count > 2?
//           LL      LR       TR        TL
crnr_offs = [[1, 1], [-1, 1], [-1, -1], [1, -1]];
crnr_ll_off = [0, 0];
txy = [[0, 0], [box_sz.x, 0], [box_sz.x, box_sz.y], [0, box_sz.y]];
union() {
for(i = [0 : len(txy) - 1])
let(t_unoffset = txy[i] + crnr_ll_off,
o = offsets,
t_offset = [for(j = [0 : 1]) o[j] * crnr_offs[i][j]])
translate(t_unoffset)
// TBD rotate (e.g. shape is not a cylinder)
ds_basic_shape(path, t_offset, index)
children(index);
}
} else if(pattern == "center") {
cp = [box_sz.x / 2, box_sz.y / 2];
translate(cp)
ds_basic_shape(path, offsets, index)
children(index);
} else if(pattern == "line") {
// ["line", count, [length, 0], [offset, inset], direction-vector,
//  path]
direction = pattern_params;
duplicate_in_line(
count = count,
length = box_sz.x,
direction = direction,
offset = offsets[0],
inset = offsets[1],
path = path);
} else {
ds_basic_shape(path, offsets, index)
children(index);
}
}

translate(mv)
pattern_select(path, shape_offsets, pattern, pattern_params, index)
children(index);
}

/**
* @brief Arrange a list paths or child objects in a specified pattern
* @param shape_params List of shape parameters (see duplicate_shape for format)
* @param offset Offset for final translation
*/
module duplicate_shapes(shape_params, offset = [0, 0, 0], mv = [0, 0, 0])
{
translate(offset)
for(i = [0 : len(shape_params) - 1])
duplicate_shape(shape_params[i], index = i, mv = mv)
children(i);
}

// ===== End included file duplicate-shapes.scad =====
// pegboard-tray.scad already included, not re-including it

/**
* @brief Pegboard cup or tool holder
* @param hole_diameter Diameter of each hole
* @param hole_count Number of holes
* @param hole_spacing Distance between 2 hole edges (default = hole dia. / 2)
* @param hole_s2s_inset Distance between holder sides and outer hole edges
* @param hole_f2b_inset Distance between holder front/back and hole edges
* @param tray_width Overrides auto width calculation based on hole params
* @param tray_height Tray back height (default = pgbd_dflt_tray_height)
* @param tray_thickness Tray bottom, back, and side thickness
* @param tray_lip_len Length of upward tilting lip if tray_lip_angle > 0
* @param tray_lip_angle Antle of upward tilting lip if tray_lip_len > 0
* @param tray_side_top_horiz_len Top, back side length
* @param num_anchors Number of anchors (and nubs)
* @param anchor_hook_offset_from_top Anchor top to tray top distance
* @param hook_nub_separation Hook and nub center-to-center separation (inch)
* @param hook_nub_shaft_diameter Hook/nub shaft diameter
*/
module pegboard_tool_and_cup_holder(
hole_diameter,
hole_count,
hole_spacing = undef,
hole_s2s_inset = undef,
hole_f2b_inset = undef,
hole_xoffset = 0,                // not used
tray_width = undef,
tray_height = pgbd_dflt_tray_height,
tray_thickness = pgbd_dflt_tray_thickness,
tray_lip_len = 0,
tray_lip_angle = 0,
tray_side_top_horiz_len = undef,
num_anchors = pgbd_dflt_tray_num_anchors,
anchor_hook_offset_from_top =
pgbd_dflt_tray_anchor_hook_offset_from_top,
hook_nub_separation = pegboard_hook_nub_separation,
hook_nub_shaft_diameter = pgbd_hook_nub_shaft_diameter)
{
hole_spacing2 = is_undef(hole_spacing) ? hole_diameter / 2 : hole_spacing;
hole_s2s_inset2 = is_undef(hole_s2s_inset) ?
hole_spacing2 / 2 : hole_s2s_inset;
tw_fr_hl_prms = hole_diameter * hole_count +
hole_spacing2 * (hole_count - 1) +
hole_s2s_inset2 * 2 + hole_xoffset + tray_thickness * 2;
tray_width2 = is_undef(tray_width) ?
tw_fr_hl_prms :
max(tw_fr_hl_prms, tray_width);
td_fr_hl_prms = hole_diameter * 2;
tray_depth2 = is_undef(hole_f2b_inset) ?
td_fr_hl_prms :
hole_f2b_inset * 2 + hole_diameter + tray_thickness;

tray_side_top_horiz_len2 = is_undef(tray_side_top_horiz_len) ?
tray_depth2 / 2 :
tray_side_top_horiz_len;

// Minimum length needed for hook & nub. If requested height < min,
// then hook only (no nub).
min_hgt_for_hk_and_nb = hook_nub_separation + hook_nub_shaft_diameter +
anchor_hook_offset_from_top;
which_anchor_part = (tray_height >= min_hgt_for_hk_and_nb) ?
"both" : "hook";

difference() {
pegboard_tray(
width = tray_width2,
depth = tray_depth2,
height = tray_height,
thickness = tray_thickness,
lip_len = tray_lip_len,
lip_angle = tray_lip_angle,
side_top_horiz_len = tray_side_top_horiz_len2,
num_anchors = num_anchors,
anchor_hook_offset_from_top = anchor_hook_offset_from_top,
hook_nub_separation = hook_nub_separation,
hook_nub_shaft_diameter = hook_nub_shaft_diameter,
which_anchor_part = which_anchor_part);

// Holes centered on Y -> holes centered mid front-to-back on tray
// The * 2 below is to workaround Z fighting seen at certain angles
// when zoomed out
// TBD account for lip_len > 0
translate([tray_depth2 / 2, 0, -eps * 2])
// Tray back is along Y, so rotate holes accordingly
rotate([0, 0, 90])
duplicate_in_line(
count = hole_count,
length = tray_width2,
inset = hole_s2s_inset2 + hole_diameter / 2)
cylinder(d = hole_diameter, h = tray_thickness + eps2 * 2);
}
}
// ===== End included file pegboard-tool-and-cup-holder.scad =====
// ===== Included file pegboard-1s-6in1-charger-holder.scad =====
/**
* @file
* @brief Pegboard 1S 6in1 battery charger holder.
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

// shortcuts.scad already included, not re-including it
// pegboard-thing-utils.scad already included, not re-including it

/**
* @brief Place 4 copies of the child object offset by 'o' from the corners
* of the rectangle with width 'x', height 'y'. Translate up/down the Z axis
* per the 'z' parameter.
* @param x Rectangle width
* @param y Rectangle height
* @param z Up/down translation
* @param o X and Y or [X, Y] offsets from the rectangle corners
* @param center true = centered around [0,0,0], false = Q1, 1 corner @ [0,0,0]
* @note From replicate-and-position.scad, latest copy/paste in
*  adjustable-motor-mount.scad. Implemented center = false, implemented
*  [ox, oy], reorder center=true points
*/
module draw4corners(x, y, z = 0, o = 0, center = true)
{
ox  = is_list(o) ? o.x : o;
oy  = is_list(o) ? o.y : o;
xmo  = x - ox;
ymo  = y - oy;
x2o = (x / 2) - ox;
y2o = (y / 2) - oy;
points = center ?
[[-x2o, -y2o, z], [x2o, -y2o, z], [x2o, y2o, z], [-x2o, y2o, z]] :
[[ox, oy, z], [xmo, oy, z], [xmo, ymo, z], [ox, ymo, z]];
for(i = [0 : 3])
translate(points[i]) children(0);
}

/**
* @brief The charger support plate, flat on XY
*/
module pgbd_chrgr_hldr_support_plate_flat(
chrgr_width,
chrgr_height,
support_thickness,
tilt_angle,
rim_width,
lip_height,
width_foot_to_foot,
height_foot_to_foot,
foot_diameter,
bot_to_xt60_bot,
bottom_plate_clearance,
hole_clearance,
)
{
bottom_plate_width = chrgr_width + bottom_plate_clearance;
bottom_plate_height = chrgr_height + bottom_plate_clearance;
support_side_height = bot_to_xt60_bot + support_thickness;

// holes for feet
hole_x_inset = (bottom_plate_width - width_foot_to_foot) / 2;
hole_y_inset = (bottom_plate_height - height_foot_to_foot) / 2;

echo(hole_x_inset = hole_x_inset);
echo(hole_y_inset = hole_y_inset);

module side(m)
{
sup_thk = support_thickness;
side_extra_top = support_side_height * tan(tilt_angle);
// As looking from side
// Front to back width
bot_width = (bottom_plate_height + sup_thk * 2);
top_width = bot_width + side_extra_top;
// Top to bottom height
height = support_side_height;
pts = [[0, 0], [bot_width, 0], [top_width, height], [0, height]];
trt([-sup_thk + m * (bottom_plate_width + sup_thk), -sup_thk, 0],
[90, 0, 90])
linear_extrude(sup_thk)
polygon(pts);
}

module front_lip()
{
sup_thk = support_thickness;
translate([-sup_thk, -sup_thk, 0])
cube([bottom_plate_width + sup_thk * 2, sup_thk, lip_height]);
}

module rim_cutout()
{
rw   = rim_width;
hcl  = hole_clearance;
hcl2 = hcl / 2;
rwhx = rw + hole_x_inset + hcl2;
rwhy = rw + hole_y_inset + hcl2;
bpw  = bottom_plate_width;
hgt  = bottom_plate_height;
pts = [
[rw, rwhy], [rwhx, rwhy], [rwhx, rw],
[bpw - rwhx, rw], [bpw - rwhx, rwhy], [bpw - rw, rwhy],
[bpw - rw, hgt - rwhy], [bpw - rwhx, hgt - rwhy],
[bpw - rwhx, hgt - rw],
[rwhx, hgt - rw], [rwhx, hgt - rwhy], [rw, hgt - rwhy]
];
cr = foot_diameter / 2;
// The * 2 below is to workaround Z fighting seen at certain angles
// when zoomed out
translate([0, 0, -eps * 2])
linear_extrude(support_thickness + eps2 * 2)
offset(-cr) offset(cr)      // round inside corners
polygon(pts);
}

// A little extra at the support plate top to account for tilt_angle
// TBD - a little more so the lower right corner goes all the
// way to the back
sp_extra_top = support_thickness * tan(tilt_angle);

translate([support_thickness, support_thickness, 0]) {
difference() {
union() {
// The plate that the charger rests upon
cube([bottom_plate_width, bottom_plate_height + sp_extra_top,
support_thickness]);
// Front lip
front_lip();
// Left side
side(0);
// Right side
side(1);
}
// holes for feet
draw4corners(bottom_plate_width, bottom_plate_height, -eps,
[hole_x_inset, hole_y_inset], center = false)
cylinder(d = foot_diameter + hole_clearance,
h = support_thickness + eps2);
// Rim cutout
rim_cutout();
}
}
}

/**
* @brief Back plate that supports the charger holder and pegboard
*  anchors.
*/
module back_plate_and_anchors(
chrgr_width,
chrgr_height,
support_thickness,
tilt_angle,
num_anchor_hooks,
anchor_hook_offset_to_edge,
corner_rounding,
bottom_plate_clearance,
)
{
// Back plate height based on pegboard anchors and offset to edge
back_plate_height = pegboard_hole_separation +
pegboard_shaft_fillet_radius() * 2 +
anchor_hook_offset_to_edge * 2;

bottom_plate_width = chrgr_width + bottom_plate_clearance;
bottom_plate_height = chrgr_height + bottom_plate_clearance;

// Support plate - what the charger sits on top of
support_plate_height = bottom_plate_height + support_thickness;
// Back plate width based on charger width and side supports
back_plate_width = bottom_plate_width + support_thickness * 2;
anchor_fillet_radius = pegboard_shaft_fillet_radius();

sup_thk = support_thickness;

ty = support_plate_height * sin(90 - tilt_angle);

module back_plate(ty, anchor_start, anchor_incr)
{
// cube for plate, center = false,
// trt([0, ty, 0], [90, 0, 0]) to put behind charger holder
cr = corner_rounding;
width = back_plate_width;
height = back_plate_height;

points = concat(
[[0, 0], [width, 0]],
circle_points_offset(cr, 0, 90, [width - cr, height - cr]),
circle_points_offset(cr, 90, 180, [cr, height])
);
trt([0, ty + sup_thk, -0], [90, 0, 0])
linear_extrude(sup_thk + eps2)
polygon(points);
}

num_anchor_hooks = num_anchor_hooks;
// Anchors
// Reorient from nub centered on X, extending from 0 into -X,
// hook 1" above nub in +Y direction
// to nub centered on Y, extending from 0 into +Y,
// hook 1" above nub in +Z direction
// trt([tx, ty, 0], [90, 0, -90]) to put behind charger holder
// offset appropriately in X direction
anchor_placement = pegboard_anchor_placement(bottom_plate_width,
num_anchor_hooks);
start = num_anchor_hooks > 1 ?
anchor_placement[0] :
bottom_plate_width / 2;
incr  = anchor_placement[1];

back_plate(ty, start, incr);

for(i = [0 : num_anchor_hooks - 1])
translate([start + (incr * i), ty + sup_thk, anchor_fillet_radius])
rotate([90, 0, -90])
anchor_hook_and_nub(which_part = "both");
}

/**
* @brief Supports under the battery holder plate.
*/
module bottom_side_supports(
chrgr_width,
chrgr_height,
support_thickness,
tilt_angle,
rim_width,
bottom_plate_clearance
)
{
bottom_plate_width = chrgr_width + bottom_plate_clearance;
bottom_plate_height = chrgr_height + bottom_plate_clearance;

// Support plate - what the charger sits on top of
support_plate_height = bottom_plate_height + support_thickness;
// Back plate width based on charger width and side supports
back_plate_width = bottom_plate_width + support_thickness * 2;
base_len = support_plate_height * cos(tilt_angle);
height = support_plate_height * sin(tilt_angle);

// m = 1 = left size, m = 0 = right side
module one_support(m)
{
tx = support_thickness + (back_plate_width - support_thickness) * m;
rw = rim_width;
// 'L' shape
points = [ [0, 0], [base_len, 0], [base_len, rw],
[rw, rw], [rw, height], [0, height] ];
trt([tx, base_len, 0], [90, 0, -90])
linear_extrude(support_thickness)
polygon(points);
}
union() {
one_support(0);
one_support(1);
}
}

/**
* @brief Holder for a small 6 x 1s battery charger.
*/
module pegboard_6in1_battery_charger_holder(
chrgr_width,
chrgr_height,
support_thickness,
tilt_angle,
rim_width,
lip_height,
width_foot_to_foot,
height_foot_to_foot,
foot_diameter,
bot_to_xt60_bot,
num_anchor_hooks,
anchor_hook_offset_to_edge,
corner_rounding,
bottom_plate_clearance,
hole_clearance,
)
{
module charger_holder()
{
union() {
rotate([tilt_angle, 0, 0])
pgbd_chrgr_hldr_support_plate_flat(
chrgr_width = chrgr_width,
chrgr_height = chrgr_height,
support_thickness = support_thickness,
tilt_angle = tilt_angle,
rim_width = rim_width,
lip_height = lip_height,
width_foot_to_foot = width_foot_to_foot,
height_foot_to_foot = height_foot_to_foot,
foot_diameter = foot_diameter,
bot_to_xt60_bot = bot_to_xt60_bot,
bottom_plate_clearance = bottom_plate_clearance,
hole_clearance = hole_clearance
);
back_plate_and_anchors(
chrgr_width = chrgr_width,
chrgr_height = chrgr_height,
support_thickness = support_thickness,
tilt_angle = tilt_angle,
num_anchor_hooks = num_anchor_hooks,
anchor_hook_offset_to_edge = anchor_hook_offset_to_edge,
corner_rounding = corner_rounding,
bottom_plate_clearance = bottom_plate_clearance
);
bottom_side_supports(
chrgr_width = chrgr_width,
chrgr_height = chrgr_height,
support_thickness = support_thickness,
tilt_angle = tilt_angle,
rim_width = rim_width,
bottom_plate_clearance = bottom_plate_clearance
);
}
}

charger_holder();
}
// ===== End included file pegboard-1s-6in1-charger-holder.scad =====
// ===== Included file pegboard-loop-shaped-holder.scad =====
/**
* @file
* @brief Pegboard loop for holding stepped rectangular objects.
* @author Mike Larson
* @version 4f8e12c
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


// shortcuts.scad already included, not re-including it
// pegboard-thing-utils.scad already included, not re-including it


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
// ===== End included file pegboard-loop-shaped-holder.scad =====
// ===== Included file pegboard-spacer.scad =====
/**
* @file
* @brief Pegboard spacer
* @author Mike Larson
* @version 28b516f
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
* @note The pegboard spacers go behind a pegboard sheet. The spacers
*  have enough height (3/4" by default) to allow for pegboard hook
*  insertion. Each spacer has a center hole for securing the pegboard
*  and spacers to a wall using wood screws.
*/

// Pegboard spacer (outer) rim diameter (mm)
pgbd_dflt_spacer_rim_od = 25.4;                         // [0.0:0.1:1000.0]

// Pegboard spacer middle outside diameter (mm)
pgbd_dflt_spacer_mid_od = 18;                           // [0.0:0.1:1000.0]

// Pegboard spacer inside diameter (mm)
pgbd_dflt_spacer_id = 4;                                // [0.0:0.1:1000.0]

// Pegboard spacer height (mm)
pgbd_dflt_spacer_height = 19.05;                        // [0.0:0.1:100.0]

// Pegboard spacer rim height (mm)
pgbd_dflt_spacer_rim_height = 2;                        // [0.0:0.1:100.0]


/**
* @brief Spacer that goes between a pegboard and wall and gives enough
*  clearance for pegboard hook insertion.
* @param rim_od Spacer top/bottom rim outside diameter
* @param mid_od Spacer mid section outside diamete
* @param id Spacer hole diameter
* @param id Spacer height
* @param rim_height Spacer rim height
* @note The spacer looks like a spool
*/
module pegboard_spacer(rim_od, mid_od, id, height, rim_height, center = true)
{
ir = id / 2;
rim_r = rim_od / 2;
mid_r = mid_od / 2;
rr = rim_height / 2;
circ_fa = 5;

function half_circle_points(r, sa, ea, fa, offset) =
[ for(a = [sa : fa : ea]) [r * cos(a), r * sin(a)] + offset ];

spool_pts =
concat(
[[ir, 0], [rim_r - rr, 0]],
half_circle_points(rr, 270, 360 + 90, circ_fa, [rim_r - rr, rr]),
[[mid_r, rim_height]],
[[mid_r, height - rim_height]],
half_circle_points(rr, 270, 360 + 90, circ_fa,
[rim_r - rr, height - rr]),
[[ir, height]]);

rotate_extrude($fn = 64)
polygon(spool_pts);
}

// ===== End included file pegboard-spacer.scad =====
// ===== Included file pegboard-spacer-support.scad =====
/**
* @file
* @brief Pegboard spacer and bottom support combination.
* @author Mike Larson
* @version 99e4615
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


// shortcuts.scad already included, not re-including it
// units.scad already included, not re-including it

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

// ===== End included file pegboard-spacer-support.scad =====
// ===== Included file pegboard-to-shelf-standard.scad =====
/**
* @file
* @brief Shelf standard to pegboard guide hook.
* @author Mike Larson
* @version 4f8e12c
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
* @note The shelf standard to pegboard guide hook helps support a
*  pegboard at the top. The hook part is inserted into a shelf standard
*  bracket (the thing that screws into a wall and has holes for shelf
*  brackets). The flat part of the guide with a large oval shaped hole
*  in the middle is attached to the pegboard using two screws and nuts.
*  See also pegboard-spacer-support.scad which supports the bottom of
*  the pegboard.
*/

// Adapter Parameters

// U-shaped hook height (mm)
pgbd_s2pbh_dflt_hook_height = 9;                        // [0.0:0.1:100.0]

// U-shaped hook front-to-back thickness (mm)
pgbd_s2pbh_dflt_hook_thickness = 3.2;                   // [0.0:0.1:100.0]

// Staff extends hook on one side (mm)
pgbd_s2pbh_dflt_staff_height = 3.2;                     // [0.0:0.1:100.0]

// Hook corner radius
pgbd_s2pbh_dflt_hook_cr = 0.2;                          // [0.0:0.1:10.0]

// Front plate height (mm), if 0, then calculate automatically
pgbd_s2pbh_dflt_front_plate_height = 0;                 // [0.0:0.1:100.0]

// Front plate thickness (mm)
pgbd_s2pbh_dflt_front_plate_thickness = 3.2;            // [0.0:0.1:100.0]

// Front plate fastener mounting hole width, default is for 4 holes + a bit
pgbd_s2pbh_dflt_front_plate_hole_width_in = 3.5;        // [0.0:0.1:10.0]

// Front plate hole to edge length (mm), default makes width 100mm
pgbd_s2pbh_dflt_front_plate_hole_to_edge_len = 5.55;    // [0.0:0.1:100.0]

// Extra double wedge support in front
pgbd_s2pbh_dflt_front_support_thickness = 0.4;          // [0.0:0.1:10.0]

// Hook side-side and inside width clearance
pgbd_s2pbh_dflt_gen_clearance = 0.4;                    // [0.0:0.1:10.0]


// units.scad already included, not re-including it
// shape-functions.scad already included, not re-including it
// shortcuts.scad already included, not re-including it
// pegboard-thing-utils.scad already included, not re-including it


function inch_to_mm(i) = i * inch;

function pgbd_s2pbh_hook_points(thickness, hook_inside_width,
hook_height, staff_height, cr) =
let(
w1 = hook_inside_width + thickness,
w2 = hook_inside_width + thickness * 2,
ht = hook_height + staff_height,
thck = thickness
)
concat(
[ [w1, 0], [w2, 0] ],
[ [w2, ht ] ],
circle_points_offset(cr, 90, 180, [cr, ht - cr]),
circle_points_offset(cr, 180, 270, [cr, staff_height + cr]),
circle_points_offset(cr, 270, 360,
[thck - cr, staff_height + cr]),
circle_points_offset(cr, 180, 90, [thck + cr, ht - thck - cr]),
circle_points_offset(cr, 90, 0, [w1 - cr, ht - thck - cr])
);



/**
* @brief Hook and front plate peg-board to shelf standard attachment
* @param print_orientation T = print orientation, F = display orientation
* @note print_orientation if true, standing up on short face plate edge
*  with supports under hooks. If false, display orientation = standing
*  up on long face plate edge, hooks on top, everything except wedge
*  in Q1.
*/
module pegboard_to_shelf_standard(
front_plate_hole_width,
front_plate_hole_to_edge_len,
front_plate_height,
front_plate_thickness,
front_support_thickness,
hook_height,
staff_height,
hook_thickness,
peg_board_hole_diameter,
peg_board_thickness,
peg_board_top_to_hole_center,
shelf_standard_slot_width,
shelf_standard_slot_separation,
shelf_standard_wall_thickness,
hook_cr = pgbd_s2pbh_dflt_hook_cr,
clearance = pgbd_s2pbh_dflt_gen_clearance,
print_orientation = false)
{
cr = hook_cr;
fp_height = (front_plate_height > 0) ?
front_plate_height :
peg_board_top_to_hole_center * 2;
front_plate_width = front_plate_hole_width  +
front_plate_hole_to_edge_len * 2;
hook_width = shelf_standard_slot_width - clearance;
hook_total_height = hook_height + staff_height;
hook_inside_width = peg_board_thickness + shelf_standard_wall_thickness +
clearance;
hook_outside_width = hook_inside_width + hook_thickness * 2;


module hook()
{
pts = pgbd_s2pbh_hook_points(
hook_thickness,
hook_inside_width,
hook_height,
staff_height,
cr
);
// echo(peg_board_thickness = peg_board_thickness);
// echo(shelf_standard_wall_thickness = shelf_standard_wall_thickness);
// Center on XY plane
width = hook_width;
translate([0, 0, -width / 2])
linear_extrude(width)
polygon(pts);
}

module front_plate()
{
// Long rectangular 2D hole w/ rounded ends, height = pegboard
// hole diameter, width = front_plate_hole_width. Width along X,
// height/diameter along Y
module front_plate_hole()
{
pts =
let(
d = peg_board_hole_diameter,
r = d / 2,
hw = front_plate_hole_width,
cpts_270_90 = circle_points(r, 270, 360 + 90),
cpts_90_270 = circle_points(r, 90, 270)
)
concat(
[ for(i = cpts_270_90) i + [hw - r, 0] ],
[ for(i = cpts_90_270) i + [r, 0] ]
);
// The * 2 below is to workaround Z fighting seen at certain
// angles when zoomed out

trt([0, front_plate_thickness + eps * 2, 0], [90, 0, 0])
linear_extrude(front_plate_thickness + eps2 * 2)
polygon(pts);
}

trt([front_plate_thickness, 0, front_plate_width / 2], [0, 90, 90]) {
difference() {
cube([front_plate_width, front_plate_thickness, fp_height],
center = false);
tx = (front_plate_width - front_plate_hole_width) / 2;
tz = (fp_height) / 2;
translate([tx, 0, tz])
front_plate_hole();
}
}
}

// Sits in between hooks, on top of front plate, for extra hook support
module hook_support1(width, height, thickness)
{
translate([thickness / 2, height / 2, 0])
cube([thickness, height, width], center = true);
}

// Double wedge in front of hooks, 1/2 on front plate surface
// and 1/2 on hook_support1
module hook_support2(width, height, thickness)
{
h2 = height / 2;
pts = [[0, -h2], [thickness, 0], [0, h2]];
translate([0, 0, -width / 2])
linear_extrude(width)
polygon(pts);
}


// Drawn with hooks flat on plane parallel to XY, front plate surface
// parallel to YZ
module std_to_pgbd_hk()
{
union() {
ty = fp_height - hook_height;
translate([0, ty, shelf_standard_slot_separation / 2])
hook();
translate([0, ty, -shelf_standard_slot_separation / 2])
hook();
tx = peg_board_thickness + shelf_standard_wall_thickness +
clearance + hook_thickness;
translate([tx, fp_height, 0])
hook_support1(shelf_standard_slot_separation, hook_thickness,
front_plate_thickness);
translate([tx + front_plate_thickness, fp_height, 0])
hook_support2(
shelf_standard_slot_separation + hook_width,
hook_thickness * 2,
front_support_thickness);
translate([tx, 0, 0])
front_plate();
}
}
tx = print_orientation ? 0 : front_plate_width / 2;
ty = print_orientation ? 0 : hook_outside_width;
rx = print_orientation ? 0 : 90;
rz = print_orientation ? 0 : -90;
trt([tx, ty, 0], [rx, 0, rz])
std_to_pgbd_hk();
}
// ===== End included file pegboard-to-shelf-standard.scad =====

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


