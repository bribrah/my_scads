/**
 * @file
 * @brief Parameter fetching utility functions.
 * @author Mike Larson
 * @version 9c46ee6
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

/**
 * @brief Fetch an item from a list, returning defval if the input
 *  list is undefined or the item at the index parameter does not
 *  exist.
 * @note Do not see same functionality in BOSL2/arrays.scad.
 * @note Useful when a parameter list has optional items at the end.
 */
function list_fetch_item(lst, index, defval = 0) =
            ((lst != undef) && (lst[index] != undef)) ? lst[index] : defval;

/**
 * @brief If the input params is a scalar, return it. If params is a
 *  list and the input index is a valid index for the list, return
 *  params[index]. Otherwise return defval.
 * @note Similar to list_fetch_item but takes a scalar or a list
 */
function fetch_param(params, index, defval = 0) =
            (!is_list(params) && (params != undef)) ? params :
                list_fetch_item(params, index, defval);


/**
 * @brief If the input 'p' is a number, return it. Otherwise, 'p'
 *  must be a list of llen items, in which case, return the item
 *  at the input index.
 * @note Useful shortcut for when the items in a list of a known size have
 *  the same value or when changing an existing function's parameter
 *  from a number to a number or a list for backwards compatibility.
 */
function fetch_param_num_or_list_of_n(p, index, llen = 2) =
            assert(is_num(p) || (is_list(p) && (len(p) == llen)),
                    str("p must be a number or a list of ", llen, " items"))
            assert(is_num(p) || (index < llen), "invalid index")
            is_num(p) ? p : p[index];

