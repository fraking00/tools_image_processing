function [images, labels] = read_forchette()


f=fopen('forchetteImages.list');
z = textscan(f,'%s');
fclose(f);
images = z{:};

% label dei crop
f=fopen('forchetteLabels.list');
l = textscan(f,'%s');
labels = l{:};
fclose(f);



end

