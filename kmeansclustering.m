clear all;clc;
close all;
A = imread('coins.png');
subplot(121);imshow(A);title('Input Image')
Im=A;
k = input('enter theK value:');
%% Initialize
A = double(A(:).'); % Reshaping the image
msize = numel(A);
C = A(randperm(msize, k)); % Random selection of Initial Cluster Centres
%% Cluster
C2 = zeros(size(C,2),1).'; % Creating blank array to store new Centres after 1 Iteration
Ak = zeros(size(A,2),1).';
Bv = 1; % Break value condition; if 0 then we have the final cluster
n = 0;
while(Bv==1)
D = abs((A-C(:)).'); % distance of all members from current Cluster centres
for i=1:size(A,2)
% Assigning Clusters Centres with minimum Distances in Ak Variable
[~,L] = min(D(i,:));
Ak(i) = C(L);
end
Afinal = [A.' Ak.']; % Matrix with all members and their assigned clusters
%% Finds New Cluster Centres
for o=1:size(C,2)
idx = Afinal(:,2)==C(o);
C2(o) = floor(mean(Afinal(idx,1)));
end
% Clearing NaN values from first iteration
C(isnan(C)) = 0;
C2(isnan(C2)) = 0;
% Checking new & old clusters; If all are same we have done clustering
Breakvalue = sum(C2==C);
if Breakvalue == k
Bv=0;
else
C=C2;clear C2
end
n=n+1;
C(isnan(C)) = 0;
end
%% Labelling
label = 1;
for u=1:k
l = Afinal(:,2) == C(u);
Im(l) = label;
label = label+1;
end
% Colouring based on Labels
Im = label2rgb(Im);
subplot(1,2,2)
imshow(Im);title('Segmented Image using - '+ string(k) + 'Cluster Centres')
disp('Centres(Linear indices of centres) :')
disp(C);