%% Frequency Domain Filtering - Colour Image
clc;
clear "all";
a=imread('peppers.png');
na=imnoise(a,'gaussian',0.05);
na=imnoise(a,'salt & pepper',0.05);
na=imnoise(a,'speckle',0.05);
R=na(:,:,1);
G=na(:,:,2);
B=na(:,:,3);
[x,y]=size(R);
Ir=flp(R);
Ig=flp(G);
Ib=flp(B);
result=cat(3,Ir,Ig,Ib);
diff=a-uint8(result);
mse=diff.^2;
s=sum(mse,'all');
mselp=s/(x*y);
psnrlp=10*log10(((255*255)/mselp));
%% Ideal
function lpf = flp(x)
[m,n] = size(x);
M = 2*m;
N = 2*n;
p = zeros(M,N);
for i = 1:m
    for j = 1:n
        p(i,j) = x(i,j);
   end
end
for i = 1:M
    for j = 1:N
        fp(i,j) = p(i,j)*(-1)^(i+j);
    end
end
x1 = fft2(fp);
for i = 1:M
    for j = 1:N
        D(i,j) = ((i-m)^2+(j-n)^2)^(1/2);
    end
end
H = zeros(M,N);
D0 = 100;
% Ideal LPF
for i = 1:M
    for j = 1:N
        if D(i,j) <= D0
            H(i,j) = 1;
        else
            H(i,j) = 0;
        end
    end
end
% Ideal HPF
for i = 1:M
    for j = 1:N
        if D(i,j) >= D0
            H(i,j) = 1;
        else
            H(i,j) = 0;
        end
    end
end
G = zeros(M,N);
for i = 1:M
    for j = 1:N
        G(i,j) = H(i,j).*x1(i,j);
    end
end
G2 = ifft2(G);
for i = 1:M
    for j = 1:N
        G3(i,j) = real(G2(i,j)*(-1)^(i+j));
    end
end
G1 = zeros(m,n);
for i = 1:m
    for j =1:n
        G1(i,j) = G3(i,j);
    end
end
lpf = G1;
end
 %% Butterworth
function lpf1 = glp(x)
[m,n] = size(x);
M = 2*m;
N = 2*n;
p = zeros(M,N);
for i = 1:m
    for j = 1:n
        p(i,j) = x(i,j);
    end
end
for i = 1:M
    for j = 1:N
        fp(i,j) = p(i,j)*(-1)^(i+j);
    end
end
x1 = fft2(fp);
for i = 1:M
    for j = 1:N
        D(i,j) = ((i-m)^2+(j-n)^2)^(1/2);
    end
end
H = zeros(M,N);
D0 = 100;
q= 4;
% Butterworth LPF
for i = 1:M
    for j = 1:N
        H(i,j) = 1/(1+(D(i,j)/D0)^(2*q));
    end
end
%Butterworth HPF
for i = 1:M
    for j = 1:N
        H(i,j) = 1/(1+(D0/D(i,j))^(2*q));
    end
end
G = zeros(M,N);
for i = 1:M
    for j = 1:N
        G(i,j) = H(i,j)*x1(i,j);
    end
end
G2 = ifft2(G);
for i = 1:M
    for j = 1:N
        G3(i,j) = real(G2(i,j)*(-1)^(i+j));
    end
end
G1 = zeros(m,n);
for i = 1:m
    for j =1:n
        G1(i,j) = G3(i,j);
    end
end
lpf1 = G1;
end
%% Gaussian
function lpf2 = blp(x)
[m,n] = size(x);
M = 2*m;
N = 2*n;
p = zeros(M,N);
for i = 1:m
    for j = 1:n
        p(i,j) = x(i,j);
    end
end
for i = 1:M
    for j = 1:N
        fp(i,j) = p(i,j)*(-1)^(i+j);
    end
end
x1 = fft2(fp);
for i = 1:M
    for j = 1:N
        D(i,j) = ((i-m)^2+(j-n)^2)^(1/2);
    end
end
H = zeros(M,N);
D0 = 100;
% Gaussian LPF
for i = 1:M
    for j = 1:N
        H(i,j) = exp(-D(i,j)^2/(2*D0^2));
    end
end
% Gaussian HPF
for i = 1:M
    for j = 1:N
        H(i,j) = 1-exp(-D(i,j)^2/(2*D0^2));

    
    end
end
G = zeros(M,N);
for i = 1:M
    for j = 1:N
        G(i,j) = H(i,j)*x1(i,j);
    end
end
G1 = zeros(m,n);
G2 = ifft2(G);
for i = 1:M
    for j = 1:N
        G3(i,j) = real(G2(i,j)*(-1)^(i+j));
    end
end
for i = 1:m
    for j =1:n
        G1(i,j) = G3(i,j);
    end
end
lpf2 = G1;
end