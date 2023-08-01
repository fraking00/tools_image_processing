function [images,labels]=readlists()
  f=fopen('trainingset_images.list');
  z = textscan(f,'%s');
  fclose(f);
  images = z{:};

  % label dei crop
  f=fopen('trainingset_labels.list');
  l = textscan(f,'%s');
  labels = l{:};
  fclose(f);
end
