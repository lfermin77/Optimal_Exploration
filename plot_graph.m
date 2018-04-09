function [ output_args ] = plot_graph( G)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
figure(1)
LWidths = 5*G.Edges.Weight/max(G.Edges.Weight);
plot(G,'LineWidth',LWidths)
end

