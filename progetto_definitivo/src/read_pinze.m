function [images, labels] = read_pinze()


f=fopen('pinzeImages.list');
z = textscan(f,'%s');
fclose(f);
images = z{:};

% label dei crop
f=fopen('pinzeLabels.list');
l = textscan(f,'%s');
labels = l{:};
fclose(f);



end
