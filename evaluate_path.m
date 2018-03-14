% ## Copyright (C) 2017 leonardo
% ## 
% ## This program is free software; you can redistribute it and/or modify it
% ## under the terms of the GNU General Public License as published by
% ## the Free Software Foundation; either version 3 of the License, or
% ## (at your option) any later version.
% ## 
% ## This program is distributed in the hope that it will be useful,
% ## but WITHOUT ANY WARRANTY; without even the implied warranty of
% ## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% ## GNU General Public License for more details.
% ## 
% ## You should have received a copy of the GNU General Public License
% ## along with this program.  If not, see <http://www.gnu.org/licenses/>.
% 
% ## -*- texinfo -*- 
% ## @deftypefn {Function File} {@var{retval} =} evaluate_path (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
% 
% ## Author: leonardo <leonardo@TrustyXVI>
% ## Created: 2017-05-08

function [lambda_vec] = evaluate_path (path, edge_set_size)
  number_of_edges_traversed = length(path)-1;
  
  Incidence_Matrix = zeros(edge_set_size, number_of_edges_traversed);

  for i=1:number_of_edges_traversed
    edge_from = path(i);
    edge_to   = path(i+1);
    Incidence_Matrix(edge_from,i) = -1;
    Incidence_Matrix(edge_to,i  ) =  1;  
  end
  Laplacian = Incidence_Matrix*Incidence_Matrix';
  

  
  lambda_vec = sort(eig(Laplacian));
 lambda_vec=lambda_vec(2:end);

end
