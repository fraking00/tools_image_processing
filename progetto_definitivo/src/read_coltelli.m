function [images, labels] = read_coltelli()


f=fopen('coltelliImages.list');
z = textscan(f,'%s');
fclose(f);
images = z{:};

% label dei crop
f=fopen('coltelliLabels.list');
l = textscan(f,'%s');
labels = l{:};
fclose(f);



end