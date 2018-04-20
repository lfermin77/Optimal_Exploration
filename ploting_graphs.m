GE=graph(edges_in_graph_E{counter}(:,1), edges_in_graph_E{counter}(:,2), optimal_weight_E {counter});
GA=graph(edges_in_graph_A{counter}(:,1), edges_in_graph_A{counter}(:,2), optimal_weight_A {counter});
GD=graph(edges_in_graph_D{counter}(:,1), edges_in_graph_D{counter}(:,2), optimal_weight_D {counter});

LWidthsD = 5*GD.Edges.Weight/max(GD.Edges.Weight);
LWidthsA = 5*GA.Edges.Weight/max(GA.Edges.Weight);
LWidthsE = 5*GE.Edges.Weight/max(GE.Edges.Weight);


figure('Name','Optimality Criteria','NumberTitle','off');
title('Optimality Criteria')
subplot(1,3,1)


%plot(GE,'LineWidth',LWidthsE);
plot(GE,'LineWidth',LWidthsE, 'EdgeColor',[0*LWidthsE/5 1-LWidthsE/5 LWidthsE/5]);
title('E-Optimal')

subplot(1,3,2)
%plot(GA,'LineWidth',LWidths);
plot(GA,'LineWidth',LWidthsA, 'EdgeColor',[0*LWidthsA/5 1-LWidthsA/5 LWidthsA/5]);
title('A-Optimal')

subplot(1,3,3)
%plot(GD,'LineWidth',LWidthsD);
plot(GD,'LineWidth',LWidthsD, 'EdgeColor',[0*LWidthsD/5 1-LWidthsD/5 LWidthsD/5]);
title('D-Optimal')

