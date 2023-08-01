
function [images, labels] = second_readlist()

    f=fopen('complessiveTestSetImages.list');
    z = textscan(f,'%s');
    fclose(f);
    images = z{:}; 

    % label dei crop
    f=fopen('labels.list');
    l = textscan(f,'%s');
    labels = l{:};
    fclose(f);

end