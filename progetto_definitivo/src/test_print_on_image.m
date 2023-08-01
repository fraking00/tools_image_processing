function [out, prediction] = test_print_on_image(image)



load('test_finale_modelli.mat');


copia_immagine = image;

copia_immagine = imresize(copia_immagine, 0.2);

da_sovrascrivere = copia_immagine;

red_channel = copia_immagine(:, :, 1);
green_channel = copia_immagine(:, :, 2);
blue_channel = copia_immagine(:, :, 3);



ycbcr_image = rgb2ycbcr(copia_immagine);

cb = ycbcr_image(:, :, 2);


cb = cb > graythresh(cb);

cb = imclose(cb, strel('square', 7));

cb = medfilt2(cb, [7 7]);




[labeling, numOfObjects] = bwlabel(cb);

solidita = [];
circolarita = [];
eccentricita = [];
extent = [];
x_pos = [];
y_pos = [];

statistiche = regionprops(labeling, 'Solidity', 'Circularity', 'Eccentricity', 'Extent', 'Centroid');

for j = 1:numOfObjects



    

    solidita = [solidita; statistiche(j).Solidity];
    circolarita = [circolarita; statistiche(j).Circularity];
    eccentricita = [eccentricita; statistiche(j).Eccentricity];
    extent = [extent; statistiche(j).Extent];
    x_pos = [x_pos; statistiche(j).Centroid(1)];
    y_pos = [y_pos; statistiche(j).Centroid(2)];


    mask = (labeling(:) == j);

    mask = reshape(mask, size(cb));

    new_red = red_channel .* mask;
    new_green = green_channel .* mask;
    new_blue = blue_channel .* mask;


    new_rgb = cat(3, new_red, new_green, new_blue);

    figure(j)
    imshow(new_rgb);



end



ftr = [train.solidita, train.circolarita, train.eccentricita, train.extent];

feature_test = [solidita, circolarita, eccentricita, extent];


% classifier = fitcknn(ftr, train.labels, 'OptimizeHyperparameters','auto', 'HyperparameterOptimizationOptions', ...
%     struct('Optimizer', 'gridsearch'));

classifier = fitcknn(ftr, train.labels, 'NumNeighbors', 5, 'Distance','mahalanobis');

prediction = predict(classifier, feature_test);



figure
hold on
imshow(da_sovrascrivere)
for i = 1:numOfObjects
    
    text(floor(x_pos(i)), floor(y_pos(i)), prediction(i), "FontSize", 12, "Color", "r" );

end
hold off;



out = [solidita circolarita eccentricita extent x_pos y_pos];


end

