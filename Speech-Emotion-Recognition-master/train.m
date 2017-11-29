function [FMtrain_1,FMtrain_2,FMtrain_3]=train()
%Read wav file
funcpathname = 'C:\Users\DELL LAPI\Documents\MATLAB\ED_github\ED_nn\Speech-Emotion-Recognition-master';
disp('Reading files for joy');
[joy,fs,num1] = readwave('C:\Users\DELL LAPI\Documents\MATLAB\ED_github\ED_nn\happiness',funcpathname);
disp('Reading files for angry');
[angry,fs,num2] = readwave('C:\Users\DELL LAPI\Documents\MATLAB\ED_github\ED_nn\Anger', funcpathname);
disp('Reading files for normal');
[normal,fs,num3] = readwave('C:\Users\DELL LAPI\Documents\MATLAB\ED_github\ED_nn\neutral', funcpathname);


%FMtrain_1 = zeros(49, 19);
%FMtrain_2 = zeros(49, 19);
%FMtrain_3 = zeros(49, 19);

disp('Features for joy');
FMtrain_1 = extractionavg(joy,fs,num1);

disp('Features for angry');
FMtrain_2 = extractionavg(angry,fs,num2);

disp('Features for normal');
FMtrain_3 = extractionavg(normal,fs,num3);

%Creating text file
f = fopen( 'FMtrain1.txt', 'w' );  
 fclose(f);
% Store the emotion vectors in ‘FMtrain.txt’
dlmwrite('FMtrain1.txt', FMtrain_1);

f = fopen( 'FMtrain2.txt', 'w' );  
 fclose(f);
% Store the emotion vectors in ‘FMtrain.txt’
dlmwrite('FMtrain2.txt', FMtrain_2);

f = fopen( 'FMtrain3.txt', 'w' );  
 fclose(f);
% Store the emotion vectors in ‘FMtrain.txt’
dlmwrite('FMtrain3.txt', FMtrain_3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Input
% waves: frame
% fs:    Sampling Frequency
% num:   Speech Signal in each Frame
% 
% Output
% features: Average value for each emotion in all the sentences
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function features = extractionavg(waves, fs, num)

features = zeros(num, 19);
for i=1:num
features(i, :) = extraction(waves(i).x, fs);
end
%features_mean = mean(features);

