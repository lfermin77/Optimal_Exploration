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
% ## GNU General Public License for more details.pa
% ## 
% ## You should have received a copy of the GNU General Public License
% ## along with this program.  If not, see <http://www.gnu.org/licenses/>.
% 
% ## -*- texinfo -*- 
% ## @deftypefn {Function File} {@var{retval} =} expand_path (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
% 
% ## Author: leonardo <leonardo@TrustyXVI>
% ## Created: 2017-07-03

function [paths_out, edges_traversed_out, vector_edges_out] = expand_path (paths_in, Adjacency, edges_traversed, vector_edges_in)
  path_in_size=size(paths_in,1);
  max_degree_in = max(sum(Adjacency~=0));
  number_of_edges=max(max(Adjacency));
  
  paths_out(max_degree_in*path_in_size, size(paths_in,2)+1)=0;
  after=0;
  paths_out2(max_degree_in*path_in_size, size(paths_in,2)+1)=0;
  edges_traversed_out(max_degree_in*path_in_size, size(paths_in,2))=0;

  vector_edges_out(max_degree_in*path_in_size, number_of_edges)=0;
  
   for i=1:length(Adjacency)
    connections=[];
    edges_connecting=[];
    for j=1:length(Adjacency)
      if(Adjacency(i,j) > 0)
        connections=[connections, j];
        edges_connecting=[edges_connecting, Adjacency(i,j)];
      end
    end
    graph_node{i} = connections;
    incident_edges{i}= edges_connecting;
   end
 
 
 %%%%%Expanding
 index=1;
 index2=1;
 for i=1:size(paths_in,1)
  current_path = paths_in(i,:);
  if(length(edges_traversed)==0)
    current_edges=[];
  else
    current_edges = edges_traversed(i,:);
  end
  
  vector_edges_temp = vector_edges_in(i,:);
  
  last_node = current_path(end) ;  
  
  next_nodes = graph_node{last_node};
  next_edges = incident_edges{last_node};
  
  temp_path = zeros(length(next_nodes), length( current_path)+1);
  temp_path(:, 1:length(current_path))= repmat(current_path,length(next_nodes),1);
  
  for j=1:length(next_nodes)
    next_nodes(j);
    %new_node_added
    paths_out(index,:)=[current_path   next_nodes(j)];
    
    edges_traversed_out(index,:) =[current_edges next_edges(j)];
       %%%%%%
    temp_path(j,length(current_path)+1)=next_nodes(j);
    
    new_vector_edge=zeros(1,number_of_edges) ;
    new_vector_edge(next_edges(j))=1;
    vector_edges_out(index,:) = vector_edges_temp +  new_vector_edge;
    index=index+1;    
  end

 % from=index-j
 %   to=index-1
%   paths_out
%   paths_out2
%   index2:index2+j-1
%   paths_out2( index2:index2+j-1 , :)
%   temp_path
%   index2=index2+j;
  

end
paths_out(index:end,:)=[];
edges_traversed_out(index:end,:)=[];
vector_edges_out(index:end,:)=[];

size_before_purge=size(vector_edges_out,1)

%%%%% %%%%%%%%%Purging with same edges traversed
%%%%% paths_purged = zeros(size(paths_out));
%%%%% vector_edges_purged =zeros(size(paths_out,1),number_of_edges);
%%%%%  indice=1;
%%%%% for i=1:size(paths_out,1)
%%%%%  %%%%%%%% Find edge traversed in current list
%%%%%  query_vector_edge = vector_edges_out(i,:);
%%%%%  j=0;
%%%%%  keep_going=true;
%%%%%  while(keep_going==true)
%%%%%    j=j+1;
%%%%%    old_vector=isempty(find(query_vector_edge-vector_edges_purged(j,:)));
%%%%%    zero_vector=isempty(find( vector_edges_purged(j,:)  ));
%%%%%    if(old_vector)
%%%%%      keep_going=false;
%%%%%    end
%%%%%    if(zero_vector)
%%%%%      %%% Add new vector
%%%%%      paths_purged(indice,:)=paths_out(i,:);
%%%%%      vector_edges_purged(indice,:)= query_vector_edge;
%%%%%      indice=indice+1;
%%%%%      keep_going=false;
%%%%%    end
%%%%%    if(j==size(paths_out,1))
%%%%%      keep_going=false;
%%%%%    end
%%%%%  end
%%%%% end
%%%%%  
%%%%%vector_edges_purged(indice:end,:)=[];
%%%%%paths_purged(indice:end,:)=[];
%%%%%
%%%%%
%%%%%  size_after_purge = size(vector_edges_purged,1)
%%%%%
%%%%%vector_edges_out=vector_edges_purged;
%%%%%paths_out= paths_purged;

end