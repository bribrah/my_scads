/**
 * @file
 * @brief Pegboard tool or small cup holder - basically a pegboard tray
 *  with evenly spaced holes.
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
 * @note Uses: 1) tool holder or 2) insert small condiment cups into holes
 *  and use as small parts holder
 */

use <position.scad>
include <pegboard-tray.scad>

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
                position("line", tray_width2, hole_count,
                            insets = hole_s2s_inset2 + hole_diameter / 2)
                    cylinder(d = hole_diameter, h = tray_thickness + eps2 * 2);
    }
}
