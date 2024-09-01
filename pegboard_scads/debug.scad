/**
 * @file
 * @brief Debug functions and modules.
 * @author Mike Larson
 * @version 576b20d
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
 * @brief "echo" utility that can be invoked inside functions
 * @sa See OpenSCAD tips and tricks section 5 "Debug"
 * https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Tips_and_Tricks#Debug
 * @note Set this to enable: $_debug = true;
 */
function debugTap(o, s) = let(
  nothing = [ for (i = [1:1]) if ($_debug) echo(str(s, ": ", o)) ]) o;

/**
 * @brief Color + modifier command, applies a standard color or
 *  one of the modifier characters to the child objects.
 */
module color_mod(color = undef, alpha = undef)
{
    function is_valid_str(str) = (str != undef) && (str != "");

    module local_color(color, alpha)
    {
        if(alpha != undef)
            color(color, alpha) children();
        else
            color(color, 1.0) children();
    }

    if(is_valid_str(color)) {
        if(color == "*")            // Doesn't work?
            *children();
        else if(color == "!")       // Only works once if applied to many
            !children();
        else if(color == "#")
            #children();
        else if(color == "%")
            %children();
        else
            local_color(color, alpha)
                children();
    } else {
        children();
    }
}

/**
 * @brief Similar to color command, except can be disabled and has
 * special modifier colors.
 */
module debug_color(color = undef, alpha = undef, debug_enable = false)
{
    function is_debug_enabled() = debug_enable;
    if(is_debug_enabled()) {
        color_mod(color = color, alpha = alpha)
            children();
    } else {
        children();
    }
}

/**
 * @brief Echo viewport parameters in human readable form and in the
 *  command line --camera format.
 * @todo Does this belong in debug.scad?
 */
module echo_viewport_params()
{
    // WIP $vpf (requires version 2021.01), not needed for --camera
    echo(str("Viewport: translate = ", $vpt, " rotate = ", $vpr, " distance = ", $vpd, " FOV = ", $vpf));
    echo(str("--camera ", $vpt.x, ",", $vpt.y, ",", $vpt.z, ",",
                          $vpr.x, ",", $vpr.y, ",", $vpr.z, ",",
                          $vpd));
}
