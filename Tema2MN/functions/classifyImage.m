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
## @deftypefn {} {@var{retval} =} classifyImage (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-08

function prediction = classifyImage(im, train_mat, train_val, pcs)
  % initializare predictie
  prediction = -1;
  
  % cast im la double
  im = double(im);
  
  % aplica functia magic_with_pca setului de date de antrenament
  [train, ~, Y, Vk] = magic_with_pca(train_mat, pcs);
  
  % scade din vectorul imagine media fiecarei coloane din train_mat
  im = im - mean(train_mat);
  
  % schimbati baza inmultind cu matricea Vk
  transformed_im = im * Vk;
  
  % calculeaza predictia folosindu-va de metoda k nearest neighbour implementata anterior cu k = 5
  prediction = KNN(train_val, Y, transformed_im, 5);
endfunction