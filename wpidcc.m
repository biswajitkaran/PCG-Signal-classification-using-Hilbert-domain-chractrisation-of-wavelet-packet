% Code is written by Dr Biswajit karan post_doctoralfellow stellonbosch
% university
clc;
close all;
clear all;
filelist = dir('*.mat');
N=length(filelist);
for i=1:N
    fprintf('Processing %s\n', filelist(i).name);
    [x1,fs]=audioread(filelist(i).name);
    %     [imf its]=ceemdan(x1,0.2,100,1000);
   [imf,~,F] = modwpt(x,'TimeAlign',true);
for j=1:16
a=mean(imf,2);
for k=1:length(x)
    wpt_dev(j,k)=abs(imf(j,k)-a(j,1));
    end
b(j,i)=sum(wpt_dev(j,:))/length(x1);
end
end
final=[b'];
   % convert the features in cepstral domain
for k=1:N
    dc1=dct(log(final(k,1:32)));
    wpidcc(k,:)=dc1;
end


