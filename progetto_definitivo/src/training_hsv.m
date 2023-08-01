function [] = training_hsv()



[images, labels] = readlists();


for i = 1:numel(images)

    im = im2double(imread(['../Dataset/training_set/', images{i}]));

    im = imresize(im, 0.2);

    red   = im(:, :, 1);
    green = im(:, :, 2);
    blue  = im(:, :, 3);


    hsv_image = rgb2hsv(im);

    hue_channel = hsv_image(:, :, 3);

    hue_channel = hue_channel < graythresh(hue_channel);

    test_close = imclose(hue_channel, strel('sphere', 10));
    test_close = imclose(test_close, strel('sphere', 10));
    
    test_close = medfilt2(test_close, [15 15]);
    
    test_close = imdilate(test_close, strel('sphere', 4));


    [labeling, numOfObjects] = bwlabel(test_close);

    for j = 1:numOfObjects
        
        mask = (labeling(:) == j);

        mask = reshape(mask, size(test_close));
    
        new_red   = red .* mask;
        new_green = green .* mask;
        new_blue  = blue .* mask;
    
        new_rgb = cat(3, new_red, new_green, new_blue);

        figure
        imshow(new_rgb);


        % imwrite(new_rgb, "../Dataset/test_set/crop_hsv/crop_"+i+"_"+j+".jpg");


    end

end





end

