function [images, labels] = read_taglierini()


f=fopen('taglieriniImages.list');
z = textscan(f,'%s');
fclose(f);
images = z{:};

% label dei crop
f=fopen('taglieriniLabels.list');
l = textscan(f,'%s');
labels = l{:};
fclose(f);



end