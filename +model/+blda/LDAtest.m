function [labe2]= LDAtest(samples,V,p1,p2,u1,u2,L1,L2)
%samples的结构为m*n的每一行是一个n维样本,共有m个样本
samples=samples';
m_size = size(samples);
m = m_size(2);
inV = inv(V);
A1 = inV*u1;
B1 = 0.5*(u1'*A1);
lgp1 = log(p1);

A2 = inV*u2;
B2 = 0.5*(u2'*A2);
lgp2 = log(p2);
for i=1:m
   d1 = samples(:,i)'*A1-B1+lgp1;
   d2 = samples(:,i)'*A2-B2+lgp2;
%    if d1>d2
%        labels(i) = L1;
%    else
%        labels(i) = L2;
%    end
  labe2(i)=d2;
end