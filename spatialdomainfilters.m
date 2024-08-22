%% Spatial Domain Filtering - Non Linear Filters
clc;
close all;
y = imread('cameraman.tif');
subplot(2,3,1)
imshow(y);
title('Input image');
t = imnoise(y,'speckle',0.05);
%t = imnoise(y,'gaussian');
subplot(2,3,2)
imshow(t);
title('Image with speckle noise');
%% Minimum,Maximum,Median filtering
 p = zeros(size(t)+2);
 [row,col] = size(p);
    for i = 1: length(t)
        for j = 1:length(t)
        p(i+1,j+1) = t(i,j);
        end
    end
    i = 1;
    for j =1:length(t)
     p(i,j+1) = t(i,j);
    end
     i = 256;
     for j = 1:length(p)-2
        p(i+2,j+1) = t(i,j);
      end
     
    for j = 1:length(p):length(p)
        for i =1:length(t)
           p(i+1,j) = t(i,j);
         end
     end
      j =length(p);
    for i =1:length(t)
         p(i+1,j) = t(i,j-2);
     end
     p(1,1) = p(2,2);
     p(258,258) = p(257,257);
     p(1,258) = p(2,257);
     p(258,1) = p(257,2);
     s = zeros(1,9);
     u = zeros(size(t));
     y2 = zeros(size(t));
     y3 = zeros(size(t));
    
     u1 = zeros(size(t));
      for i = 2:length(p)-1
      for j = 2:length(p)-1
           k = 1;
          for g = i-1:i+1
              for h = j-1:j+1
                  s(k) = p(g,h);
                  k = k+1;
              end
          end
          k = 1;
          u1(i,j) = min(s,[],'all');
          y2(i,j) = max(s,[],'all');
          y3(i,j) = median(s,'all');
        end
      end
      subplot(2,3,3);
      imshow(u1,[]);
      title('Minimun filter with speckle noise');
      u2 = imcrop(u1,[2,2,i,j]);
      [m,n] = size(u2);
      %MSE & PSNR
      for i = 1:m
          for j = 1:n
              M(i,j) =(y(i,j)-u2(i,j))^2;
          end
      end
      M1 = sum(M,'all');
      M2 = M1/(m*n);
      PSNRmi = 10*log10(255^2/M2);
      subplot(2,3,4);
      imshow(y2,[]);
      title('Maximun filter with speckle noise');
       Y2 = imcrop(y2,[2,2,i,j]);
      %MSE & PSNR
      for i = 1:m
          for j = 1:n
              M3(i,j) =(y(i,j)-Y2(i,j))^2;
          end
      end
      M4 = sum(M3,'all');
      M5 = M4/(m*n);
      PSNRma = 10*log10(255^2/M5);
      subplot(2,3,5);
      imshow(y3,[]);
      title('Median filter with speckle noise');
       Y3 = imcrop(y3,[2,2,i,j]);
      %MSE &PSNR
      for i = 1:m
          for j = 1:n
              Ma(i,j) =(y(i,j)-Y3(i,j))^2;
          end
      end
      Ma1 = sum(Ma,'all');
      Ma2 = Ma1/(m*n);
      PSNRme = 10*log10(255^2/Ma2);
      %% Alpha trimmed mean filter
      alpha = 4;
      y5 = zeros(size(t));
      y6 = zeros(1,5);
      k = 1;
       for i = 2:length(p)-1
      for j = 2:length(p)-1
          for g = i-1:i+1
              for h = j-1:j+1
                  s1(k) = p(g,h);
                    k = k+1;
              end
          end
          k = 1;
          y6(1,:)= s1(3:1:end-2);
          y5(i-1,j-1) = mean(y6);
      end
       end
      subplot(2,3,6);
      imshow(y5,[]);
      title('Alpha trimmed filter with speckle noise');
      %MSE & PSNR
      for i = 1:m
          for j = 1:n
              A(i,j) =(y(i,j)-y5(i,j))^2;
          end
      end
      A1 = sum(A,'all');
      A2 = A1/(m*n);
      PSNRa = 10*log10(255^2/A2);


    
        
        
  