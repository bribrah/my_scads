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

include <shortcuts.scad>
include <shape-functions.scad>

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

