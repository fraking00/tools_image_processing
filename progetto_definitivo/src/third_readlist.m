function [images, labels] = third_readlist()
  f=fopen('test_set_crop_images.list');
  z = textscan(f,'%s');
  fclose(f);
  images = z{:}; 

  % label dei crop
  f=fopen('crop_testset_labels.list');
  l = textscan(f,'%s');
  labels = l{:};
  fclose(f);
end