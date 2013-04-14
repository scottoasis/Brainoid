clc
clear
[s h]=sload('C:\study-in-Graz\p300matrixdata\AR3_p300_jh_without_fb_090409_01.gdf', 0, 'OVERFLOWDETECTION:OFF');
[b12one d12 atop12]=extractdata12(s, h,1);
clear s h
[s h]=sload('C:\study-in-Graz\p300matrixdata\AR3_p300_jh_without_fb_090422_01.gdf', 0, 'OVERFLOWDETECTION:OFF');
[b12two d121 atop121]=extractdata12(s, h,1);
clear s h
% b12=(b12one+b12two)./2;
% % b12av=mean(b12,1);
% b12av=b12(4,:);
[s h]=sload('C:\study-in-Graz\p300matrixdata\AR3_p300_jh_without_fb_090409_02.gdf', 0, 'OVERFLOWDETECTION:OFF');
[b9one d91 atop91]=extractdata9(s, h,1);
clear s h
[s h]=sload('C:\study-in-Graz\p300matrixdata\AR3_p300_jh_without_fb_090422_02.gdf', 0, 'OVERFLOWDETECTION:OFF');
[b9two d9 atop9]=extractdata9(s, h,1);
clear s h
% b9=(b9one+b9two)./2;
% % b9av=mean(b9,1);
% b9av=b9(4,:);
[s h]=sload('C:\study-in-Graz\p300matrixdata\AR3_p300_jh_without_fb_090409_03.gdf', 0, 'OVERFLOWDETECTION:OFF');
[b7one d71 atop71]=extractdata7(s, h,1);
clear s h
[s h]=sload('C:\study-in-Graz\p300matrixdata\AR3_p300_jh_without_fb_090422_03.gdf', 0, 'OVERFLOWDETECTION:OFF');
[b7two d7 atop7]=extractdata7(s, h,1);
clear s h
b12=(b12one+b12two)./2;
b9=(b9one+b9two)./2;
b7=(b7one+b7two)./2;
b9av=mean(b9,1);
b12av=mean(b12,1);
b7av=mean(b7,1);
% b12av=b12(4,:);
% b9av=b9(4,:);
% b7av=b7(4,:);

d1=(d12+d121)./2;
d2=(d9+d91)./2;
d3=(d7+d71)./2;

mav1=mean(d1,1);
mav2=mean(d2,1);
mav3=mean(d3,1);
% mav1=d1(4,:);
% mav2=d2(4,:);
% mav3=d3(4,:);

t1=1:5:500;
f=b12av(1:100)-b12av(1);
g=b9av(1:100)-b9av(1);
h=b7av(1:100)-b7av(1);
mav4=mav1+mav2+mav3./3;
m1=mav1(1:100)-mav1(1);
m2=mav2(1:100)-mav2(1);
m3=mav3(1:100)-mav3(1);
m4=mav4(1:100)-mav4(1);

% plot(t1,f,'k-',t1,m1,'k--',t1,g,'r-',t1,m2,'r--',t1,h,'b-',t1,m3,'b--');
plot(t1,f,'k-',t1,g,'r-',t1,h,'b-',t1,m4,'g--');
xlabel('Time (ms)');
ylabel('Amplitude (uv)');