function [  ] = Houghe(  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

I = imread('C:\Users\mohamed\Desktop\ps1_matlab_template\input\ps1-input0.png');

edges= edge(I,'canny');
imshow(edges);
[height , width] = size(edges);

display(width);
display(height);

rhoLimit= norm([height width]);

rho = (-rhoLimit:1:rhoLimit);
thetaF=.01;
theta=(0:thetaF:pi);

numTheta= numel(theta);
numRho= numel(rho);

display(numTheta);
display(numRho);

houghSpace= zeros(numRho, numTheta);

[yI, xI]= find(edges);
xL=length(xI);
yL=length(yI);

cosine= xI*cos(theta);
sine=yI*sin(theta);

display(size(cosine));
display(size(sine));
display(size(xI));
display(size(yI));
h= cosine+sine;

h=round(h+numRho/2);
[hieghtR , widthT]=size(h);

display(hieghtR);
display(widthT);

for theI=1:widthT
    for rhoI=1:hieghtR
        houghSpace(h(rhoI,theI),theI)= houghSpace(h(rhoI,theI),theI)+1;
        
    end
    
    
end
% for ix=1:xL
%     for iy=1:yL
%         for theI=1:numTheta
%             th= theta(theI);
%             r=xI(ix)*cos(th)+yI(iy)*sin(th);
%             rhoI =round(r+numRho/2);
%             
%             houghSpace(rhoI,theI)= houghSpace(rhoI,theI)+1;
%         end
%     end
% end

figure(1),imagesc(houghSpace, 'XData', theta, 'YData', rho),title('Hough Transform'),colormap('hot');




%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%

[rowI, ColI]= find(houghSpace>210);
display(rowI);
display(ColI);

hold on;

figure(3),plot(ColI,rowI,'rx');
hold off;

% draw line
 figure(4);
% subplot(1,2,2)
 imagesc(I);

 hold on;
 
  colormap(hot);
 for i = 1:size(ColI)
      for j = 1:size(rowI)
 th = theta(ColI(i));
 rh = rho(rowI(j));
%  m = -(cos(th)/sin(th));
%  b = rh/sin(th);

 x = 1:width;
 y=((rh-x*cos(th))/sin(th));
 figure(4),plot(x, y);
 hold  on;
      end
 end


end

