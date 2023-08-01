function [images, labels] = read_chiave_inglese()


f=fopen('chiave_inglese_images.list');
z = textscan(f,'%s');
fclose(f);
images = z{:};

% label dei crop
f=fopen('chiave_inglese_labels.list');
l = textscan(f,'%s');
labels = l{:};
fclose(f);




end

