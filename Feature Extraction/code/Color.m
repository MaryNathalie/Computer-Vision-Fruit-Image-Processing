function im = Color(file,blob)
image = file;
im = double(image);
r = im(:,:,1); g = im(:,:,2); b = im(:,:,3);
pix = 50;
meanR = mean(r(blob)); meanR = meanR.* ones(pix,pix);
meanG = mean(g(blob)); meanG = meanG.* ones(pix,pix);
meanB = mean(b(blob)); meanB = meanB.* ones(pix,pix);
im = cat(3, meanR, meanG, meanB);
end