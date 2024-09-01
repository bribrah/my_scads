/**
 * @file
 * @brief Functions that generate point lists for various shapes.
 * @author Mike Larson
 * @version 998e25d
 * @date mar-07-2022
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

include <param.scad>

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
                        [[o2.x + r, o2.y]],
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

