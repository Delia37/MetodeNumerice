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
## @deftypefn {} {@var{retval} =} magic_with_pca (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-08

function [train, miu, Y, Vk] = magic_with_pca(train_mat, pcs)
  [m, n] = size(train_mat);
  
  % initializare train
  train = zeros(m, n);
  
  % initializare miu
  miu = zeros(1, n);
  
  % initializare Y
  Y = zeros(m, pcs);
  
  % initializare Vk
  Vk = zeros(n, pcs);
  
  % cast train_mat la double
  train_mat = double(train_mat);
  
  % calculeaza media fiecarei coloane a matricii
  miu = mean(train_mat);
  
  % scade media din matricea initiala
  train = train_mat - miu;
  
  % calculeaza matricea de covarianta
  cov_matrix = transpose(train) * train / (m - 1);
  
  % calculeaza vectorii si valorile proprii ale matricei de covarianta
  [V, D] = eig(cov_matrix);
  
  % sorteaza descrescator valorile proprii si creaza o matrice Vk formata din vectorii proprii asezati pe coloane
  [sorted_eigenvalues, indices] = sort(diag(D), 'descend');
  Vk = V(:, indices);
  
  % pastreaza doar primele pcs coloane din matricea Vk
  Vk = Vk(:, 1:pcs);
  
  % creaza matricea Y schimband baza matricii initiale
  Y = train * Vk;
  
  % calculeaza matricea train care este o aproximatie a matricii initiale folosindu-va de matricea Vk calculata anterior
  train = Y * transpose(Vk);
endfunction