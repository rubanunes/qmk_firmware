/*
Copyright 2021 Dr.Doof

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#pragma once


/* key matrix size */
#define MATRIX_ROWS 5
#define MATRIX_COLS 16

/* key matrix pins */
#define MATRIX_ROW_PINS { B4, D2, D4, D6, D7 }
#define MATRIX_COL_PINS { D3, D5, C6, C7, B6, B5, B7, F0, F1, F4, F5, F6, F7, B3, B2, D1 }

/* COL2ROW or ROW2COL */
#define DIODE_DIRECTION COL2ROW