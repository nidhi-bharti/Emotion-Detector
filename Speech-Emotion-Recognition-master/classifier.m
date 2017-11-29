function [imin,result] = classifier(wave, fs)
train();
class1 = load('FMtrain1.txt');
class2 = load('FMtrain2.txt');
class3 = load('FMtrain3.txt');


feature = extraction(wave, fs);

%Using SVM

% Training set
TrainingSet = [class1; class2; class3];

GroupTrain1 = ones(49,1);

GroupTrain2 = 2 * ones(49,1);

GroupTrain3 = 3 * ones(49,1);

GroupTrain = [GroupTrain1; GroupTrain2; GroupTrain3];

TestSet = feature;

[result] = SVM(TrainingSet,GroupTrain,TestSet);


%By mean normalisation

dist = zeros(1,3);

    dist(1) = disteusq(feature, class1);
    dist(2) = disteusq(feature, class2);
    dist(3) = disteusq(feature, class3);


[~, imin] = min(dist);
