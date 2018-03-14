## Copyright (C) 2017 unizar
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} path2edges (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: unizar <unizar@OMEN>
## Created: 2017-07-03

function [edges_traversed] = path2edges (path, edge_set)
number_of_edges_traversed = length(path)-1;

edges_traversed(number_of_edges_traversed)=0;

for i=1:number_of_edges_traversed
    edge_from = path(i);
    edge_to   = path(i+1);
    r_set = [edge_from , edge_to ];
    f_set = [edge_to, edge_from];
   
    for j=1:size(edge_set,1)
      if(  (r_set ==edge_set(j,:) ) || (f_set ==edge_set(j,:) ) )
        edges_traversed(j)=edges_traversed(j)+1;
      end
    end
 end
  
  
endfunction
