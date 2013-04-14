function [n_correct] = testclassificationp3004(trainingfiles,testfile,channels)
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
% y_temp = y;
% y_temp(y==1) = 2;
% y_temp(y==-1) = 1;
% % c = train_sc(x',y_temp','LDA4');
[p1,p2,V,u1,u2,L1,L2] = LDAtrain(x',y);
%% load testfile and do classification
clear y;
f = load(testfile);
n_runs = length(f.runs);
n_blocks = 16;
a1=zeros;
a2=zeros;
n_correct = zeros(1,n_blocks);
for i = 1:n_runs
    x = f.runs{i}.x(channels,:,:);
%     x = apply(w,x);
%     x = apply(n,x);
    n_trials = size(x,3);
    x = reshape(x,n_channels*n_samples,n_trials);
    y_temp1 = f.runs{i}.y;
    y_temp2=y_temp1;
    y_temp2(y_temp1==1) = 2;
    y_temp2(y_temp1==-1) = 1;
    y= LDAtest(x',V,p1,p2,u1,u2,L1,L2);
scores = zeros(1,19);
    for j = 1:n_blocks
        corr1=0;
        start = (j-1)*19+1;
        stop  = (j)*19;
        scores(1:19) = scores(1:19) + ...
            y(start:stop);
        [a1 a2]=sort(scores);
               a2=a2+31;
        for ta1=1:2
            for ta2=1:2
                if a2(1,20-ta2)==f.runs{i}.target(1,ta1)
                    corr1=corr1+1;
                end
            end
        end
        if corr1==2;
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