clc;
close all;
clear all;
filelist = dir('*.wav');
N=length(filelist);
for i=1:N
    fprintf('Processing %s\n', filelist(i).name);
    [x,fs1]=audioread(filelist(i).name);

     fs=8000;
     [hs,f,t,imfinsf,imfinse] = hht(x,fs);
     emean=mean(imfinse);
     fmean=mean(imfinsf);
     energy_dev(i)=sum(abs(imfinse-emean))/length(imfinse);
     frequency_dev(i)=sum(abs(imfinsf-fmean))/length(imfinsf);
end     
final=[energy_dev',frequency_dev'];
 % convert the features in cepstral domain
for k=1:N
    dc1=dct(log(final(k,1:2)));
    hscc(k,:)=dc1;
end


