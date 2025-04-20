function ecc = Ecc(im)
stat = regionprops(im, 'Eccentricity');
ecc = [stat.Eccentricity];
end

