function [images, labels] = read_chiave_pappagallo()


f=fopen('chiave_pappagallo_images.list');
z = textscan(f,'%s');
fclose(f);
images = z{:};

% label dei crop
f=fopen('chiave_pappagallo_labels.list');
l = textscan(f,'%s');
labels = l{:};
fclose(f);




end

