function [ value ] = information_function( traversals )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%%%%%%%%%%%% Define p

p=0;

%%%%%%%%%%%%%%%%%%%%% Define Adjacency Matrix

 A = [0 1 1 0 1 0 0
      1 0 1 0 0 0 0
      1 1 0 1 0 0 0
      0 0 1 0 1 1 0
      1 0 0 1 0 1 1
      0 0 0 1 1 0 1
      0 0 0 0 1 1 0];
 
  

 xy = [0  , 0
       1  , 1
       0  , 2
       -1 , -1
       0  , -1
       0  , -3
       1  , -2];

% A= ones(4)-eye(4); xy=[0 0 ; 0 1; 1 1 ; 1 0];

% A=zeros(5);
% A(1,3)=1; A(1,5)=1;A(2,3)=1;A(2,5)=1;A(3,4)=1;A(4,5)=1;
% A(3,5)=1;
% xy=[0 0; 1 0; 2 1; 3 0; 2 -1];
% A=A+A';

% A=zeros(4);
% A(1,2)=1; A(2,3)=1;A(3,4)=1;A(1,4)=1;A(1,3)=1;
% xy=[ 1 0; 2 1; 3 0; 2 -1];
% A=A+A'

n=size(A,1);


% %%%%% Optional drawing
% figure(10)
% gplot (A, xy);


%%%%%%%%%%%%%%%%%%%
%%% Build the Incidence Matrix

Incidence=[];
for i=1:n
    for k=1:i
        if(A(i,k)==1)
            connected = [i k];
            incidence_vector = zeros(n, 1);
            incidence_vector(i)=1;
            incidence_vector(k)=-1;
            Incidence=[Incidence incidence_vector];
        end
    end
end


m=size(Incidence,2)

Laplacian_x = Incidence*diag(traversals)*Incidence';

 lambda_vec = sort(eig(Laplacian_x))
 lambda_vec=lambda_vec(2:end)
 




%%%%%%%%%%%
%%% Calculate 
value=- n_power_mean (lambda_vec, p);

value=-lambda_vec(1);



end

