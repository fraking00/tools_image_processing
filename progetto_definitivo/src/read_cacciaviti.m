function [images, labels] = read_cacciaviti()


f=fopen('cacciavitiImages.list');
z = textscan(f,'%s');
fclose(f);
images = z{:};

% label dei crop
f=fopen('cacciavitiLabels.list');
l = textscan(f,'%s');
labels = l{:};
fclose(f);



end

