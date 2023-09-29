clc;
close all;
clear all;
filelist = dir('*.wav');
N=length(filelist);
for i=1:N
     x = audioread(filelist(i).name);
    fprintf('Processing %s\n', filelist(i).name);
   fs=8000;
   [hs,f,t,imfinsf,imfinse] = hht(x,fs);
   [imf_f,~,F] = modwpt(imfinsf,'TimeAlign',true);
   [imf_e,~,F] = modwpt(imfinse,'TimeAlign',true);
for j=1:16
a=mean(imfinsf,2);
h=mean(imfinse,2);
for k=1:length(x)
    wpt_dev(j,k)=abs(imf_f(j,k)-a(j,1));
    wpt_dev1(j,k)=abs(imf_e(j,k)-h(j,1));
    end
b(j,i)=sum(wpt_dev(j,:))/length(x);
l(j,i)=sum(wpt_dev1(j,:))/length(x);

end
end
final=[b',l'];
% convert the features in cepstral domain
   for k=1:N
    dc1=dct(log(final(k,1:32)));
    hpidcc(k,:)=dc1;
end


