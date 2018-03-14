% ## Copyright (C) 2017 unizar
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
% ## @deftypefn {Function File} {@var{retval} =} n_power_mean (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
% 
% ## Author: unizar <unizar@OMEN>
% ## Created: 2017-05-08

function [p_mean] = n_power_mean (vector, p)
  V=length(vector);
  vector=real(vector);
  are_there_zeros = ~isempty(find(vector==0));
  p_negative = p<=0;
  
  vector = abs(vector);

  
  
  if(are_there_zeros && p<=0)
    p_mean=0;
  elseif(p==0)
    p_mean = (abs(prod(vector)))^(1/V);  
  else
    p_mean = (sum(vector.^p)/V)^(1/p);  
  end  

end