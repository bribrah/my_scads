/**
 * @file
 * @brief Utility modules for pegboard holders
 * @author Mike Larson
 * @version 8baabaa
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

include <shape-functions.scad>
include <units.scad>

// Hook and nub center-to-center separation (inch)
pegboard_hook_nub_separation_in = 1;

// Pegboard hole dameter (inch)
pegboard_hole_diameter_in = 0.17;

// Pegboard thickness (inch)
pegboard_thickness_in = 0.12;            // [0.0000:0.0005:1.0000]

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

