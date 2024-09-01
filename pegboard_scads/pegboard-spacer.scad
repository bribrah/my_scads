/**
 * @file
 * @brief Pegboard spacer
 * @author Mike Larson
 * @version 28b516f
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

pegboard_spacer(pgbd_dflt_spacer_rim_od,pgbd_dflt_spacer_mid_od,pgbd_dflt_spacer_id,pgbd_dflt_spacer_height,pgbd_dflt_spacer_rim_height);