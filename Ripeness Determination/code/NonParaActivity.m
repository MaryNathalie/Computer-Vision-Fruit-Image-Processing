clear all
close all
clc
Eccent = []; Colorr = []; Colorg = []; Colorb = []; Hue = []; I = [];

for i = 16:1:18
    bin = 10;
    im = imread(sprintf('rm%1d.jpg',i)); 
    im = padarray(im,[50 50],0,'both');
    image = im; % original image
    im = Blob(im, bin);
    im = Clean(im, 25); 
    Eccent = [Eccent; Ecc(im)];
%     figure(); imshow(im);
    col = Color(image, im);
    hue = rgb2hsv(col);
    colR = col(:,:,1); colG = col(:,:,2); colB = col(:,:,3); 
    colI = colR + colG + colB; colI(colI==0) = 100000;
    colr = colR./colI; colg = colG./colI; colb = colB./colI;
    Colorr = [Colorr; colr(1)];
    Colorg = [Colorg; colg(1)];
    Colorb = [Colorb; colb(1)];
    Hue =  [Hue; hue(1)];
    I = [I; 0];
    disp(i);
end

for i = 1:1:15
    bin = 10;
    im = imread(sprintf('m%1d.jpg',i)); 
    im = padarray(im,[50 50],0,'both');
    image = im; % original image
    im = Blob(im, bin);
    im = Clean(im, 25); 
    col = Color(image, im);
    colR = col(:,:,1); colG = col(:,:,2); colB = col(:,:,3); 
    colI = colR + colG + colB; colI(colI==0) = 100000;
    colr = colR./colI; colg = colG./colI; colb = colB./colI;
    Colorr = [Colorr; colr(1)];
    Colorg = [Colorg; colg(1)];
    Colorb = [Colorb; colb(1)];
    I = [I; 1];
    disp(i);
end

% for i = 4:1:4 % orange: 2
%     disp(i);
%     bin = 10;
%     im = imread(sprintf('or%1d.jpg',i)); 
%     im = padarray(im,[50 50],0,'both'); %50 50
%     image = im; % original image
%     im = Blob(im, bin);
% %     while im(:,:) == 0
% %         im = Blob(im, bin+1);
% %     end
% %     figure(); imshow(im);
%     im = Clean(im, 25);
%     Eccent = [Eccent; Ecc(im)];
%     figure(); imshow(im);
%     col = Color(image, im);
%     hue = rgb2hsv(col);
%     colR = col(:,:,1); colG = col(:,:,2); colB = col(:,:,3); 
%     colI = colR + colG + colB; colI(colI==0) = 100000;
%     colr = colR./colI; colg = colG./colI; colb = colB./colI;
%     Colorr = [Colorr; colr(1)];
%     Colorg = [Colorg; colg(1)];
%     Colorb = [Colorb; colb(1)];
%     Hue =  [Hue; hue(1)];
%     I = [I; 2];
% %     figure(); imshow(color/255);
% end
% 
% for i = 3:1:3 %apple 3
%     disp(i);
%     bin = 10;
%     im = imread(sprintf('a%1d.jpg',i)); 
%     im = padarray(im,[50 50],0,'both'); %50 50
%     image = im; % original image
%     im = Blob1(im, bin);
% %     while im(:,:) == 0
% %         im = Blob(im, bin+1);
% %     end
% %     figure(); imshow(im);
%     im = Clean(im, 25);
%     Eccent = [Eccent; Ecc(im)];
%     figure(); imshow(im);
%     col = Color(image, im);
%     hue = rgb2hsv(col);
%     colR = col(:,:,1); colG = col(:,:,2); colB = col(:,:,3); 
%     colI = colR + colG + colB; colI(colI==0) = 100000;
%     colr = colR./colI; colg = colG./colI; colb = colB./colI;
%     Colorr = [Colorr; colr(1)];
%     Colorg = [Colorg; colg(1)];
%     Colorb = [Colorb; colb(1)];
%     Hue =  [Hue; hue(1)];
%     I = [I; 3];
% %     figure(); imshow(color/255);
% end

data = [I, Eccent, Colorr, Colorg, Colorb, Hue];
csvwrite('datatest.csv',data);

