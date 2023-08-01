function [images, labels] = read_trapani()


f=fopen('trapano_images.list');
z = textscan(f,'%s');
fclose(f);
images = z{:};

% label dei crop
f=fopen('trapano_labels.list');
l = textscan(f,'%s');
labels = l{:};
fclose(f);



end