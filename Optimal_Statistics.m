function [ Euler_Value, Optimal_Value, Edges_in_Graph, Optimal_Weights ] = Optimal_Statistics(Incidence_Matrices, p)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

global current_p
current_p = p;

global current_Incidence

j=0;
Euler_Value=[];
Optimal_Value=[];
Edges_in_Graph={};
Optimal_Weights ={};

for i=1: length(Incidence_Matrices)
    current_Incidence = Incidence_Matrices{i}';
    number_of_edges= size(current_Incidence,2);
    approximation = ones(number_of_edges,1)/number_of_edges;

    current_p = -100;
    graph = i
    connected = -information_function_dynamic( approximation )
    current_p = p;
    
    if (connected< 1e-10)
        graph_is_not_connected =0
    else
        graph_is_connected=1
        j=j+1;
        
        Euler_Value(j) = -information_function_dynamic( approximation )/number_of_edges;
        
        %%%%%%% Calculate optimal
        x0=ones(number_of_edges,1)/(number_of_edges);
        A=[];
        b=[];
        Aeq = ones(number_of_edges,1)';
        beq = 1;
        lb=zeros(number_of_edges,1);
        ub= ones(number_of_edges,1);
        
        [edge_set,fval,exitflag,output,lambda,grad,hessian]= fmincon(@information_function_dynamic,x0,A,b,Aeq,beq,lb,ub);
        
        Optimal_Value(j) = -fval;
        %%%%%%%%%%%
       
        edge_set
       Optimal_Weights{j}=edge_set;
        
        Laplacian_x = current_Incidence*diag(edge_set)*current_Incidence';
        lambda_vec = sort(eig(Laplacian_x));
        lambda_vec=lambda_vec(2:end)
        
        Laplacian_x = current_Incidence*diag(approximation)*current_Incidence';
        lambda_vec2 = sort(eig(Laplacian_x));
        lambda_vec2=lambda_vec2(2:end)
        
        figure(1)
        plot(lambda_vec)
        hold on
        plot(lambda_vec2,'r')
        hold off
        
%        figure(2)
        [from, into]=incidence_binary2numeric(current_Incidence');
    
         edges_ghost=[from; into]';
         Edges_in_Graph{j}= edges_ghost;

%         EdgeTable = table(edges_ghost,'VariableNames',{'EndNodes'})
         
%         G = graph(EdgeTable);
%          adj=current_Incidence*current_Incidence';
%          size(adj)
%         G= graph(adj, 'OmitSelfLoops')
%         size(from)
%         size(edges_ghost)

        
%        Graph_draw = graph(edges_ghost);
%        Graph_draw = graph(from', into');
%        plot(Graph_draw)
        
        
    end
    i
%    pause(1)
    
    
%    laplacian_size = size(Incidence_Matrices{i}' * Incidence_Matrices{i})


end

Number_of_graph_connected_is =j

Efficiency = Euler_Value./Optimal_Value;

Efficiency_average = sum(Efficiency )/length(Efficiency )

Efficiency_RMS = sqrt(sum( (Efficiency-Efficiency_average).^2 )/length(Efficiency ))

plot(Efficiency)
axis([0 inf 0 1.1])

end
