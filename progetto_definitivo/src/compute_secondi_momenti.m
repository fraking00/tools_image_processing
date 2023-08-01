function momento = compute_secondi_momenti(image, m, n,xbar, ybar)

    % TODO: considerare se tenere come parametri in input xbar, ybar oppure
    % no (quindi calcolarli all'interno)

    [img_rows, img_cols] = size(image);

    momento = 0;


    for i = 0:img_rows - 1
        for j = 0:img_cols - 1
            momento = momento + (((i - xbar)^m) * ((j - ybar)^n) * image(i + 1, j + 1));
        end
    end

end

