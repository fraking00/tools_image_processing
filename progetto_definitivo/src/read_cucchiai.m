function [images, labels] = read_cucchiai()


f=fopen('cucchiaiImages.list');
z = textscan(f,'%s');
fclose(f);
images = z{:};

% label dei crop
f=fopen('cucchiaiLabels.list');
l = textscan(f,'%s');
labels = l{:};
fclose(f);



end