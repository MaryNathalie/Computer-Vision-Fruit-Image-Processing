function im = Clean(file,rad)
im = imfill(file, 'holes');
im = imclose(im, strel('diamond',rad));
im = bwareaopen(im, 1000);
im = ~bwareaopen(~im, 1000);
im = imfill(im, 'holes');
end




