function [ output_args ] = plot_all_graphs( edges_in_graph, weights_in_graph)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
counter=23;
f = figure('visible','off');

for counter=1:length(weights_in_graph)
    G=graph(edges_in_graph{counter}(:,1), edges_in_graph{counter}(:,2), weights_in_graph{counter});
    figure(1)

    counter
    filename=sprintf('images/Graph_n%d_crit%c',counter, 'E')
    if (counter >0)
        LWidths = 5*G.Edges.Weight/max(G.Edges.Weight);
        fig=plot(G,'LineWidth',LWidths);
        saveas(fig, filename, 'epsc')
        pause(1.5)
    end
end

end

