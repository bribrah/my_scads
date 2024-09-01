/**
 * @file
 * @brief Various simple, conical, and rounded rings, ovoids, cylinder slices
 *  (arcs), cubes with edge rounding, trapezoids, and fillet modules.
 * @author Mike Larson
 * @version 8a73559
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

shape_modules_which_test = ""; // ["",basic-ring,conical-ring,dome,domed-ring,ring-rt,capped-ring,ring-re,isosceles-triangle,c-ring,half-capped-ring-rounding,half-capped-ring-no-rounding,ovoid,ovoid2,half-ovoid,half-ovoid2,linear-fillet,corner-fillet,rectangular-fillet-sqic,rectangular-fillet-rndic,round-fillet,cylinder-slice,cylinder-with-rounded-edges,half-ovoid-tr,cube_re-all-rounded,cube_re-no-redges,cube_re-all-except-0-rounded,cube_re-right-side-not-rounded,cube_are,compare-cube_are-cube_re,isosceles_trapezoid3d_rse-10-8-6-4-cr1,isosceles_trapezoid3d_rse-10-8-6-4-cr0,isosceles_trapezoid3d_rlre,isosceles_trapezoid-functions]

// Show text with test image
test_show_text = true;

// Text size for text that goes with test images
test_text_size = 2;

// 'center' flag passed to test module
test_center_flag = false;


/* [Debug] */

// Debug first, pre-rotate translation
shp_mod_debug_translation1 = [0, 0, 0];             // [-1000.0:0.1:1000.0]
// Debug rotation
shp_mod_debug_rotation = [0, 0, 0];                 // [-1000.0:0.1:1000.0]
// Debug second, post-rotate translation
shp_mod_debug_translation2 = [0, 0, 0];             // [-1000.0:0.1:1000.0]

// Debug color string or "#" modifier or "%" modifier
shp_mod_debug_color_mod_str = "";
// Debug color alpha value
shp_mod_debug_color_alpha = 1.0;                    // [0.0:0.1:1.0]


/* [Hidden] */

include <shortcuts.scad>
include <debug.scad>
include <shape-functions.scad>

/*
 * Ring shapes.
 */

/**
 * @brief Draw a ring, tube, hollow rod.
 * @param height ring height
 * @param od outside diameter
 * @param id inside diameter
 * @sa ring(R, r, h) (Parkinbot ShortCuts.scad)
 * @sa draw_ring in raspberry-pi/enclosure/rpi-enclosure.scad
 */
module ring(height, od, id, center=false)
{
    tz = center ? 0 : -0.1;
    difference() {
        cylinder(h = height, d = od, center = center);
        translate([0, 0, tz])
            cylinder(h = height + 0.2, d = id, center = center);
    }
}

/**
 * @brief Draw a C-ring, which is a ring with a cutout section.
 * @param dia ring diameter
 * @param height ring height
 * @param thickness ring thickness
 * @param cutout_angle Angle of ring to cutout
 */
module c_ring(height, od, id, cutout_angle)
{
    incr = 360.0 / $fn;
    function flatten(l) = [ for (a = l) for (b = a) b ] ;

    module o_ring(id, od, height)
    {
        difference() {
            cylinder(d = od, h = height, center = true);
            cylinder(d = id, h = height + eps, center = true);
        }
    }

    module wedge(r, angle, height)
    {
        points = flatten([[[0, 0]], circle_points(r, 0, angle, incr)]);
        translate([0, 0, -height / 2])
            linear_extrude(height) polygon(points);
    }

    module a_possible_better_way(height, od, id, gap_angle, center = true)
    {
        tz = center ? -height / 2 : 0;
        pts = concat(
                circle_points(r = od / 2, sa = 0, ea = 360 - gap_angle),
                circle_points(r = id / 2, sa = 360 - gap_angle, ea = 0));

        //trt([0, 0, tz], [0, 0, gap_angle / 2 - 90])
        trt([0, 0, tz], [0, 0, gap_angle])
            linear_extrude(height)
                polygon(pts);
    }

    difference() {
        o_ring(id, od, height);
        wedge(od / 2 + eps, cutout_angle, height + eps);
    }

    // WIP, not ready yet.
    //a_possible_better_way(height, od, id, cutout_angle, center = true);

}

/**
 * @brief Draw a cone shaped ring.
 * @param height ring height
 * @param od1 base outside diameter
 * @param od2 top outside diameter
 * @param id inside diameter
 * @note inside cutout is cylindrical (does not follow outside contour)
 */
module conical_ring(height, od1, od2, id, center=false)
{
    difference() {
        cylinder(h = height, d1 = od1, d2 = od2, center = center);
        translate([0, 0, -0.1])
            cylinder(h = height + 0.2, d = id, center = center);
    }
}

module draw_solid_dome(d, z = 0)
{
    rotate_extrude() quarter_circle(d, z);
}

/**
 * @brief Draw a dome (upside down bowl)
 * @param od outside diameter
 * @param thickness dome thickness, if >= od then dome is solid
 */
module dome(od, thickness = 0)
{
    difference() {
        draw_solid_dome(od);
        if(thickness < od)
            translate([0, 0, -eps])
                draw_solid_dome(od - thickness + eps);
    }
}

/**
 * @brief Draw a dome with a hole in the middle.
 * @param od outside diameter
 * @param id inside diameter, the hole diameter
 */
module domed_ring(od, id)
{
    difference() {
        draw_solid_dome(od);
        translate([0, 0, od / 4 - eps])
            cylinder(d = id, h = od / 2 + eps2, center = true);
    }
}

/**
 * @brief Draw a rounded top helper module
 */
module cylinder_rt(height, diameter, rounding)
{
    rotate_extrude() {
        union() {
            r = diameter / 2;
            x = r - rounding;
            y = height - rounding;
//          echo(r = r, x = x, y = y);
            square([r, y], center = false);
            translate([0, y, 0]) square([x, rounding], center = false);
            translate([x, y, 0]) quarter_circle(rounding * 2);
        }
    }
}

/**
 * @brief Draw a ring with a rounded top
 * @param height ring height
 * @param od outside diameter
 * @param id inside diameter, the hole diameter
 * @param rounding radius of the rounded top
 */
module ring_rt(height, od, id, rounding)
{
    difference() {
        cylinder_rt(height, od, rounding);
        translate([0, 0, height / 2])
            cylinder(d = id, h = height + eps2, center = true);
    }
}

/**
 * @brief Draw a capped ring (cup-like shape)
 * @param oh height overall (outside cylinder height)
 * @param ih inside cylinder (drill height)
 * @param od outside cylinder diameter
 * @param id inside cylinder diameter
 * @param r cap rounding
 * @param flip flip shape so cap is on the top (upside down cup)
 * @param center [zmin, zmax] = (center ? [-oh/2, oh/2] : [0, oh])
 */
module capped_ring(oh, ih, od, id, r = 0, flip = false, center = false)
{
    // height of the cap at end, must be < oh
    end_cap_height = oh - ih;
    translate([0, 0, center ? -oh / 2 : 0]) {
        rotate([flip ? 180 : 0, 0, 0]) {
            difference() {
                cylinder_with_rounded_edges(oh, od, r,
                        which = [false, true],
                        center = false);
                translate([0, 0, end_cap_height])
                    cylinder(h = ih + eps, d = id, center = false);
            }
        }
    }
}

/**
 * @brief Ring with rounded inner and outer edges (top and bottom).
 * @param height ring height
 * @param od outside diameter
 * @param id inside diameter
 * @param rndg rounding array CCW starting at lower inside corner
 * @param fn #facets
 * @param center false (default): Z = 0 to h, true = Z -h/2 to +h/2
 */
module ring_re(height, od, id, rndg = [0, 0, 0, 0], fn = 64, center=false)
{
    ra = (len(rndg) == undef) ? [rndg, rndg, rndg, rndg] : rndg;
    tz = center ? 0 : height / 2;
    $fn = fn;

    function slightly_round_square_corners(ra) =
                [ for(i = [0 : 3]) ra[i] == 0 ? eps : ra[i] ];

    // Make a square with rounded corners
    module rnd_sq(sz, ra)
    {
        hull() {
            tx = (sz[0] / 2);       // tx, ty define corners if no rounding
            ty = (sz[1] / 2);
            //       q3        q4      q1       q2
            qa = [[-1, -1], [1, -1], [1, 1], [-1, 1]];
            for(i = [0 : 3])
                translate([(tx - ra[i]) * qa[i][0], (ty - ra[i]) * qa[i][1], 0])
                    circle(r = ra[i]);
        }
    }

    translate([0, 0, tz]) {
        rotate_extrude() {

            // Size in the X direction of the square to be rotated
            szx = (od - id) / 2;

            // X translation: first move so left edge touches Y axis,
            // then move id / 2 for rotate extrude
            translate([szx / 2 + id / 2, 0, 0]) {
                rnd_sq([szx, height], slightly_round_square_corners(ra));
            }
        }
    }
}

/*
 * End ring shapes.
 */

/*
 * Triangluar shapes.
 */

/**
 * @brief
 * @param sz [base_width, height, thickness]
 * @param r corner radius
 */
module  isosceles_triangle_rc(sz, r, angle = undef, center = false)
{
    width = sz[0];
    height = sz[1];
    thickness = sz[2];
    centers = [[r, r], [width - r, r], [width / 2, height - r]];
    tc = center ?  [-width / 2, -height / 2, -thickness / 2] : [0, 0, 0];

    translate(tc)
        hull()
            for(i = centers)
                translate(i)
                    cylinder(r = r, h = thickness, center = false);
}

/*
 * End triangluar shapes.
 */

/*
 * Quadrilateral shapes.
 */

function cube_all_round_edges() = [ for(i = [0:11]) i ];

/**
 * Cube with round/no-round edge control.
 * @note Edges numbered starting at origin and incrementing counter clockwise,
 * bottom edges are 0-3, side edges are 4-7, top edges are 8-11
 * @note redges = [] means all square edges
 * @note redges = cube_all_round_edges() means all round edges
 * @note corners are pointy as compared to minkowski { cube sphere }
 * @sa roundedBox() from MCAD boxes.scad
 * @sa BOSL2 cuboid in BOSL2/shapes.scad documented in https://github.com/revarbat/BOSL2/wiki/shapes.scad#cuboid
 * @bug Give 'r' a default value so cube_re(sz) and cube_re(sz, center)
 *  generate the same shape as cube(...)
 * @bug if r = 0, then nothing is generated
 */
module cube_re(sz, r, redges = [], fn = 32, center = false)
{
    w = sz[0];
    d = sz[1];
    h = sz[2];
    tx = center ? 0 : w / 2;
    ty = center ? 0 : d / 2;
    tz = center ? 0 : h / 2;

    module rx(x) { rotate([x, 0, 0]) children(0); }
    module ry(y) { rotate([0, y, 0]) children(0); }

    module cube_r4(sz, r, redges, map, fn)
    {
        w = sz[0];
        d = sz[1];
        h = sz[2];
        px = w - r;
        py = d - r;
        // Points at cylinder centers (counter clockwise order)
        ps = [ [r, r], [px, r], [px, py], [r, py] ];

        // For each corner, if the corner is not in the rounding list,
        // set #facets to 4 (cube) and cube side length = cylinder
        // radius. Otherwise, set #facets to fn (cylinder) and don't
        // change the radius.
        function fns_ent(re, i) =
            search(i, re) == [] ? [r / sin(45), 4] : [r, fn];
        fns = [ for(i = map) fns_ent(redges, i) ];

//      echo(fns = fns);

        hull() {
            for(i = [0:3]) {
                translate([ps[i][0] - w / 2, ps[i][1] - d / 2, 0])
                    rotate([0, 0, 45])
                        cylinder(h = h, r = fns[i][0], $fn = fns[i][1],
                            center = true);
            }
        }
    }

// FIXME: redges != [] && r == 0
    translate([tx, ty, tz]) intersection() {
        // Side edges
        cube_r4(sz, r, redges, [4, 5, 6, 7], fn);

        // Left/right top/bottom edges
        ry(180) rx(-90)
            cube_r4([sz[0], sz[2], sz[1]], r, redges, [1, 3, 11, 9], fn);

        // Front/back top/bottom edges
        ry(-90)
            cube_r4([sz[2], sz[1], sz[0]], r, redges, [0, 8, 10, 2], fn);
    }
}

/**
 * Cube with all edges rounded
 * @note Uses minkowski()
 * @note Note currently used
 * @sa roundedBox() from MCAD boxes.scad
 * @todo Possibly merge with cube_re
 */
module cube_are(sz, r, center = false)
{
    d = r * 2;
    tx = center ? r - sz[0] / 2 : r;
    ty = center ? r - sz[1] / 2 : r;
    tz = center ? r - sz[2] / 2 : r;

    translate([tx, ty, tz]) minkowski() {
        cube([sz[0] - d, sz[1] - d, sz[2] - d]);
        sphere(r);
    }
}

/**
 * @brief 3D isosceles trapezoid with rounded side edges (RSE). Top/bottom
 * and front/back sides are parallel. Left/right sides are not parallel to
 * each other.
 * @param sz [bottom_width, top_width, depth, height] if angle undef or
 *      [bottom_width, depth, height] if angle defined
 * @param r corner radius
 * @param angle base to side angle
 * @sa Trapezoid(b, angle, H, height, heights, center, centerXYZ)
 *      (Tim Koopman Triangles.scad)
 */
module  isosceles_trapezoid3d_rse(sz, r, angle = undef, center = false)
{
    bw    = sz[0];
    depth = (angle == undef) ? sz[2] : sz[1];
    h     = (angle == undef) ? sz[3] : sz[2];
    tw    = (angle == undef) ?
                sz[1] :
                isosceles_trapezoid_top_len(bw, h, angle);
    n = (bw - tw) / 2;
    tx = center ? -bw / 2 : 0;
    ty = center ? -depth / 2 : 0;
    tz = center ? -h / 2 : 0;
    cr = (r != 0) ? r : eps;

    points = [ [r + tx, r + ty, tz], [bw - r + tx, r + ty, tz],
        [bw - n - r + tx, depth - r + ty, tz],
        [n + r + tx, depth - r + ty, tz]];
    hull() {
        for(i = points)
            translate(i) cylinder(h = h, r = cr, center = false);
    }
}

/**
 * @brief 3D isosceles trapezoid with rounded left/right edges (RLRE).
 * @param sz [bottom_width, top_width, depth, height] if angle undef or
 *      [bottom_width, depth, height] if angle defined
 * @param r corner radius
 * @param angle base to side angle
 * @todo 'center' is currently ignored
 * @sa Trapezoid(b, angle, H, height, heights, center, centerXYZ)
 *      (Tim Koopman Triangles.scad)
 */
module  isosceles_trapezoid3d_rlre(sz, r, angle = undef, center = false)
{
    bw    = sz[0];
    depth = (angle == undef) ? sz[2] : sz[1];
    h     = (angle == undef) ? sz[3] : sz[2];
    tw    = (angle == undef) ? sz[1] :
                isosceles_trapezoid_top_len(bw, depth, angle);

    sl    = isosceles_trapezoid_side_len(tw, bw, depth) + r;
    ang   = (angle == undef) ? isosceles_trapezoid_angle(tw, bw, depth) : angle;

    tx = center ? -bw / 2 : 0;
    ty = center ? -depth / 2 : 0;
    tz = center ? -h / 2 : 0;

    debug = false;

    if(debug) {
        echo(ang = ang);
        echo(tw = tw);
    }

    cr = (r != 0) ? r : eps;

    x     = r * cos(90 - ang);
    y     = r * sin(90 - ang);
    txr = [
            [[x, -y, r], ang],
            [[x, -y, h - r], ang],
            [[bw - x, -y, r], 180 - ang],
            [[bw - x, -y, h - r], 180 - ang],
    ];

    module cylx(h, r)
    {
        rotate([0, 90, 0]) cylinder(h = h, r = cr, center = false);
    }

    translate([tx, ty, tz])
        difference() {
            hull() {
                for(i = txr) {
                    translate(i[0]) rotate([0, 0, i[1]]) cylx(sl, r);
                }
            }
            translate([0, -depth, -eps]) cube([bw, depth, h + eps2]);
            translate([0, depth, -eps]) cube([bw, depth, h + eps2]);
        }
}

/*
 * End quadrilateral shapes.
 */

/**
 * @brief Draw a quarter circle in the +XY quadrant and translate it
 * in the Y direction.
 * @param d circle diameter
 * @param y optional translation along the Y axis
 * @todo This might be redundant. See fcircle()
 */
module quarter_circle(d, y = 0)
{
    r = d / 2;
    translate([0, y]) difference() {
        circle(r = r);
        translate([0, -r / 2]) square([r * 2, r], center = true);
        translate([-r / 2, r / 2]) square([r, r], center = true);
    }
}

// Difference between this and ring_re w/ id = 0?
/**
 * @brief Draw a cylinder w/ the top and/or bottom rounded (peg-like shape).
 * @param height cylinder height
 * @param diameter cylinder diameter
 * @param rounding radius of the rounded edge(s)
 * @note capped_ring (ring-shapes.scad) helper module
 */
module cylinder_with_rounded_edges(height, diameter, rounding,
                        which = [true, true],
                        center = false)
{
    round_top = which[0];
    round_bot = which[1];

    translate([0, 0, center ? -height / 2 : 0]) rotate_extrude() {
        union() {
            r = diameter / 2;
            x = r - rounding;
            y = height - rounding;

//          echo(r = r, x = x, y = y);

            union() {
                square([x, height]);
                translate([0, rounding]) square([r, y - rounding]);
                if(round_top)
                    translate([x, y]) circle(r = rounding);
                else
                    translate([x, y]) square(rounding);
                if(round_bot)
                    translate([x, rounding]) circle(r = rounding);
                else
                    translate([x, 0]) square(rounding);
            }
        }
    }
}

/**
 * @brief Draw an ovoid (3D oval)
 * @param rx radius in the X direction
 * @param ry radius in the Y direction
 * @param height height in the Z direction
 * @note Football shape
 */
module ovoid(rx, ry, height, center = false)
{
    z = center ? - height / 2 : 0;

    translate([0, 0, z])
        scale([1, ry / rx, 1])
            cylinder(r = rx, h = height, center = false);
}

/**
 * @brief Draw a half (semi) ovoid
 * @param rx radius in the X direction
 * @param ry radius in the Y direction
 * @param height height in the Z direction
 */
module half_ovoid(rx, ry, height, center = false)
{
    z = center ? 0 : height / 2;

    difference() {
        ovoid(rx, ry, height, center = center);
        translate([0, -ry / 2, z])
            cube([rx * 2 + eps, ry, height + eps], center = true);
    }
}

/**
 * @brief Racetrack oval (symmectrical on both axes and flat sides): 2 half
 *  circles separated by a rectangle of length = 'length - diameter' and
 *  height = 'thickness'.
 * @note FreeCAD calls this a 'slot'.
 */
module racetrack_oval(thickness, diameter, length, center = false)
{
    rect_length = length - diameter;
    half_length = rect_length / 2;
    radius = diameter / 2;
    t = center ? [0, 0, 0] : [half_length + radius, radius, thickness / 2];

// @todo allow 0-length rect_length, which would be a single cylinder
    assert(rect_length > 0);
    translate(t)
        union() {
            translate([-half_length, 0, 0])
                cylinder(h = thickness + eps, d = diameter, center = true);
            translate([half_length, 0, 0])
                cylinder(h = thickness + eps, d = diameter, center = true);
            if(rect_length > 0)
                cube([rect_length, diameter, thickness], center = true);
        }
}

/**
 * @brief Racetrack, but with only one end rounded and the other squared off.
 * @param diameter diameter of round end and also height of shape
 * @param center_on_circle if true, center on circle, height, and thickness
 * @param center if true, center on length, height, and thickness
 */
module half_racetrack_oval(thickness, diameter, length,
                    center_on_circle = false, center = false)
{
    radius = diameter / 2;
    rect_length = length - radius;
    // Centered on cylinder -> centered on length
    txc = -radius + length / 2;
    t = center_on_circle ? [0, 0, 0] :
            (center ? [txc, 0, 0] : [rect_length, radius, thickness / 2]);

    translate(t)
        union() {
            difference() {
                cylinder(h = thickness + eps, d = diameter, center = true);
                cube_len = (rect_length > radius) ? 0 : radius - rect_length;
                if(cube_len > 0)
                    translate([cube_len / 2 - radius, 0, 0])
                        cube([cube_len + eps, diameter + eps, thickness + eps2],
                                center = true);
            }
            if(rect_length > 0)
                translate([-rect_length / 2, 0, 0])
                    cube([rect_length, diameter, thickness], center = true);
        }
}

/**
 * @brief Draw a cylindrical arc
 * @param r cylinder radius
 * @param h height in the Z direction
 * @param angle slice angle, starts @ X axis and increases counter-clockwise
 * @todo r1, r2, d1, d2
 * @note Requires at least OpenSCAD 2016.XX
 */
module cylinder_slice(h, r, angle, center = false)
{
    tz = center ? -h / 2 : 0;
    translate([0, 0, tz]) rotate_extrude(angle = angle) square([r, h]);
}

/**
 * @brief Draw a linear filleted shape w/ inside corner at the origin and
 *  right and top corners along X and Y respectively.
 * @param l Side length (also fillet radius)
 * @param h Height in the Z direction
 * @param angle Angle between the 2 sides
 * @param center false ? z ranges from 0 to h : z ranges from -h/2 to +h/2
 * @note Oriented straight up, inside corner on X, fillet facing out,
 *  top half above the XY plane, the bottom half below the XY plane
 * @note Use to reinforce inside corners
 * @note Handles 90 <= angle < 180
 */
module linear_fillet_shape(l, h, angle, center = false)
{
    a2 = angle / 2;
    b = l * sin(a2);
    r = b / cos(a2);
    x = l;
    y = r;
    translate([0, 0, center ? 0 : h / 2])
        difference() {
            cylinder_slice(h, l, angle, center = true);
            union() {
                translate([x, y, 0])
                    cylinder(h = h + eps, r = r, center = true);
                // Debug - put # before above translate and remove *
                // below to see cylinder center
                *#translate([x, y, 0])
                    cylinder(h = h + eps2, r = 0.2, center = true);
            }
        }
}

/**
 * @brief Corner fillet shape, use in conjunction with linear_fillet_shape
 *  to wrap around rectangular shapes with rounded edges
 * @param sl Side length
 * @param angle Angle between inside vertical and horizontal sides
 * @param edge_radius Inside edge radius
 * @param corner_radius Corner radius
 */
module corner_fillet_shape(sl, angle, edge_radius, corner_radius = 90)
{
    a2 = angle / 2;
    b = sl * sin(a2);
    r = b / cos(a2);
    x = sl;
    y = r;

    module twod_shape(x, y, edge_radius, angle)
    {
        pts = concat(
                [[edge_radius, 0]],
                circle_points_offset(cr = r, sa = 270, ea = 90 + angle,
                        offset = [x + edge_radius, y])
                );
        polygon(pts);
    }

    rotate_extrude(angle = corner_radius)
        twod_shape(x, y, edge_radius, angle);
}

/**
 * @brief Rectangular filleted shape, square inside corners
 * @param szxy [x, y] size of rectangular shape
 * @param fr Fillet radius
 * @note Because the angle between the inside vertical and horizontal
 *  sides is 90 degrees, the side length = the fillet radius
 */
module rectangular_fillet_shape_sqic(szxy, fr, fn = 32, center_xy = false)
{
    tcent = center_xy ? [-szxy.x / 2, -szxy.y / 2] : [0, 0, 0];
    $fn = fn;

    module rect(l, h, rz, offsetxy)
    {
        translate([offsetxy[0], offsetxy[1], 0])
            rotate([0, 0, rz])
                cube([l, h, l]);
    }

    module cyl(r, h, rz, xlat = [0, 0, 0])
    {
        translate(xlat)
            rotate([0, 0, rz])
                // Cylinder, lying flat on Y axis, height in +Y direction
                translate([0, 0, r])
                    rotate([-90, 0, 0])
                        cylinder(r = r, h = h + eps2);
    }

    fr2 = fr * 2;

    translate(tcent)
    difference() {
        union() {
            rect(fr, szxy[0] + fr2, -90, [-fr, 0]);
            rect(fr, szxy[1] + fr2, 0, [-fr, -fr]);
            rect(fr, szxy[0] + fr2, -90, [-fr, szxy[1] + fr]);
            rect(fr, szxy[1] + fr2, 0, [szxy[0], -fr]);
        }
        union() {
            cyl(fr, szxy[0] + fr2, 90, [szxy[0] + fr + eps, -fr, 0]);
            cyl(fr, szxy[1] + fr2, 0, [-fr, -(fr + eps), 0]);
            cyl(fr, szxy[0] + fr2, 90, [szxy[0] + fr + eps, szxy[1] + fr, 0]);
            cyl(fr, szxy[1] + fr2, 0, [szxy[0] + fr, -(fr + eps), 0]);
        }
    }
}

/**
 * @brief Rectangular filleted shape, rounded inside corners
 * @param szxy [x, y] size of rectangular shape
 * @param fr Fillet radius
 * @param ier Inside edge radius, 0 (defuault = square corners)
 * @note Because the angle between the inside vertical and horizontal
 *  sides is 90 degrees, the side length = the fillet radius
 */
module rectangular_fillet_shape_rndic(szxy, fr, ier = 0, fn = 32,
                        center_xy = false)
{
    tcent = center_xy ? [0, 0, 0] : [szxy.x / 2, szxy.y / 2];

    module one_fillet_part(corner, txy, rz, l, h, ier, fn)
    {
        translate([txy.x, txy.y, 0])
            rotate([0, 0, rz])
                if(corner)
                    corner_fillet_shape(l, 90, ier, corner_radius = 90);
                else
                    rotate([0, -90, 0])
                        linear_fillet_shape(l, h, 90, center = true);
    }

    half_x = szxy.x / 2;
    half_y = szxy.y / 2;
    cx = half_x - ier;
    cy = half_y - ier;
    // Top view, start in the upper right corner. Alternately draw
    // corner and straight
    txy = [
            [cx, cy],                   // Upper right corner
            [0, half_y],                // Top straight
            [-cx, cy],                  // Upper left corner
            [-half_x, 0],               // Left straight
            [-cx, -cy],                 // Lower left corner
            [0, -half_y],               // Bottom straight
            [cx, -cy],                  // Lower right corner
            [half_x, 0],                // Right straight
    ];

    // Alternating side lengths, starting with top/bottom
    side_lens = [szxy.x - ier * 2, szxy.y - ier * 2];

    translate(tcent)
    // even(i) ? corner : straight_side
    // floor(i / 2) converts indicies 1,3,5,7 => 0,1,2,3
    for(i = [0 : len(txy) - 1])
        let(side_len = ((i % 2) != 0) ? side_lens[floor(i / 2) % 2] : 0,
            rz = floor(i / 2) * 90)
            one_fillet_part((i % 2) == 0, txy[i], rz, fr, side_len, ier, fn);
}

/**
 * @brief Rectangular filleted shape, rounded or square inside corners
 * @param szxy [x, y] size of rectangular shape
 * @param fr Fillet radius
 * @param ier Inside edge radius, 0 (defuault = square corners)
 */
module rectangular_fillet_shape(szxy, fr, ier = 0, fn = 32, center_xy = false)
{
    if(ier == 0)
        rectangular_fillet_shape_sqic(szxy, fr, fn, center_xy);
    else
        rectangular_fillet_shape_rndic(szxy, fr, ier, fn, center_xy);
}

/**
 * @brief Draw a round filleted shape
 * @param r size of round shape, fillet inside radius
 * @param fr height and width of fillet (i.e. fillet radius)
 * @note Not centered (and no center option)
 */
module round_fillet_shape(r, fr, fn = 32)
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


module test_shape_modules(which_test, center = false, flip = false)
{
    ring_height = 10;
    ring_od1 = 8;
    ring_od2 = 6;
    ring_id = 4;
    rounding = 2;
    $fn = 128;

    ovoid_r1 = 10;
    ovoid_r2 = 4;
    ovoid_height = 1;

    cube_sz = [20, 12, 4];
    cube_rounding = 1;
    all_rounded = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ];

    center = test_center_flag;

    module info()
    {
        echo(str("$vpt, $vpr, $vpd = ", $vpt, ", ", $vpr, ", ", $vpd));
    }

    module show_text(text_str, txyz, text_height = 1)
    {
        if(test_show_text)
            translate(txyz + [0, 0, -text_height / 2])
                linear_extrude(text_height)
                    text(text_str, test_text_size);
    }

    function all_edges_except(e) = [ for(i = [0:11]) if(i != e) i ];

    if(which_test == "basic-ring") {
        // gen-scad-pngs --vpt 0.0,0.0,0.0 --vpr 55.0,0.0,25.0 --vpd 80.0
        show_text("ring", [-2, -8, 0]);
        ring(ring_height, ring_od1, ring_id, center = center);
    } else if(which_test == "conical-ring") {
        // gen-scad-pngs --vpt 0.0,0.0,0.0 --vpr 55.0,0.0,25.0 --vpd 80.0
        show_text("conical_ring", [-7, -8, 0]);
        conical_ring(ring_height, ring_od1, ring_od2, ring_id, center = center);
    } else if(which_test == "dome") {
        // gen-scad-pngs --vpt -1.0,-2.0,0.0 --vpr 55.0,0.0,25.0 --vpd 70.0
        show_text("dome", [-4, -8, 0]);
        dome(ring_od1, thickness = 1);
    } else if(which_test == "domed-ring") {
        // gen-scad-pngs --vpt -1.0,-2.0,0.0 --vpr 55.0,0.0,25.0 --vpd 70.0
        show_text("domed_ring", [-7, -8, 0]);
        domed_ring(ring_od1, ring_id);
    } else if(which_test == "ring-rt") {
        // gen-scad-pngs --vpt 0.0,0.0,0.0 --vpr 45.0,0.0,25.0 --vpd 80.0
        show_text("ring_rt", [-4, -8, 0]);
        ring_rt(ring_height, ring_od1, ring_id, rounding);
    } else if(which_test == "capped-ring") {
        inside_height = ring_height - 2;
        // gen-scad-pngs --vpt 5.0,0.0,0.0 --vpr 45.0,0.0,25.0 --vpd 100.0
        show_text("capped_ring", [-2, -8, 0]);
        capped_ring(ring_height, inside_height, ring_od1, ring_id, rounding,
                        center = center);
        translate([ring_od1 * 1.5, 0, ring_height])
            rotate([0, 180, 0])
                capped_ring(ring_height, inside_height, ring_od1, ring_id,
                        rounding, center = center);
    } else if(which_test == "ring-re") {
        height = 3;
        od = 12;
        id = 6;
        // gen-scad-pngs --vpt 6.0,0.0,0.0 --vpr 55.0,0.0,25.0 --vpd 100.0
        show_text("ring_re", [4, -10, 0]);
        ring_re(height = height, od = od, id = id, rndg = [0.5, 1.0, 1.0, 0.5],
                            center = false);
        // Round bottom edges but not top edges
        translate([od * 1.25, 0, 0])
            ring_re(height = height, od = od, id = id, rndg = [1.0, 1.0, 0, 0],
                                center = false);
    } else if(which_test == "isosceles-triangle") {
        base_with = 6;
        height = 8;
        thickness = 1;
        r = 1;
        sz = [base_with, height, thickness];
        isosceles_triangle_rc(sz, r, center = center);
    } else if(which_test == "c-ring") {
        height = 3;
        od = 12;
        id = 6;
        cutout_angle = 36;

        show_text("c_ring", [-4, -12, 0]);
        c_ring(height, od, id, cutout_angle);

    } else if((which_test == "half-capped-ring-rounding") ||
            (which_test == "half-capped-ring-no-rounding")) {
        hoa = 8;
        cap_height = 1.0;
        od = 4;
        id = 3;
        r = (which_test == "half-capped-ring-rounding") ? 0.4 : 0;

        show_text(str("half capped_ring ", ((r != 0) ?  "with" : "without"),
                    " rounding"),
                [-20, -4, 0]);

        color("yellow", 0.5) rotate([0, 0, -90])
        difference() {
            capped_ring(hoa, hoa - cap_height, od, id, r = r,
                    flip = flip, center = center);
            // Remove 1/2 of the shape to view the inside
            translate([0, -od + eps, -eps])
                cube([od + eps, (od + eps) * 2, hoa + eps2], center = false);
        }
    } else if(which_test == "ovoid") {
        // gen-scad-pngs --vpt 0.0,0.0,0.0 --vpr 55.0,0.0,25.0 --vpd 40.0
        show_text("ovoid", [-3.5, -8, 0]);
        ovoid(ovoid_r1, ovoid_r2, ovoid_height, center = center);
    } else if(which_test == "ovoid2") {
        // gen-scad-pngs --vpt 0.0,0.0,0.0 --vpr 55.0,0.0,25.0 --vpd 75.0
        show_text("ovoid", [-3.5, -14, 0]);
        ovoid(ovoid_r2, ovoid_r1, ovoid_height, center = center);
    } else if(which_test == "half-ovoid") {
        // gen-scad-pngs --vpt 0.0,0.0,0.0 --vpr 55.0,0.0,25.0 --vpd 50.0
        show_text("half_ovoid", [-6, -5, 0]);
        half_ovoid(ovoid_r1, ovoid_r2, ovoid_height, center);
    } else if(which_test == "half-ovoid2") {
        // gen-scad-pngs --vpt 0.0,0.0,0.0 --vpr 55.0,0.0,25.0 --vpd 50.0
        show_text("half_ovoid", [-6, -4, 0]);
        half_ovoid(ovoid_r2, ovoid_r1, ovoid_height, center);
    } else if(which_test == "linear-fillet") {
        // gen-scad-pngs --vpt 0.0,0.0,0.0 --vpr 355.0,0.0,25.0 --vpd 50.0
        show_text("linear_fillet", [-6, -4, 0]);
        linear_fillet_shape(4, 8, 135, center);
    } else if(which_test == "corner-fillet") {
        // gen-scad-pngs --vpt 0.0,0.0,0.0 --vpr 355.0,0.0,25.0 --vpd 50.0
        show_text("corner_fillet", [-6, -4, 0]);
        corner_fillet_shape(4, 90, 0.8);
    } else if(which_test == "rectangular-fillet-sqic") {
        // gen-scad-pngs --vpt 3.0,10.0,-5.0 --vpr 46.60,0.00,21.50 --vpd 90.0
        show_text("rectangular_fillet_sqic", [-8, -8, 0]);
        rectangular_fillet_shape([10, 20], 4, center_xy = center);
    } else if(which_test == "rectangular-fillet-rndic") {
        // gen-scad-pngs --vpt 3.0,10.0,-5.0 --vpr 46.60,0.00,21.50 --vpd 90.0
        show_text("rectangular_fillet_rndic", [-8, -8, 0]);
        rectangular_fillet_shape([10, 20], 4, ier = 0.8, center_xy = center);
    } else if(which_test == "round-fillet") {
        // gen-scad-pngs --vpt -3.0,-3.0,-4.0 --vpr 55.0,0.00,25.0 --vpd 75.0
        show_text("round_fillet", [-8, -14, 0]);
        round_fillet_shape(8, 2);
    } else if(which_test == "cylinder-slice") {
        // gen-scad-pngs --vpt 0.0,0.0,0.0 --vpr 45.0,0.00,30.0 --vpd 65.0
        show_text("cylinder_slice", [-6, -4, 0]);
        cylinder_slice(8, 4, 0 + 45, center = false);
    } else if(which_test == "cylinder-with-rounded-edges") {
        // gen-scad-pngs --vpt 4.0,-3.0,0.0 --vpr 45.0,0.00,30.0 --vpd 100.0
        height = 10;
        diameter = 4;
        rounding = 0.5;
        which = [true, true];
        show_text("cylinder_with_rounded_edges", [-16, -4, 0]);
        cylinder_with_rounded_edges(height, diameter, rounding,
                        which, center = center);
    } else if(which_test == "half-ovoid-tr") {
        // Test rotating and moving to the quadrant 1
        w = 5;
        d = 9.4;
        translate([w, d / 2, 0])
            rotate([0, 0, 90])
                half_ovoid(rx = d, ry = w * 2, height = ovoid_height,
                        center = center);
    } else if(which_test == "cube_re-all-rounded") {
        // gen-scad-pngs --vpt 0.0,0.0,0.0 --vpr 55.0,0.0,25.0 --vpd 100.0
        debug = false;
        show_text("cube_re", [4, -4, 0]);
        cube_re(cube_sz, cube_rounding, redges = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]);
        if(debug)
            %cube(cube_sz);                         // For comparison
    } else if(which_test == "cube_re-no-redges") {
        cube_re(cube_sz, cube_rounding, center = center);
    } else if(which_test == "cube_re-all-except-0-rounded") {
        // All edges except edge 0 rounded
        cube_re(cube_sz, cube_rounding, redges = all_edges_except(0));
    } else if(which_test == "cube_re-right-side-not-rounded") {
        // Right side non-rounded, red cube for comparison
        redges = [0, 2, 3, 4, 7, 8, 10, 11];
        debug = false;
        cube_re(cube_sz, cube_rounding, redges = redges, center = center);
        if(debug)
            color("red", 0.5)                       // For comparison
                cube(cube_sz, center = center);
    } else if(which_test == "cube_are") {
        debug = false;
        if(debug)
            color("red", 0.5)                       // For comparison
                cube(cube_sz, center = center);
        cube_are(cube_sz, cube_rounding, center = center);
    } else if(which_test == "compare-cube_are-cube_re") {
        // Compare the 2 styles of cubes with rounded edges
        cube_are(cube_sz, cube_rounding, center = center);
        color("red", 0.2) cube_re(cube_sz, cube_rounding, redges = all_rounded,
            center = center);
    } else if(which_test == "isosceles_trapezoid3d_rse-10-8-6-4-cr1") {
        // gen-scad-pngs --vpt 5.0,0.0,0.0 --vpr 55.0,0.0,25.0 --vpd 90.0
        show_text("isosceles_trapezoid3d_rse", [-10, -6, 0]);
        isosceles_trapezoid3d_rse([10, 8, 6, 4], 1, center = center);
    } else if(which_test == "isosceles_trapezoid3d_rse-10-8-6-4-cr0") {
        isosceles_trapezoid3d_rse([10, 8, 6, 4], 0, center = center);
    } else if(which_test == "isosceles_trapezoid3d_rlre") {
        // gen-scad-pngs --vpt 5.0,0.0,0.0 --vpr 55.0,0.0,25.0 --vpd 90.0
        show_text("isosceles_trapezoid3d_rlre", [-10, -6, 0]);
        isosceles_trapezoid3d_rlre([10, 8, 6, 4], 0.5, center = center);
    } else if(which_test == "isosceles_trapezoid-functions") {
        // Test the isosceles_trapezoid_* functions in shape-functions.scad
        // Trapezoid sizes calculated from a square w/ a 3,4,5 triangle on
        // eigher side
        len1 = 3;
        len2 = 4;
        bot = len1 * 2 + len2;
        top = len2;
        height = 4;
        side = 5;
        ang = atan(height / len1);
//      side = isosceles_trapezoid_side_len(top, bot, height);

        isosceles_trapezoid3d_rse([bot, top, height, 1], 0, center = center);

        echo("height_orig = ", height);
        echo("height_calc = ", isosceles_trapezoid_height(top, bot, side));

        echo("ang_orig = ", ang);
        echo("ang_calc = ", isosceles_trapezoid_angle(top, bot, height));

        echo("top_orig = ", top);
        echo("top_calc = ", isosceles_trapezoid_top_len(bot, height, ang));

        echo("bot_orig = ", bot);
        echo("bot_calc = ", isosceles_trapezoid_bot_len(top, height, ang));

        echo("side_orig = ", side);
        echo("side_calc = ", isosceles_trapezoid_side_len(top, bot, height));
    } else if(which_test != "") {
        echo("*** Invalid test name ***");
    }

    if(false)
        info();
}


color_mod(shp_mod_debug_color_mod_str, shp_mod_debug_color_alpha)
    trt(shp_mod_debug_translation2, shp_mod_debug_rotation, shp_mod_debug_translation1)
            test_shape_modules(shape_modules_which_test,
                center = test_center_flag,
                    flip = false);
