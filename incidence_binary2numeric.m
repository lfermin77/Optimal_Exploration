function [ from, into ] = incidence_binary2numeric( incidence_binary )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

from=[];
into=[];

number_of_edges=length(incidence_binary(:,1))

for i=1:number_of_edges
    edge= find(incidence_binary(i,:));
    from=[from edge(1)];
    into=[into edge(2)];    
end

end

