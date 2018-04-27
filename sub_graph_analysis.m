path_index=1:4^6-1;
path_str=dec2base(path_index,4);

path_number=[];
path_number(size(path_str,2),size(path_str,1))=0;

for i=1:size(path_str,1)
    for j=1:size(path_str,2)
        path_number(j,i)=str2num(path_str(i,j));
    end
end

path_size = sum(path_number);

[Y,I]=sort(path_size);
path_number(:,I);

clear subgraphs
for i=1:18
    subgraphs{i}=[];%zeros(6,1);
end

for i=1:4^6-1
    a=sum(path_number(:,i));
    if (a<19)
        subgraphs{a}=[subgraphs{a}, path_number(:,i)];
    end
end

K_inc =[
     0     0     0     1     1     1
     0     1     1     0     0     -1
     1     0     -1     0     -1     0
     -1     -1     0     -1     0     0];

optimal_value(12,10)=0;
 
for i=1:18
    A=subgraphs{i};
    paths_size = size(A,2);
    optimality=[];
    optimality(paths_size, 10)=0;

    for j=1:paths_size
        current_Laplacian=K_inc*diag(A(:,j))*K_inc';
        lambdas= sort(eig(current_Laplacian));
        lambdas(1)=[];
        optimality(j,:)=power_mean(lambdas);
    end
    i
    paths_size
    optimal_value(i,:)=max(optimality)
end


best_posible_K4_unconstrained=optimal_value;

best_possible=best_posible_K4_unconstrained;
        
        
        
 
 