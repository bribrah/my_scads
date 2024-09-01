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

include <shortcuts.scad>
include <pegboard-thing-utils.scad>

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
