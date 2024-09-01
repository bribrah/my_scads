/**
 * @file
 * @brief OpenSCAD shortcuts and various other small utilities.
 * @author Mike Larson
 * @version 500b88b
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

include <units.scad>

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

