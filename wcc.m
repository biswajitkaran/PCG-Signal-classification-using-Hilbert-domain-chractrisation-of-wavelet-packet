clc;
close all;
clear all;
filelist = dir('*.mat');
N=length(filelist);

  for i=1:N
    fprintf('Processing %s\n', filelist(i).name);
    [x,fs]=audioread(filelist(i).name);
    [imf,~,F] = modwpt(x,'TimeAlign',true);
 
for j=1:16
[hs,f,t,imfinsf,imfinse] = hht(imf,fs);
a=mean(imfinse,2);
fmean=mean(imfinsf,2);

for k=1:length(x)
    en_dev(j,k)=abs(imfinse(j,k)-a(j,1));
    freq_dev(j,k)=abs(imfinsf(j,k)-fmean(j,1));
end
b(j,i)=sum(freq_dev(j,:))/length(x);
c(j,i)=sum(en_dev(j,:))/length(x);
end
end
final=[b' c'];
% convert the features in cepstral domain
    for k=1:N
    dc1=dct(log(final(k,1:32)));
    wcc(k,:)=dc1;
    end


