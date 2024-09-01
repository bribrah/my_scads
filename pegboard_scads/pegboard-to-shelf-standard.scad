/**
 * @file
 * @brief Shelf standard to pegboard guide hook.
 * @author
 * @version
 * @date
 * @copyright
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
pgbd_s2pbh_dflt_front_plate_height = 1;                 // [0.0:0.1:100.0]

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


include <shape-functions.scad>
include <shortcuts.scad>
include <units.scad>
include <pegboard-thing-utils.scad>


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
