function [ value ] = information_function_dynamic( traversals )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%%%%%%%%%%%% Read p
global current_p
p=current_p;

%%%%%%%%%%%% Read Incidence
global current_Incidence
Incidence = current_Incidence;


m=size(Incidence,2);

Laplacian_x = Incidence*diag(traversals)*Incidence';

 lambda_vec = sort(eig(Laplacian_x));
 lambda_vec=lambda_vec(2:end)
 




%%%%%%%%%%%
%%% Calculate 
if p >-50
    value=- n_power_mean (lambda_vec, p);
else
    value=-lambda_vec(1);
end



end

