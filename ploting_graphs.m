
GE=graph(edges_in_graph_E{counter}(:,1), edges_in_graph_E{counter}(:,2), optimal_weight_E {counter});
GA=graph(edges_in_graph_A{counter}(:,1), edges_in_graph_A{counter}(:,2), optimal_weight_A {counter});
GD=graph(edges_in_graph_D{counter}(:,1), edges_in_graph_D{counter}(:,2), optimal_weight_D {counter});

LWidthsD = 5*GD.Edges.Weight/max(GD.Edges.Weight);
LWidthsA = 5*GA.Edges.Weight/max(GA.Edges.Weight);
LWidthsE = 5*GE.Edges.Weight/max(GE.Edges.Weight);


%figure('Name','Optimality Criteria','NumberTitle','off');
close all
%figure(4)



%title('Optimality Criteria')
%set(gcf, 'Position', [100, 100, 10000, 500])
%subplot(1,3,1)

figure('Name','E-Optimal','NumberTitle','off');
AxesE = axes; 
InSet = get(AxesE, 'TightInset');
set(AxesE, 'Position', [InSet(1:2), 1-InSet(1)-InSet(3), 1-InSet(2)-InSet(4)])

%plot(GE,'LineWidth',LWidthsE);
plot(GE,'LineWidth',LWidthsE, 'EdgeColor',[0*LWidthsE/5 1-LWidthsE/5 LWidthsE/5],'NodeLabel',{});%,'EdgeLabel',round(20*LWidthsE));
%title('E-Optimal')

set(gca,'YTickLabel',[],'XTickLabel',[])




figure('Name','A-optimal','NumberTitle','off');
AxesA = axes; 
InSet = get(AxesA, 'TightInset');
set(AxesA, 'Position', [InSet(1:2), 1-InSet(1)-InSet(3), 1-InSet(2)-InSet(4)])

%subplot(1,3,2)
%plot(GA,'LineWidth',LWidths);
%plot(GA,'LineWidth',LWidthsA, 'EdgeColor',[0*LWidthsA/5 1-LWidthsA/5 LWidthsA/5]);
plot(GA,'LineWidth',LWidthsA, 'EdgeColor',[0*LWidthsA/5 1-LWidthsA/5 LWidthsA/5],'NodeLabel',{});%,'EdgeLabel',round(20*LWidthsA));
%title('A-Optimal')
set(gca,'YTickLabel',[],'XTickLabel',[])


figure('Name','D-optimal','NumberTitle','off');
AxesD = axes; 
InSet = get(AxesD, 'TightInset');
set(AxesD, 'Position', [InSet(1:2), 1-InSet(1)-InSet(3), 1-InSet(2)-InSet(4)])


%subplot(1,3,3)
%plot(GD,'LineWidth',LWidthsD);
plot(GD,'LineWidth',LWidthsD, 'EdgeColor',[0*LWidthsD/5 1-LWidthsD/5 LWidthsD/5],'NodeLabel',{});%,'EdgeLabel',round(20*LWidthsD));
%title('D-Optimal')
set(gca,'YTickLabel',[],'XTickLabel',[])


%set(findobj(gcf, 'type','axes'), 'Visible','off')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%best_optimality= best_possible;
best_optimality = flip( best_possible(:,[1 6 8 10]) , 2);
%best_optimality= best_possible;



Figure_3=figure('Name','Information','NumberTitle','off');
%set(Figure_3,'defaulttextinterpreter','latex');
plot(best_optimality, 'LineWidth',3)
set(gcf, 'Position', [100, 500, 700, 500])
title('Information Criteria versus Traversals')
%xlabel('Traversals $$ 5 $$','Interpreter','latex') % x-axis label
%xlabel('Traversals','Interpreter','latex') % x-axis label
xlabel('Number of Traversals') % x-axis label
ylabel('Information Value') % y-axis label
%legend('Algebraic Connectivity = E-Optimal','Kirchoff Index= A-Optimal','Number of Spanning trees= D-Optimal','Average Node Degree= T-Optimal','Location','northwest' )
%legend(' p \rightarrow -\infty ','p=-1','p=0','p=1', 'Interpreter','latex' ,'Location','northwest')
legend('T-Optimality','D-Optimality','A-Optimality',' E-Optimality ','Location','northwest')
%$p\to \infty$'

%size(best_possible)
a=repmat(1:size(best_optimality,1),  size(best_optimality,2),1)';
figure('Name','Information Rate','NumberTitle','off');
efficiency=best_optimality./a
plot(best_optimality./a, 'LineWidth',3)
set(gcf, 'Position', [1000, 500, 700, 500])
title('Information Rate versus Traversals')
xlabel('Number of Traversals') % x-axis label
ylabel('Information Rate ') % y-axis label
%legend('Algebraic Connectivity = E-Optimal','Kirchoff Index= A-Optimal','Number of Spanning trees= D-Optimal','Average Node Degree= T-Optimal','Location','northwest' )
%legend(' p \rightarrow -\infty ','p=-1','p=0','p=1', 'Interpreter','latex' ,'Location','northwest')
legend('T-Optimality','D-Optimality','A-Optimality',' E-Optimality ','Location','northwest')
