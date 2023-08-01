function momento = compute_momenti(image, p, q)

    
    momento = 0;

    
    [img_rows, img_cols] = size(image);

    

    for i = 0:img_rows - 1
        for j = 0:img_cols - 1
            momento = momento + (i^p * j^q * image(i+1, j+1));
        end
    end

    


end

