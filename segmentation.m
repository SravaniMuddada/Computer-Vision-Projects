clc;
clear "all";
x=imread('flowers.jpg');
a = rgb2gray(x);
P = histeq(a);
histogram(P)
[row,column] = size(P);
val = 1;
M = row*column;
x = zeros(1,row);
for n = 0:1:max(max(P))
for i = 1:row
for j =1:column
if P(i,j) == n
x(val) = x(val)+1;
end
end
end
val = val+1;
end
p = zeros(1,row);
for k =1:row
p(k) = x(k)/M;
end
cdf(1) =p(1);
for i = 2:length(p)
cdf(i) = cdf(i-1)+p(i);
end
m(1) = p(1);
for i = 2:length(p)
m(i) = m(i-1)+i*p(i);
end
for i = 1:length(p)
M(i) = i*p(i);
end
M1 = sum(M);
for i = 1:length(p)
sigma(i) = ((M1*cdf(i)-m(i))^2/(cdf(i)*(1-cdf(i))));
end
r = sigma(1);
for i =2: length(sigma)
if sigma(i)> r
r(i) = sigma(i);
n =i;
end
end
for i =1:row
for j =1:column
if a(i,j) > n
y(i,j) = 1;
else
y(i,j) = 0;
end
end
end
imshow(y);
title("Global Thresholding using ostu's method");