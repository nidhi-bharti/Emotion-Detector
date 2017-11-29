clear;clc;
funcpathname = 'C:\Users\DELL LAPI\Documents\MATLAB\ED_github\ED_nn\Speech-Emotion-Recognition-master';
[waves,fs,num] = readwave('C:\Users\DELL LAPI\Documents\MATLAB\ED_github\ED_nn\Speech-Emotion-Recognition-master',funcpathname);

count = zeros(1,3);

for i = 1:num
    [emotion,result] = classifier(waves(i).x, fs);
    %Joy, angry, normal 1,2,3
    switch emotion
        case 1
            count(1) = count(1) + 1;
        case 2
            count(2) = count(2) + 1;
        case 3
            count(3) = count(3) + 1;
       
    end
end
disp('   ??JOY  ??ANGRY   ??NORMAL ');
disp(count);

disp(' SVM result ');
disp(result);

