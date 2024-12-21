## Copyright (C) 2021 Andrei
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} task1 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-14

function new_X = task1(photo, k)
  [m, n] = size(photo);
  
  % Initializare matrice finală.
  new_X = zeros(m, n);
  
  % Cast photo la tipul double.
  photo = double(photo);
  
  % Aplică algoritmul SVD asupra photo.
  [U, S, V] = svd(photo);
  
  % Calculează noile matrici reduse U, S și V.
  U = U(:, 1:k);
  S = S(1:k, 1:k);
  V = V(:, 1:k);
  
  % Calculează new_X, care este aproximarea matricii initiale photo,
  % folosindu-vă de matricile calculate anterior.
  new_X = U * S * transpose(V);
  
  % Transformă matricea în uint8 pentru a fi o imagine validă.
  new_X = uint8(new_X);
endfunction
