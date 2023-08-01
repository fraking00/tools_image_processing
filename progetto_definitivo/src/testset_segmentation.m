function [out, images] = testset_segmentation()




[images, labels] = second_readlist();

% [crop_images, crop_labels] = third_readlist();


area           = [];
perimetro      = [];
circolarita    = [];
eccentricita   = [];
solidita       = [];
x_pos          = [];
y_pos          = [];
num_image      = [];
equiv_diameter = [];
extent         = [];
convex_area    = [];


for i = 1:numel(images)

    im = im2double(imread( images{i}));

    im = imresize(im, 0.2);

    red   = im(:, :, 1);
    green = im(:, :, 2);
    blue  = im(:, :, 3);


    ycbcr_image = rgb2ycbcr(im);


%     figure
%     subplot(2, 3, 2)
%     imshow(hsv_image);
%     subplot(2, 3, 4)
%     imshow(hsv_image(:, :, 1));
%     subplot(2, 3, 5)
%     imshow(hsv_image(:, :, 2));
%     subplot(2, 3, 6)
%     imshow(hsv_image(:, :, 3));




    cb = ycbcr_image(:, :, 2);

    cb = cb > graythresh(cb);

    test_close = imclose(cb, strel('sphere', 5));
%     test_close = imclose(test_close, strel('sphere', 10));
    
    test_close = medfilt2(test_close, [10 10]);
    
    test_close = imdilate(test_close, strel('sphere', 4));
    

%     figure
%     imshow(test_close);
    



    [labeling, numOfObjects] = bwlabel(test_close);


    % prima di fare questa parte eseguire il get dei descrittori



    for j = 1:numOfObjects

        testset_descriptors = regionprops(labeling, 'Area', 'Circularity', 'Perimeter', 'Eccentricity', 'Solidity', 'Centroid', 'EquivDiameter', 'Extent', ...
            'ConvexArea');


        area           = [area; testset_descriptors(j).Area];
        perimetro      = [perimetro; testset_descriptors(j).Perimeter];
        circolarita    = [circolarita; testset_descriptors(j).Circularity];
        eccentricita   = [eccentricita; testset_descriptors(j).Eccentricity];
        solidita       = [solidita; testset_descriptors(j).Solidity];
        x_pos          = [x_pos; testset_descriptors(j).Centroid(1)];
        y_pos          = [y_pos; testset_descriptors(j).Centroid(2)];
        num_image      = [num_image; i];
        equiv_diameter = [equiv_diameter; testset_descriptors(j).EquivDiameter];
        extent         = [extent; testset_descriptors(j).Extent];
        convex_area    = [convex_area; testset_descriptors(j).ConvexArea];

        
        mask = (labeling(:) == j);

        mask = reshape(mask, size(test_close));
    
        new_red   = red .* mask;
        new_green = green .* mask;
        new_blue  = blue .* mask;
    
        new_rgb = cat(3, new_red, new_green, new_blue);

%         figure
%         imshow(new_rgb);


        % imwrite(new_rgb, "../Dataset/test_set/crop_new/crop_"+i+"_"+j+".jpg");





    end

end


rapporto_area_perimetro = area ./ (perimetro.^2);
% 
rapporto_area_perimetro = normalize(rapporto_area_perimetro, "range");
% circolarita = normalize(circolarita, "range");
% eccentricita = normalize(eccentricita, "range");
% solidita = normalize(solidita, "range");
% equiv_diameter = normalize(equiv_diameter, "range");



out = [rapporto_area_perimetro, circolarita, eccentricita, solidita, x_pos, y_pos, num_image, equiv_diameter, extent, convex_area];
% out = [];





end

