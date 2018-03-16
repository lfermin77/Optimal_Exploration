function [ specter, R] = specter_analysis( Incidence_Matrices)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
R=[];
for i=1: length(Incidence_Matrices)
   current_Incidence = Incidence_Matrices{i}';
   current_Laplacian = current_Incidence*current_Incidence';
   specter{i}= sort(eig(current_Laplacian), 'descend');
   spec_correct = specter{i}(1:end-1);
   if(spec_correct(end) > 0.000000000000000000000000000001)
       %log_plus=log(spec_correct);
       
%       spec_correct 
       ie1 = find(abs(spec_correct-1) < 0.00001);
       if length(ie1)>1
           ie1(1)=[];
           
           spec_correct (ie1)=[]
       end

       %ie2 = find(spec_correct==1,1,'last')
       %spec_correct = spec_correct([1:ie1,ie2:end])
       log_plus=log(spec_correct);
       
       
       log_plus = log_plus/max(log_plus);
     %  plot( log_plus );
       plot(spec_correct,'o')
       i
       if(length(spec_correct)>2)
           x=1:length(spec_correct);
           hold on
           [fixed, gof] = fit( x', spec_correct,  'exp1' );
           plot(fixed)
           
           fixed
           gof
           R=[R gof.rsquare];

           hold off
           
%       pause
   end
end


end

