## Copyright (C) 2023 Andrei
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
## @deftypefn {} {@var{retval} =} task2 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2023-02-28


function new_X = task2(photo, pcs)
  [m, n] = size(photo);
  
  % Initialization of the final matrix.
  new_X = zeros(m, n, 'double');
  
  % Calculate the mean for each row vector ai ∈ R1*n, i = 1:m.
  mean_vec = mean(photo, 2);
  
  % Update the row vectors ai ∈ R1*n, i = 1:m as ai = ai - μi.
  updated_photo = double(photo) - mean_vec;
  
  % Construct the matrix Z ∈ Rn*m.
  Z = transpose(updated_photo);
  
  % Calculate the SVD for matrix Z: Z = U*S*transpose(V).
  [U, S, V] = svd(Z);
  
  % Extract the k-dimensional principal component space W from the first k columns of matrix V.
  W = V(:, 1:pcs);
  
  % Calculate the projection of A into the principal component space, Y = transpose(W)*A.
  Y = transpose(W) * updated_photo;
  
  % Approximate the initial matrix, Ak = W*Y + μ, where μ is calculated at step 1.
  new_X = W * Y + mean_vec;
  
  % Transform the matrix to uint8 to obtain a valid image.
  new_X = uint8(new_X);
endfunction

