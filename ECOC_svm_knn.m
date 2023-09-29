% Code is written by Dr Biswajit karan post_doctoralfellow stellonbosch
% university

clear all;
close all; 
clc;
A=csvread('database1_wcc_features.csv');
g=A(:,33);

% ..........................................
groups = g; 
k=10;
cvFolds = crossvalind('Kfold', groups, k);   %# get indices of 10-fold CV
cp = classperf(groups); 
% t=templateSVM('KernelFunction','rbf');
t=templateKNN();
for i=1:k                   %# init performance tracker
 testIdx = (cvFolds == i);                %# get indices of test instances
 trainIdx = ~testIdx;   
meas=A(:,1:32);
meas=normalize(meas);
svmModel= fitcecoc(meas(trainIdx,:), groups(trainIdx),'OptimizeHyperparameters','auto','Learners',t);
[pred,score_auc] = predict(svmModel, meas(testIdx,:));
prediction{i}=pred;
score_auc1{i}=score_auc;
g1{:,i}=groups(testIdx);
confmatCV{i} = confusionchart(groups(testIdx),pred);
confmat{i}=confusionmat(groups(testIdx),pred);
cp = classperf(cp, pred, testIdx);
a{i}=cp.CountingMatrix;
corect_rate_fold(i)=cp.CorrectRate;
i
intervals= linspace(0, 1, 100);
[~,Scores]=predict(svmModel,meas(testIdx,:));
score{i}=Scores;

end

cp.CorrectRate;

%# get confusion matrix
%# columns:actual, rows:predicted, last-row: unclassified instances
z=cp.CountingMatrix;
z=z(1:5,1:5);

for j=1:5
for i =1:size(confmat{1,j},1)
    recall(j,i)=confmat{1,j}(i,i)/sum(confmat{1,j}(i,:));
   
end
uar(j)=[sum(recall(j,:))/5]*100;
end

for i =1:size(z,1)
    recall1(i)=z(i,i)/sum(z(i,:));
   
end
uar_overall=[sum(recall1)/5]*100;


%fold wise results
for j=1:5
% [Result(j),ReferenceResult(j)] = multiclass_metrics_special(confmat{:,j});
[metrices(j)]=multiclass_metrics_common(confmat{:,j});
end
metrices_overall=multiclass_metrics_common(z);