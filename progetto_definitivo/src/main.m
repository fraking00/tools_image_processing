clear;
close all;


[images, labels] = read_cacciaviti();

area           = [];
perimetro      = [];
circolarita    = [];
eccentricita   = [];
solidita       = [];
equiv_diameter = [];
extent         = [];
convex_area    = [];

for i = 1:numel(images)
    
    im = im2double(imread(images{i}));

    im = imresize(im, 0.2);



    blue_channel = im(:, :, 3);

    new_blue = blue_channel < graythresh(blue_channel);

    pulizia_training = imclose(new_blue, strel('square', 35));

    pulizia_training = medfilt2(pulizia_training, [5 5]);


    training_descriptors = regionprops(pulizia_training, 'Area', 'Circularity', 'Perimeter', 'Eccentricity', 'Solidity', 'EquivDiameter', 'Extent', 'ConvexArea');


    area           = [area; training_descriptors(1).Area];
    perimetro      = [perimetro; training_descriptors(1).Perimeter];
    circolarita    = [circolarita; training_descriptors(1).Circularity];
    eccentricita   = [eccentricita; training_descriptors(1).Eccentricity];
    solidita       = [solidita; training_descriptors(1).Solidity];
    equiv_diameter = [equiv_diameter; training_descriptors(1).EquivDiameter / numel(pulizia_training)];
    extent         = [extent; training_descriptors(1).Extent];
    convex_area    = [convex_area; training_descriptors(1).ConvexArea];


    primo_momento = seven_hu_moments(pulizia_training, 1);
    secondo_momento = seven_hu_moments(pulizia_training, 2);
    terzo_momento = seven_hu_moments(pulizia_training, 3);
    quarto_momento = seven_hu_moments(pulizia_training, 4);


end



rapporto_area_perimetro = area ./ (perimetro .^ 2);




% disp(corrcoef(rapporto_area_perimetro, circolarita));
% disp(corrcoef(rapporto_area_perimetro, eccentricita));
% disp(corrcoef(rapporto_area_perimetro, solidita));




ca_statistiche.mean_rapporto_ca        = mean(rapporto_area_perimetro);
ca_statistiche.mean_circolarita_ca     = mean(circolarita);
ca_statistiche.mean_eccentricita_ca    = mean(eccentricita);
ca_statistiche.mean_solidita_ca        = mean(solidita);
ca_statistiche.mean_equiv_diameter_ca  = mean(equiv_diameter);
ca_statistiche.mean_convex_area_ca     = mean(convex_area);

ca_statistiche.varianza_rapporto_ca     = std(rapporto_area_perimetro);
ca_statistiche.varianza_circolarita_ca  = std(circolarita);
ca_statistiche.varianza_eccentricita_ca = std(eccentricita);
ca_statistiche.varianza_solidita_ca     = std(solidita);

ca_statistiche.mean_primo_momento_ca   = mean(primo_momento);
ca_statistiche.mean_secondo_momento_ca = mean(secondo_momento);
ca_statistiche.mean_terzo_momento_ca   = mean(terzo_momento);
ca_statistiche.mean_quarto_momento_ca  = mean(quarto_momento);

ca_statistiche.varianza_primo_momento   = std(primo_momento);
ca_statistiche.varianza_secondo_momento = std(secondo_momento);
ca_statistiche.varianza_terzo_momento   = std(terzo_momento);
ca_statistiche.varianza_quarto_momento  = std(quarto_momento);


ca_statistiche.rapporto_area_perimetro_lista = rapporto_area_perimetro;
ca_statistiche.eccentricita = eccentricita;
ca_statistiche.solidita = solidita;
ca_statistiche.circolarita_lista = circolarita;
ca_statistiche.convex_area_lista = convex_area;
ca_statistiche.extent_lista = extent;


save('mean_cacciaviti.mat', "ca_statistiche");

%%
clear;
close all;


clear;
close all;


[images, labels] = read_chiave_inglese();

area           = [];
perimetro      = [];
circolarita    = [];
eccentricita   = [];
solidita       = [];
equiv_diameter = [];
extent         = [];
convex_area    = [];

for i = 1:numel(images)
    
    im = im2double(imread(images{i}));

    im = imresize(im, 0.2);



    blue_channel = im(:, :, 3);

    new_blue = blue_channel < graythresh(blue_channel);

    pulizia_training = imclose(new_blue, strel('square', 35));

    pulizia_training = medfilt2(pulizia_training, [5 5]);


    training_descriptors = regionprops(pulizia_training, 'Area', 'Circularity', 'Perimeter', 'Eccentricity', 'Solidity', 'EquivDiameter', 'Extent', 'ConvexArea');


    area           = [area; training_descriptors(1).Area];
    perimetro      = [perimetro; training_descriptors(1).Perimeter];
    circolarita    = [circolarita; training_descriptors(1).Circularity];
    eccentricita   = [eccentricita; training_descriptors(1).Eccentricity];
    solidita       = [solidita; training_descriptors(1).Solidity];
    equiv_diameter = [equiv_diameter; training_descriptors(1).EquivDiameter / numel(pulizia_training)];
    extent         = [extent; training_descriptors(1).Extent];
    convex_area    = [convex_area; training_descriptors(1).ConvexArea];


    primo_momento = seven_hu_moments(pulizia_training, 1);
    secondo_momento = seven_hu_moments(pulizia_training, 2);
    terzo_momento = seven_hu_moments(pulizia_training, 3);
    quarto_momento = seven_hu_moments(pulizia_training, 4);


end



rapporto_area_perimetro = area ./ (perimetro .^ 2);




ci_statistiche.mean_rapporto_ci        = mean(rapporto_area_perimetro);
ci_statistiche.mean_circolarita_ci     = mean(circolarita);
ci_statistiche.mean_eccentricita_ci    = mean(eccentricita);
ci_statistiche.mean_solidita_ci        = mean(solidita);
ci_statistiche.mean_equiv_diameter_ci  = mean(equiv_diameter);
ci_statistiche.mean_convex_area_ci     = mean(convex_area);

ci_statistiche.varianza_rapporto_ci     = std(rapporto_area_perimetro);
ci_statistiche.varianza_circolarita_ci  = std(circolarita);
ci_statistiche.varianza_eccentricita_ci = std(eccentricita);
ci_statistiche.varianza_solidita_ci     = std(solidita);

ci_statistiche.mean_primo_momento_ci   = mean(primo_momento);
ci_statistiche.mean_secondo_momento_ci = mean(secondo_momento);
ci_statistiche.mean_terzo_momento_ci   = mean(terzo_momento);
ci_statistiche.mean_quarto_momento_ci  = mean(quarto_momento);

ci_statistiche.varianza_primo_momento   = std(primo_momento);
ci_statistiche.varianza_secondo_momento = std(secondo_momento);
ci_statistiche.varianza_terzo_momento   = std(terzo_momento);
ci_statistiche.varianza_quarto_momento  = std(quarto_momento);


ci_statistiche.rapporto_area_perimetro_lista = rapporto_area_perimetro;
ci_statistiche.eccentricita_lista = eccentricita;
ci_statistiche.solidita_lista = solidita;
ci_statistiche.circolarita_lista = circolarita;
ci_statistiche.convex_area_lista = convex_area;
ci_statistiche.extent_lista = extent;



save('mean_chiave_inglese.mat', "ci_statistiche");


%%



clear;
close all;


clear;
close all;


[images, labels] = read_chiave_pappagallo();

area           = [];
perimetro      = [];
circolarita    = [];
eccentricita   = [];
solidita       = [];
equiv_diameter = [];
extent         = [];
convex_area    = [];

for i = 1:numel(images)
    
    im = im2double(imread(images{i}));

    im = imresize(im, 0.2);




    blue_channel = im(:, :, 3);

    new_blue = blue_channel < graythresh(blue_channel);

    pulizia_training = imclose(new_blue, strel('square', 35));

    pulizia_training = medfilt2(pulizia_training, [5 5]);


    training_descriptors = regionprops(pulizia_training, 'Area', 'Circularity', 'Perimeter', 'Eccentricity', 'Solidity', 'EquivDiameter', 'Extent', ...
        'ConvexArea');


    area           = [area; training_descriptors(1).Area];
    perimetro      = [perimetro; training_descriptors(1).Perimeter];
    circolarita    = [circolarita; training_descriptors(1).Circularity];
    eccentricita   = [eccentricita; training_descriptors(1).Eccentricity];
    solidita       = [solidita; training_descriptors(1).Solidity];
    equiv_diameter = [equiv_diameter; training_descriptors(1).EquivDiameter / numel(pulizia_training)];
    extent         = [extent; training_descriptors(1).Extent];
    convex_area    = [convex_area; training_descriptors(1).ConvexArea];


    primo_momento = seven_hu_moments(pulizia_training, 1);
    secondo_momento = seven_hu_moments(pulizia_training, 2);
    terzo_momento = seven_hu_moments(pulizia_training, 3);
    quarto_momento = seven_hu_moments(pulizia_training, 4);



end



rapporto_area_perimetro = area ./ (perimetro .^ 2);



cp_statistiche.mean_rapporto_cp        = mean(rapporto_area_perimetro);
cp_statistiche.mean_circolarita_cp     = mean(circolarita);
cp_statistiche.mean_eccentricita_cp    = mean(eccentricita);
cp_statistiche.mean_solidita_cp        = mean(solidita);
cp_statistiche.mean_equiv_diameter_cp  = mean(equiv_diameter);
cp_statistiche.mean_convex_area_cp     = mean(convex_area);

cp_statistiche.varianza_rapporto_cp     = std(rapporto_area_perimetro);
cp_statistiche.varianza_circolarita_cp  = std(circolarita);
cp_statistiche.varianza_eccentricita_cp = std(eccentricita);
cp_statistiche.varianza_solidita_cp     = std(solidita);


cp_statistiche.mean_primo_momento_cp   = mean(primo_momento);
cp_statistiche.mean_secondo_momento_cp = mean(secondo_momento);
cp_statistiche.mean_terzo_momento_cp   = mean(terzo_momento);
cp_statistiche.mean_quarto_momento_cp  = mean(quarto_momento);

cp_statistiche.varianza_primo_momento   = std(primo_momento);
cp_statistiche.varianza_secondo_momento = std(secondo_momento);
cp_statistiche.varianza_terzo_momento   = std(terzo_momento);
cp_statistiche.varianza_quarto_momento  = std(quarto_momento);

cp_statistiche.rapporto_area_perimetro_lista = rapporto_area_perimetro;
cp_statistiche.eccentricita_lista = eccentricita;
cp_statistiche.solidita_lista = solidita;
cp_statistiche.circolarita_lista = circolarita;
cp_statistiche.convex_area_lista = convex_area;
cp_statistiche.extent_lista = extent;


save('mean_chiave_pappagallo.mat', "cp_statistiche");

%%

clear;
close all;


[images, labels] = read_coltelli();

area           = [];
perimetro      = [];
circolarita    = [];
eccentricita   = [];
solidita       = [];
equiv_diameter = [];
extent         = [];
convex_area    = [];

for i = 1:numel(images)
    
    im = im2double(imread(images{i}));

    im = imresize(im, 0.2);


    blue_channel = im(:, :, 3);

    new_blue = blue_channel < graythresh(blue_channel);

    pulizia_training = imclose(new_blue, strel('square', 35));

    pulizia_training = medfilt2(pulizia_training, [5 5]);


    training_descriptors = regionprops(pulizia_training, 'Area', 'Circularity', 'Perimeter', 'Eccentricity', 'Solidity', 'EquivDiameter', 'Extent', ...
        'ConvexArea');


    area           = [area; training_descriptors(1).Area];
    perimetro      = [perimetro; training_descriptors(1).Perimeter];
    circolarita    = [circolarita; training_descriptors(1).Circularity];
    eccentricita   = [eccentricita; training_descriptors(1).Eccentricity];
    solidita       = [solidita; training_descriptors(1).Solidity];
    equiv_diameter = [equiv_diameter; training_descriptors(1).EquivDiameter / numel(pulizia_training)];
    extent         = [extent; training_descriptors(1).Extent];
    convex_area    = [convex_area; training_descriptors(1).ConvexArea];


    primo_momento = seven_hu_moments(pulizia_training, 1);
    secondo_momento = seven_hu_moments(pulizia_training, 2);
    terzo_momento = seven_hu_moments(pulizia_training, 3);
    quarto_momento = seven_hu_moments(pulizia_training, 4);



end



rapporto_area_perimetro = area ./ (perimetro .^ 2);





co_statistiche.mean_rapporto_co        = mean(rapporto_area_perimetro);
co_statistiche.mean_circolarita_co     = mean(circolarita);
co_statistiche.mean_eccentricita_co    = mean(eccentricita);
co_statistiche.mean_solidita_co        = mean(solidita);
co_statistiche.mean_equiv_diameter_co  = mean(equiv_diameter);
co_statistiche.mean_convex_area_co     = mean(convex_area);

co_statistiche.varianza_rapporto_co     = std(rapporto_area_perimetro);
co_statistiche.varianza_circolarita_co  = std(circolarita);
co_statistiche.varianza_eccentricita_co = std(eccentricita);
co_statistiche.varianza_solidita_co     = std(solidita);


co_statistiche.mean_primo_momento_co   = mean(primo_momento);
co_statistiche.mean_secondo_momento_co = mean(secondo_momento);
co_statistiche.mean_terzo_momento_co   = mean(terzo_momento);
co_statistiche.mean_quarto_momento_co  = mean(quarto_momento);

co_statistiche.varianza_primo_momento   = std(primo_momento);
co_statistiche.varianza_secondo_momento = std(secondo_momento);
co_statistiche.varianza_terzo_momento   = std(terzo_momento);
co_statistiche.varianza_quarto_momento  = std(quarto_momento);


co_statistiche.rapporto_area_perimetro_lista = rapporto_area_perimetro;
co_statistiche.eccentricita_lista = eccentricita;
co_statistiche.solidita_lista = solidita;
co_statistiche.circolarita_lista = circolarita;
co_statistiche.convex_area_lista = convex_area;
co_statistiche.extent_lista = extent;


save('mean_coltello.mat', "co_statistiche");


%%

clear;
close all;


[images, labels] = read_forchette();

area           = [];
perimetro      = [];
circolarita    = [];
eccentricita   = [];
solidita       = [];
equiv_diameter = [];
extent         = [];
convex_area    = [];

for i = 1:numel(images)
    
    im = im2double(imread(images{i}));

    im = imresize(im, 0.2);




    blue_channel = im(:, :, 3);

    new_blue = blue_channel < graythresh(blue_channel);

    pulizia_training = imclose(new_blue, strel('square', 35));

    pulizia_training = medfilt2(pulizia_training, [5 5]);


    training_descriptors = regionprops(pulizia_training, 'Area', 'Circularity', 'Perimeter', 'Eccentricity', 'Solidity', 'EquivDiameter', 'Extent', ...
        'ConvexArea');


    area           = [area; training_descriptors(1).Area];
    perimetro      = [perimetro; training_descriptors(1).Perimeter];
    circolarita    = [circolarita; training_descriptors(1).Circularity];
    eccentricita   = [eccentricita; training_descriptors(1).Eccentricity];
    solidita       = [solidita; training_descriptors(1).Solidity];
    equiv_diameter = [equiv_diameter; training_descriptors(1).EquivDiameter / numel(pulizia_training)];
    extent         = [extent; training_descriptors(1).Extent];
    convex_area    = [convex_area; training_descriptors(1).ConvexArea];


    primo_momento = seven_hu_moments(pulizia_training, 1);
    secondo_momento = seven_hu_moments(pulizia_training, 2);
    terzo_momento = seven_hu_moments(pulizia_training, 3);
    quarto_momento = seven_hu_moments(pulizia_training, 4);



end



rapporto_area_perimetro = area ./ (perimetro .^ 2);



fo_statistiche.mean_rapporto_fo        = mean(rapporto_area_perimetro);
fo_statistiche.mean_circolarita_fo     = mean(circolarita);
fo_statistiche.mean_eccentricita_fo    = mean(eccentricita);
fo_statistiche.mean_solidita_fo        = mean(solidita);
fo_statistiche.mean_equiv_diameter_fo  = mean(equiv_diameter);
fo_statistiche.mean_convex_area_fo     = mean(convex_area);

fo_statistiche.varianza_rapporto_fo     = std(rapporto_area_perimetro);
fo_statistiche.varianza_circolarita_fo  = std(circolarita);
fo_statistiche.varianza_eccentricita_fo = std(eccentricita);
fo_statistiche.varianza_solidita_fo     = std(solidita);


fo_statistiche.mean_primo_momento_fo   = mean(primo_momento);
fo_statistiche.mean_secondo_momento_fo = mean(secondo_momento);
fo_statistiche.mean_terzo_momento_fo   = mean(terzo_momento);
fo_statistiche.mean_quarto_momento_fo  = mean(quarto_momento);

fo_statistiche.varianza_primo_momento   = std(primo_momento);
fo_statistiche.varianza_secondo_momento = std(secondo_momento);
fo_statistiche.varianza_terzo_momento   = std(terzo_momento);
fo_statistiche.varianza_quarto_momento  = std(quarto_momento);

fo_statistiche.rapporto_area_perimetro_lista = rapporto_area_perimetro;
fo_statistiche.eccentricita_lista = eccentricita;
fo_statistiche.solidita_lista = solidita;
fo_statistiche.circolarita = circolarita;
fo_statistiche.convex_area_lista = convex_area;
fo_statistiche.extent_lista = extent;


save('mean_forchetta.mat', "fo_statistiche");


%%



clear;
close all;


clear;
close all;


[images, labels] = read_cucchiai();

area           = [];
perimetro      = [];
circolarita    = [];
eccentricita   = [];
solidita       = [];
equiv_diameter = [];
extent         = [];
convex_area    = [];

for i = 1:numel(images)
    
    im = im2double(imread(images{i}));

    im = imresize(im, 0.2);



    blue_channel = im(:, :, 3);

    new_blue = blue_channel < graythresh(blue_channel);

    pulizia_training = imclose(new_blue, strel('square', 35));

    pulizia_training = medfilt2(pulizia_training, [5 5]);


    training_descriptors = regionprops(pulizia_training, 'Area', 'Circularity', 'Perimeter', 'Eccentricity', 'Solidity', 'EquivDiameter', 'Extent', ...
        'ConvexArea');


    area           = [area; training_descriptors(1).Area];
    perimetro      = [perimetro; training_descriptors(1).Perimeter];
    circolarita    = [circolarita; training_descriptors(1).Circularity];
    eccentricita   = [eccentricita; training_descriptors(1).Eccentricity];
    solidita       = [solidita; training_descriptors(1).Solidity];
    equiv_diameter = [equiv_diameter; training_descriptors(1).EquivDiameter / numel(pulizia_training)];
    extent         = [extent; training_descriptors(1).Extent];
    convex_area    = [convex_area; training_descriptors(1).ConvexArea];


    primo_momento = seven_hu_moments(pulizia_training, 1);
    secondo_momento = seven_hu_moments(pulizia_training, 2);
    terzo_momento = seven_hu_moments(pulizia_training, 3);
    quarto_momento = seven_hu_moments(pulizia_training, 4);



end



rapporto_area_perimetro = area ./ (perimetro .^ 2);





cu_statistiche.mean_rapporto_cu        = mean(rapporto_area_perimetro);
cu_statistiche.mean_circolarita_cu     = mean(circolarita);
cu_statistiche.mean_eccentricita_cu    = mean(eccentricita);
cu_statistiche.mean_solidita_cu        = mean(solidita);
cu_statistiche.mean_equiv_diameter_cu  = mean(equiv_diameter);
cu_statistiche.mean_convex_area_cu     = mean(convex_area);

cu_statistiche.varianza_rapporto_cu     = std(rapporto_area_perimetro);
cu_statistiche.varianza_circolarita_cu  = std(circolarita);
cu_statistiche.varianza_eccentricita_cu = std(eccentricita);
cu_statistiche.varianza_solidita_cu     = std(solidita);


cu_statistiche.mean_primo_momento_cu   = mean(primo_momento);
cu_statistiche.mean_secondo_momento_cu = mean(secondo_momento);
cu_statistiche.mean_terzo_momento_cu   = mean(terzo_momento);
cu_statistiche.mean_quarto_momento_cu  = mean(quarto_momento);

cu_statistiche.varianza_primo_momento   = std(primo_momento);
cu_statistiche.varianza_secondo_momento = std(secondo_momento);
cu_statistiche.varianza_terzo_momento   = std(terzo_momento);
cu_statistiche.varianza_quarto_momento  = std(quarto_momento);

cu_statistiche.rapporto_area_perimetro_lista = rapporto_area_perimetro;
cu_statistiche.eccentricita_lista = eccentricita;
cu_statistiche.solidita_lista = solidita;
cu_statistiche.circolarita_lista = circolarita;
cu_statistiche.convex_area_lista = convex_area;
cu_statistiche.extent_list = extent;


save('mean_cucchiaio.mat', "cu_statistiche");

%%



clear;
close all;


clear;
close all;


[images, labels] = read_pinze();

area           = [];
perimetro      = [];
circolarita    = [];
eccentricita   = [];
solidita       = [];
equiv_diameter = [];
extent         = [];
convex_area    = [];

for i = 1:numel(images)
    
    im = im2double(imread(images{i}));

    im = imresize(im, 0.2);




    blue_channel = im(:, :, 3);

    new_blue = blue_channel < graythresh(blue_channel);

    pulizia_training = imclose(new_blue, strel('square', 35));

    pulizia_training = medfilt2(pulizia_training, [5 5]);


    training_descriptors = regionprops(pulizia_training, 'Area', 'Circularity', 'Perimeter', 'Eccentricity', 'Solidity', 'EquivDiameter', 'Extent', ...
        'ConvexArea');


    area           = [area; training_descriptors(1).Area];
    perimetro      = [perimetro; training_descriptors(1).Perimeter];
    circolarita    = [circolarita; training_descriptors(1).Circularity];
    eccentricita   = [eccentricita; training_descriptors(1).Eccentricity];
    solidita       = [solidita; training_descriptors(1).Solidity];
    equiv_diameter = [equiv_diameter; training_descriptors(1).EquivDiameter / numel(pulizia_training)];
    extent         = [extent; training_descriptors(1).Extent];
    convex_area    = [convex_area; training_descriptors(1).ConvexArea];


    primo_momento = seven_hu_moments(pulizia_training, 1);
    secondo_momento = seven_hu_moments(pulizia_training, 2);
    terzo_momento = seven_hu_moments(pulizia_training, 3);
    quarto_momento = seven_hu_moments(pulizia_training, 4);



end



rapporto_area_perimetro = area ./ (perimetro .^ 2);



pi_statistiche.mean_rapporto_pi        = mean(rapporto_area_perimetro);
pi_statistiche.mean_circolarita_pi     = mean(circolarita);
pi_statistiche.mean_eccentricita_pi    = mean(eccentricita);
pi_statistiche.mean_solidita_pi        = mean(solidita);
pi_statistiche.mean_equiv_diameter_pi  = mean(equiv_diameter);
pi_statistiche.mean_convex_area_pi     = mean(convex_area);

pi_statistiche.varianza_rapporto_pi     = std(rapporto_area_perimetro);
pi_statistiche.varianza_circolarita_pi  = std(circolarita);
pi_statistiche.varianza_eccentricita_pi = std(eccentricita);
pi_statistiche.varianza_solidita_pi     = std(solidita);


pi_statistiche.mean_primo_momento_pi   = mean(primo_momento);
pi_statistiche.mean_secondo_momento_pi = mean(secondo_momento);
pi_statistiche.mean_terzo_momento_pi   = mean(terzo_momento);
pi_statistiche.mean_quarto_momento_pi  = mean(quarto_momento);

pi_statistiche.varianza_primo_momento   = std(primo_momento);
pi_statistiche.varianza_secondo_momento = std(secondo_momento);
pi_statistiche.varianza_terzo_momento   = std(terzo_momento);
pi_statistiche.varianza_quarto_momento  = std(quarto_momento);

pi_statistiche.rapporto_area_perimetro_lista = rapporto_area_perimetro;
pi_statistiche.eccentricita_lista = eccentricita;
pi_statistiche.solidita_lista = solidita;
pi_statistiche.circolarita_lista = circolarita;
pi_statistiche.convex_area_lista = convex_area;
pi_statistiche.extent_list = extent;


save('mean_pinza.mat', "pi_statistiche");


%%



clear;
close all;


clear;
close all;


[images, labels] = read_taglierini();

area           = [];
perimetro      = [];
circolarita    = [];
eccentricita   = [];
solidita       = [];
equiv_diameter = [];
extent         = [];
convex_area    = [];

for i = 1:numel(images)
    
    im = im2double(imread(images{i}));

    im = imresize(im, 0.2);


    blue_channel = im(:, :, 3);

    new_blue = blue_channel < graythresh(blue_channel);

    pulizia_training = imclose(new_blue, strel('square', 35));

    pulizia_training = medfilt2(pulizia_training, [5 5]);


    training_descriptors = regionprops(pulizia_training, 'Area', 'Circularity', 'Perimeter', 'Eccentricity', 'Solidity', 'EquivDiameter', 'Extent', ...
        'ConvexArea');


    area           = [area; training_descriptors(1).Area];
    perimetro      = [perimetro; training_descriptors(1).Perimeter];
    circolarita    = [circolarita; training_descriptors(1).Circularity];
    eccentricita   = [eccentricita; training_descriptors(1).Eccentricity];
    solidita       = [solidita; training_descriptors(1).Solidity];
    equiv_diameter = [equiv_diameter; training_descriptors(1).EquivDiameter / numel(pulizia_training)];
    extent         = [extent; training_descriptors(1).Extent];
    convex_area    = [convex_area; training_descriptors(1).ConvexArea];


    primo_momento = seven_hu_moments(pulizia_training, 1);
    secondo_momento = seven_hu_moments(pulizia_training, 2);
    terzo_momento = seven_hu_moments(pulizia_training, 3);
    quarto_momento = seven_hu_moments(pulizia_training, 4);



end



rapporto_area_perimetro = area ./ (perimetro .^ 2);




ta_statistiche.mean_rapporto_ta        = mean(rapporto_area_perimetro);
ta_statistiche.mean_circolarita_ta     = mean(circolarita);
ta_statistiche.mean_eccentricita_ta    = mean(eccentricita);
ta_statistiche.mean_solidita_ta        = mean(solidita);
ta_statistiche.mean_equiv_diameter_ta  = mean(equiv_diameter);
ta_statistiche.mean_convex_area_ta     = mean(convex_area);

ta_statistiche.varianza_rapporto_ta     = std(rapporto_area_perimetro);
ta_statistiche.varianza_circolarita_ta  = std(circolarita);
ta_statistiche.varianza_eccentricita_ta = std(eccentricita);
ta_statistiche.varianza_solidita_ta     = std(solidita);


ta_statistiche.mean_primo_momento_ta   = mean(primo_momento);
ta_statistiche.mean_secondo_momento_ta = mean(secondo_momento);
ta_statistiche.mean_terzo_momento_ta   = mean(terzo_momento);
ta_statistiche.mean_quarto_momento_ta  = mean(quarto_momento);

ta_statistiche.varianza_primo_momento   = std(primo_momento);
ta_statistiche.varianza_secondo_momento = std(secondo_momento);
ta_statistiche.varianza_terzo_momento   = std(terzo_momento);
ta_statistiche.varianza_quarto_momento  = std(quarto_momento);


ta_statistiche.rapporto_area_perimetro_lista = rapporto_area_perimetro;
ta_statistiche.eccentricita_lista = eccentricita;
ta_statistiche.solidita_lista = solidita;
ta_statistiche.circolarita_lista = circolarita;
ta_statistiche.convex_area_lista = convex_area;
ta_statistiche.extent_lista = extent;

save('mean_taglierino.mat', "ta_statistiche");

%%

clear;
close all;


clear;
close all;


[images, labels] = read_trapani();

area           = [];
perimetro      = [];
circolarita    = [];
eccentricita   = [];
solidita       = [];
equiv_diameter = [];
extent         = [];
convex_area    = [];

for i = 1:numel(images)
    
    im = im2double(imread(images{i}));

    im = imresize(im, 0.2);



    blue_channel = im(:, :, 3);

    new_blue = blue_channel < graythresh(blue_channel);

    pulizia_training = imclose(new_blue, strel('square', 35));

    pulizia_training = medfilt2(pulizia_training, [5 5]);


    training_descriptors = regionprops(pulizia_training, 'Area', 'Circularity', 'Perimeter', 'Eccentricity', 'Solidity', 'EquivDiameter', 'Extent', ...
        'ConvexArea');


    area           = [area; training_descriptors(1).Area];
    perimetro      = [perimetro; training_descriptors(1).Perimeter];
    circolarita    = [circolarita; training_descriptors(1).Circularity];
    eccentricita   = [eccentricita; training_descriptors(1).Eccentricity];
    solidita       = [solidita; training_descriptors(1).Solidity];
    equiv_diameter = [equiv_diameter; training_descriptors(1).EquivDiameter / numel(pulizia_training)];
    extent         = [extent; training_descriptors(1).Extent];
    convex_area    = [convex_area; training_descriptors(1).ConvexArea];


    primo_momento = seven_hu_moments(pulizia_training, 1);
    secondo_momento = seven_hu_moments(pulizia_training, 2);
    terzo_momento = seven_hu_moments(pulizia_training, 3);
    quarto_momento = seven_hu_moments(pulizia_training, 4);



end



rapporto_area_perimetro = area ./ (perimetro .^ 2);




tr_statistiche.mean_rapporto        = mean(rapporto_area_perimetro);
tr_statistiche.mean_circolarita     = mean(circolarita);
tr_statistiche.mean_eccentricita    = mean(eccentricita);
tr_statistiche.mean_solidita        = mean(solidita);
tr_statistiche.mean_equiv_diameter  = mean(equiv_diameter);
tr_statistiche.mean_convex_area     = mean(convex_area);

tr_statistiche.varianza_rapporto     = std(rapporto_area_perimetro);
tr_statistiche.varianza_circolarita  = std(circolarita);
tr_statistiche.varianza_eccentricita = std(eccentricita);
tr_statistiche.varianza_solidita     = std(solidita);


tr_statistiche.mean_primo_momento   = mean(primo_momento);
tr_statistiche.mean_secondo_momento = mean(secondo_momento);
tr_statistiche.mean_terzo_momento   = mean(terzo_momento);
tr_statistiche.mean_quarto_momento  = mean(quarto_momento);

tr_statistiche.varianza_primo_momento   = std(primo_momento);
tr_statistiche.varianza_secondo_momento = std(secondo_momento);
tr_statistiche.varianza_terzo_momento   = std(terzo_momento);
tr_statistiche.varianza_quarto_momento  = std(quarto_momento);


tr_statistiche.rapporto_area_perimetro_lista = rapporto_area_perimetro;
tr_statistiche.eccentricita_lista = eccentricita;
tr_statistiche.solidita_lista = solidita;
tr_statistiche.circolarita_lista = circolarita;
tr_statistiche.convex_area_lista = convex_area;
tr_statistiche.extent_lista = extent;



save('mean_trapani.mat', "tr_statistiche");


%%

clear;
close all;

load('mean_cacciaviti.mat');
load('mean_chiave_inglese.mat');
load('mean_chiave_pappagallo.mat');
load('mean_coltello.mat');
load('mean_forchetta.mat');
load('mean_cucchiaio.mat');
load('mean_pinza.mat');
load('mean_taglierino.mat');
load('mean_trapani.mat');


[~, cacciaviti_labels] = read_cacciaviti();
[~, chiave_inglese_labels] = read_chiave_inglese();
[~, chiave_pappagallo_labels] = read_chiave_pappagallo();
[~, coltello_labels] = read_coltelli();
[~, forchetta_labels] = read_forchette();
[~, cucchiaio_labels] = read_cucchiai();
[~, pinza_labels] = read_pinze();
[~, taglierino_labels] = read_taglierini();
[~, trapani_labels] = read_trapani();



rapporto_definitivo = ca_statistiche.rapporto_area_perimetro_lista;

rapporto_definitivo = cat(1, rapporto_definitivo, ci_statistiche.rapporto_area_perimetro_lista, ...
    co_statistiche.rapporto_area_perimetro_lista,cp_statistiche.rapporto_area_perimetro_lista, ...
    cu_statistiche.rapporto_area_perimetro_lista, fo_statistiche.rapporto_area_perimetro_lista, ...
    pi_statistiche.rapporto_area_perimetro_lista, ta_statistiche.rapporto_area_perimetro_lista, ...
    tr_statistiche.rapporto_area_perimetro_lista);


lista_eccentricita = cat(1, ca_statistiche.eccentricita, ci_statistiche.eccentricita_lista, ...
    co_statistiche.eccentricita_lista, cp_statistiche.eccentricita_lista, ...
    cu_statistiche.eccentricita_lista, fo_statistiche.eccentricita_lista, ...
    pi_statistiche.eccentricita_lista, ta_statistiche.eccentricita_lista, ...
    tr_statistiche.eccentricita_lista);



lista_solidita = cat(1, ca_statistiche.solidita, ci_statistiche.solidita_lista, ...
    co_statistiche.solidita_lista, cp_statistiche.solidita_lista, ...
    cu_statistiche.solidita_lista, fo_statistiche.solidita_lista, ...
    pi_statistiche.solidita_lista, ta_statistiche.solidita_lista, ...
    tr_statistiche.solidita_lista);

lista_circolarita = cat(1, ca_statistiche.circolarita_lista, ci_statistiche.circolarita_lista, ...
    co_statistiche.circolarita_lista, cp_statistiche.circolarita_lista, ...
    cu_statistiche.circolarita_lista, fo_statistiche.circolarita, ...
    pi_statistiche.circolarita_lista, ta_statistiche.circolarita_lista, ...
    tr_statistiche.circolarita_lista);

lista_convex_area = cat(1, ca_statistiche.convex_area_lista , ci_statistiche.convex_area_lista, ...
    co_statistiche.convex_area_lista, cp_statistiche.convex_area_lista, ...
    cu_statistiche.convex_area_lista, fo_statistiche.convex_area_lista, ...
    pi_statistiche.convex_area_lista, ta_statistiche.convex_area_lista, ...
    tr_statistiche.convex_area_lista);


lista_extent_lista = cat(1, ca_statistiche.extent_lista, ci_statistiche.extent_lista, ...
    co_statistiche.extent_lista, cp_statistiche.extent_lista, ...
    cu_statistiche.extent_list, fo_statistiche.extent_lista, ...
    pi_statistiche.extent_list, ta_statistiche.extent_lista, ...
    tr_statistiche.extent_lista);

training_labels = cat(1, cacciaviti_labels, chiave_inglese_labels, chiave_pappagallo_labels, ...
    coltello_labels, forchetta_labels, cucchiaio_labels, pinza_labels, taglierino_labels, ...
    trapani_labels);


[out,  images] = testset_segmentation();

[~, labels] = read_crop();


train.rapporto = rapporto_definitivo;
train.eccentricita = lista_eccentricita;
train.solidita = lista_solidita;
train.circolarita = lista_circolarita;
train.labels = training_labels;
train.convex_area = lista_convex_area;
train.extent = lista_extent_lista;

test.rapporto = out(:, 1);
test.circolarita = out(:, 2);
test.eccentricita = out(:, 3);
test.solidita = out(:, 4);
test.extent = out(:, 9);
test.convex_area = out(:, 10);
test.x_pos = out(:, 5);
test.y_pos = out(:, 6);
test.num_image = out(:, 7);
test.labels = labels;
test.images = images;


save('test_finale_modelli', "train", "test");




%%


clear;
close all;



load('test_finale_modelli.mat');



ftr = [train.solidita, train.circolarita, train.eccentricita, train.extent];
fts = [test.solidita, test.circolarita, test.eccentricita, test.extent];


% c1 = fitctree(ftr, train.labels, 'OptimizeHyperparameters','auto', 'HyperparameterOptimizationOptions', ...
%  struct('Optimizer', 'gridsearch'));

% c1 = TreeBagger(30, ftr, train.labels, 'OOBPrediction','on', 'Method','classification', 'MinLeafSize',1);




% c1 = fitcknn(ftr, train.labels, "OptimizeHyperparameters","auto", "HyperparameterOptimizationOptions", ...
%      struct('Optimizer', 'gridsearch'));


c1 = fitcknn(ftr, train.labels, 'NumNeighbors', 5,'Distance','mahalanobis');

% c1=fitctree(ftr,train.labels,"MinLeafSize",4);

predicted = predict(c1, fts);

performance_test = confmat(predicted, test.labels);


figure
show_confmat(performance_test.cm_raw, performance_test.labels);

%% 
clear;
close all;




im = im2double(imread('../Dataset/test_set/20230215_225648.jpg'));



[out, prediction] = test_print_on_image(im);













