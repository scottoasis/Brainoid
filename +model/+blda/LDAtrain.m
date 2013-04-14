function [p1,p2,V,u1,u2,L1,L2] = LDAtrain(samples,labels)
%samples的结构为m*n的每一行是一个n维样本,共有m个样本
samples=samples';
m_size = size(samples);
m = m_size(2);
n = m_size(1);
samples1 = zeros(m_size);
samples2 = zeros(m_size);
L1 = labels(1);
n1 = 0;
n2 = 0;
for i = 1:m
    if labels(i) == L1
        n1 = n1+1;
        samples1(:,n1) = samples(:,i);
    else
        L2 = labels(i);
        n2 = n2+1;
        samples2(:,n2) = samples(:,i);
    end
end

p1 = n1/(n1+n2);
p2 = 1 - p1;
samples1 = samples1(:,1:n1);
samples2 = samples2(:,1:n2);
samples1 = samples1';
samples2 = samples2';
u1 = mean(samples1)';
u2 = mean(samples2)';
V1 = cov(samples1);
V2 = cov(samples2);
V = (V1*(n1-1)+V2*(n2-1))/(n1+n2-2);
for i = 1:n
    V(i,i) = V(i,i)+0.0004;
end