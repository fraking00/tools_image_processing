function [images, labels] = read_crop()


f=fopen("cropImagesDefinitivo.list");
z = textscan(f,'%s');
fclose(f);
images = z{:};

% label dei crop
f=fopen("cropFinalLabels.list");
l = textscan(f,'%s');
labels = l{:};
fclose(f);



end
