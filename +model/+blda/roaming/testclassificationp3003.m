function n_correct = testclassificationp3003(trainingfiles, testfile,channels)
%
% testclassification(trainingfiles, testfile)
%
% Uses the data in *trainingfiles* to build a classifier and tests
% the classifier on the data in *testfile*. *n_correct* contains for each
% number of blocks (1-20) the number of correctly classified items. If no
% output arguments are given *n_correct* is plotted.
% The training files and the test file have to be built with extracttrials.
%
% Example: testclassification({'s2','s3','s4'},'s1')

% Author: Ulrich Hoffmann - EPFL, 2006
% Copyright: Ulrich Hoffmann - EPFL


%% subsets of electrodes
% Fz, Cz, Pz, Oz
channels = [1:8];
%
%channels = [15 20 25];

%Fz, Cz, Pz, Oz, T5, P3, P4, T6
%channels = [5 15 25 29 23 24 26 27];

% Fz, Cz, Pz, Oz, P7, P3, P4, P8, O1, O2, C3, C4, FC3, FC4, CP3, CP4
%channels = [5 15 25 29 23 24 26 27 28 30 14 16 9 11 19 21];

% All electrodes
%channels = [1:30];
%channels = [6 8 14 24 25 27 29 30]; % wc
% channels = [6 19 24 25 29 30]; % wc2
%channels = [2 10 12 16 21 23 25 27];jzf
%channels = [12 18 24 25 27 29 30];%jzf2
% channels = [6 13 15 17 23 25 29 30]; %zy
%channels = [6 19 21 23 25 28 29]; %zy2
%channels = [13 14 21 23 25 27 28 30]; %zy3
%% load training files and concatenate data and labels into two big arrays
x = [];
y = [];
for i = 1:length(trainingfiles);
    fprintf('loading %s\n',trainingfiles{i});
    f = load(trainingfiles{i});
    n_runs = length(f.runs);
    for j = 1:n_runs;
        x = cat(3,x,f.runs{j}.x);
        y= [y f.runs{j}.y];
    end
end


%% select channels, windsorize, normalize, bayesian lda
x = x(channels,:,:);
w = windsor;
w = train(w,x,0.1);
x = apply(w,x);
n = normalize;
n = train(n,x,'z-score');
x = apply(n,x);

n_channels = length(channels);
n_samples = size(x,2);
n_trials = size(x,3);
x = reshape(x,n_samples*n_channels,n_trials);

b = bayeslda(1);
b = train(b,x,y);


%% load testfile and do classification
f = load(testfile);
n_runs = length(f.runs);
n_blocks = 16;
a1=zeros;
a2=zeros;
n_correct = zeros(1,n_blocks);
for i = 1:n_runs
    x = f.runs{i}.x(channels,:,:);
    x = apply(w,x);
    x = apply(n,x);
    n_trials = size(x,3);
    x = reshape(x,n_channels*n_samples,n_trials);
    y = classify(b,x);
    scores = zeros(1,7);
    for j = 1:n_blocks
        corr1=0;
        start = (j-1)*7+1;
        stop  = (j)*7;
        scores(1:7) = scores(1:7) + ...
            y(start:stop);
        [a1 a2]=sort(scores);
               a2=a2+31;
        for ta1=1:3
            for ta2=1:3
                if a2(1,8-ta2)==f.runs{i}.target(1,ta1)
                    corr1=corr1+1;
                end
            end
        end
        if corr1==3;
            n_correct(j) = n_correct(j)+1;
        end
    end
end
%% if no output arguments plot the results
if nargout == 0
    plot(n_correct);
    axis([1 10 0 16]);
    xlabel('Number of blocks');
    ylabel('Number of correct classifications');
end