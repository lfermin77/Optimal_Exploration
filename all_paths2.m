% ## Copyright (C) 2017 leonardo
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
% ## @deftypefn {Function File} {@var{retval} =} all_paths (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
% 
% ## Author: leonardo <leonardo@TrustyXVI>
% ## Created: 2017-05-04

function [path, optimality,best_possible] = all_paths2 (path_size)

tic


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
% A=A+A'

% A=zeros(4);
% A(1,2)=1; A(2,3)=1;A(3,4)=1;A(1,4)=1;A(1,3)=1;
% xy=[ 1 0; 2 1; 3 0; 2 -1];
% A=A+A'




 path(1)=[1];


 clf;
 figure(1)
% gplot (A, xy, "o-");
 gplot (A, xy);
%  set (get (gca, ("children")), "markersize", 12);
%  title ("gplot() of Binary Tree Adjacency matrix");
title('Graph Topology')


% current_edge_matrix = {};
tagged_Adjacency = zeros(length(A));
 k=0;
 edge_set=[];
 for i=1:length(A)
  for j=1:i
    if(A(i,j) == 1)
      k=k+1;
      tagged_Adjacency(i,j)=k;
      tagged_Adjacency(j,i)=k;
      edge_set = [edge_set ;[i,j]];
      edge_matrix=zeros(length(A));
      edge_matrix(i,i)=1;
      edge_matrix(j,j)=1;
      
      edge_matrix(i,j)=-1;
      edge_matrix(j,i)=-1;
      current_edge_matrix(k,:,:)=edge_matrix;
%      current_edge_matrix{k}=edge_matrix;
%      current_edge_matrix
    end
   end
 end
 
%edge_set
query_edge=[2 1];
position=find(edge_set(:,1)==query_edge(1) &edge_set(:,2)== query_edge(2));
%tagged_Adjacency
 
%size(edge_set,1)
%size(current_edge_matrix) 
%current_edge_matrix{7}
%k
max_degree=0;

for i=1:length(A)
  connections=[];
  for j=1:length(A)
    if(A(i,j) ==1)
      connections=[connections, j];
    end
  end
  graph_node{i} = connections;
 end


adj_size=length(A);
 

 edges_traversed=[];
 vector_edges(length(edge_set))=0;
% path_size=2;



best_possible(path_size,10)=0;
best_index(path_size,10)=0;

%%%%%Find all paths
for i=1:path_size
  current_paths=[];
  [current_paths, edges_traversed, vector_edges] = expand_path(path, tagged_Adjacency, edges_traversed, vector_edges);
  path = current_paths;
  
%  pause
   parfor j=1:size(path,1)
      path_vector = path(j,:);
      lambdas_path(j,:) = (evaluate_path (path_vector, adj_size));
      optimality(j,:)=power_mean(lambdas_path(j,:) );
    
    end
     i
    [best_possible(i,:), best_index(i,:)]=max(optimality);
    

end

size(path)

best_possible

optimality=0;

optimality=best_index;
%%length(path{1})
%number_of_paths = length(path)
%
lambdas_path(length(path),adj_size-1)=0;

%path

%for i=1:size(path,1)
%  path_vector = path(i,:);
%  lambdas_path(i,:) = (evaluate_path (path_vector, adj_size));
%  optimality(i,:)=power_mean(lambdas_path(i,:) );
%
% endfor
%
%
%  
% lambdas_path;
% optimality = fliplr(optimality);
% 
% [~,index_sort]=sort(optimality(:,end-2));
% 
% index_sort= flipud(index_sort);
% 
% %optim_sorted = ( sortrows(optimality,-1));
% optim_sorted = optimality(index_sort,:);
%
%path=path(index_sort);
%
% 
% % optimality=lambdas_path;
% optimality = optim_sorted;
%
% 
% figure(2)
%% plot( -3:0.5:1,log(optim_sorted(1:30,:)+10^(-40))')
%  surf(log10(optim_sorted(1:30,:)+10^(-40)))

elapsed_time_minutes=toc/60
best_optimals= best_possible;
best_possible=best_possible(:,[1 6 8 10])

Figure_3=figure(3)
set(Figure_3,'defaulttextinterpreter','latex');
plot(best_possible)
title('Connectivity Index versus Traversed Edges', 'Interpreter','latex')
xlabel('Traversals $$ 5 $$','Interpreter','latex') % x-axis label
ylabel('Connectivity Index') % y-axis label
%legend('Algebraic Connectivity = E-Optimal','Kirchoff Index= A-Optimal','Number of Spanning trees= D-Optimal','Average Node Degree= T-Optimal','Location','northwest' )
legend(' p \rightarrow -\infty ','p=-1','p=0','p=1', 'Interpreter','latex' ,'Location','northwest')
%$p\to \infty$'

size(best_possible)
a=repmat(1:size(best_possible,1),  size(best_possible,2),1)';
figure(4)
efficiency=best_possible./a
plot(best_possible./a)
title('Average Information versus Traversed Edges')
xlabel('Traversals') % x-axis label
ylabel('Average Information') % y-axis label
%legend('Algebraic Connectivity = E-Optimal','Kirchoff Index= A-Optimal','Number of Spanning trees= D-Optimal','Average Node Degree= T-Optimal','Location','northwest' )
legend(' p \rightarrow -\infty ','p=-1','p=0','p=1', 'Interpreter','latex' ,'Location','northwest')

best_possible=best_optimals;

end