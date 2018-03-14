function [ value, edge_set hessian] = find_optimal( p )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
number_of_edges=10;

x0=ones(number_of_edges,1)/(number_of_edges);
%x0(1)=1/4;

A=[];
b=[];
Aeq = ones(number_of_edges,1)';
beq = 1;
lb=zeros(number_of_edges,1);
ub= ones(number_of_edges,1);

[edge_set,fval,exitflag,output,lambda,grad,hessian]= fmincon(@information_function,x0,A,b,Aeq,beq,lb,ub);

value= -fval;
hessian;

end

