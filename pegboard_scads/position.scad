/**
 * @file
 * @brief Position multiple copies of an object in a pattern according to a
 *  set of input parameters
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
 * @todo rename to positioning.scad, but multiple projects already include this
 */


// TBD axes (at least for line)
position_type_index = 0;            // circle, rectangle, line
position_length_index = 1;          // path length or [size_x, size_y]
position_count_index = 2;           // # of copies
position_start_angle_index = 3;     // start_angle (rectangle)
position_offset_index = 4;          // start offset (line)

// TBD comment on how these are used for extrudes

// TBR ...
// @sa BOSL2 xzrot?
// @sa linear_extrude_x in extrude.scad?
module rotate_z_to_x()
{
    rotate([90, 0, 90])             // Z to X rotation
        children();
}

// @sa BOSL2 yzrot?
// @sa linear_extrude_y in extrude.scad?
module rotate_z_to_y()
{
    rotate([0, 90, 90])             // Z to Y rotation
        children();
}

//module brkts_position_bracket_holes from include/brackets/brackets.scad

// End TBR ...

/**
 * @brief Replicate the child object evenly spaced in a line in the specified
 *  direction.
 * @param count number of child object instances
 * @param length line length
 * @param axes direction vector
 * @param insets start & ending offsets on line
 * @note objects are distributed evenly on line segment starting at
 * insets[0] and ending at insets[1]
 * @sa BOSL2 distributors.scad
 * @todo rename to position_in_line
 */
module replicate_in_line(count, length, axes = [1, 0, 0], insets = [0, 0],
                debug = false)
{
// TBD scalar insets
    start = (len(insets) > 0) ? insets[0] : 0;
    end = (len(insets) > 1) ? insets[1] : start;

    module info()
    {
        echo("replicate_in_line: length = ", length);
        echo("replicate_in_line: start = ", start);
        echo("replicate_in_line: end = ", end);
    }

    module txlt(axes, d)
    {
        if(debug)
            echo(str("replicate_in_line.txlt: d = ", d));
        t = [d * axes[0], d * axes[1], d * axes[2]];
        translate(t) children(0);
    }

    module distribute(count, length, axes)
    {
        if(debug)
            echo(str("replicate_in_line.distribute: length = ", length));
        for(i = [0 : count - 1])
            txlt(axes, length / (count - 1) * i) children(0);
    }

    if(debug)
        info();

    txlt(axes, start)
        distribute(count, length - start - end, axes)
            children(0);
}

/**
 * @brief Positions N copies of a child shape according to the input
 *  position parameters
 * @param type "circle", "rectangle", "line"
 * @param length path length or [size_x, size_y]
 * @param count # of copies (line, circle)
 * @param offset start offset (line)
 * @param start_angle starting angle (rectangle)
 * @param insets offsets from both ends (line)
 * @param axes ...
 * @note Currently used by rotary-switch-face-plate.scad
 * @note Candidates for additional positioning modules/functions:
 *  module position_matrix_dots in sts_utility_bracket
 *  (simple-thrust-stand.scad), function adjust_dist in mounting_holes
 *  (ldr-case.scad)
 * @sa BOSL2 path_spread module (BOSL2/paths.scad)
 * @sa include/landing-gear/replicate-and-position.scad
 */
module position(type, length,
            count = 1,
            offset = 0,
            start_angle = 0,
            insets = 0,
            axes = [1, 0, 0]            // not used
        )
{
    // TBD equilateral triangle, square, pentagon, ...

    if((type == "") || (type == "circle")) {
        radius = length;
        angle_incr = 360 / count;
        rotate([0, 0, start_angle])
            for(i = [0 : count - 1])
                rotate([0, 0, i * angle_incr])
                    translate([radius, 0, 0])
                        children();
    } else if(type == "rectangle") {
        // Rectangle corners
// TBD
// - see draw4corners (motor-mount/adjustable-motor-mount.scad)
//  - $index (TBD what does path_spread call this?)
        length_params = length;
        width = is_list(length_params) ? length_params.x : length_params;
        height = (is_list(length_params) && (len(length_params) > 1)) ?
                        length_params.y : length_params;
        halfw = width / 2;
        halfh = height / 2;
        // Starts in Q1, goes CCW
        positions = [[halfw, halfh], [-halfw, halfh], [-halfw, -halfh],
                        [halfw, -halfh]];

        rotate([0, 0, start_angle])
            for(i = [0 : 3])
                translate([positions[i].x, positions[i].y, 0])
                    children();
    } else if(type == "line") {
        // Along a line
        // TBR similar to af_distribute_laterally

        length2 = length - offset - insets * 2;

        spacing = (count == 1) ? 0 : length2 / (count - 1);
        // TBD start_angle?

        tv = [1, 0, 0];             // Along X

        for(i = [0 : count - 1])
            translate(tv * (offset + insets + spacing * i))
                children();
    } else {
        assert(false, "position: unknown type");
    }
}

module position_p(params)
{
    function opt_pstn_param(params, index, default = undef) =
                let(p = params[index]) (p == undef) ? default : p;

    start_angle = opt_pstn_param(params, position_start_angle_index, 0);
    position(
            params[position_type_index],
            params[position_length_index],
            params[position_count_index],
            params[position_offset_index],
            start_angle)
        children();
}


// WIP position on a rectangular surface

// Note surface dimensions provided separately
// ["type", diameter, ... optional parameters ...]
// ["middle", diameter]

// Or, more generally, position child object according to pattern and
// surface dimensions
// ["type", "opt_flags", ... optional parameters ...]
// [ "center, [axyz]", [num|[x,y,z] ]
