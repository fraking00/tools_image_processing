function momento = seven_hu_moments(image, type)


    if (type <= 0 || type > 7)
        error('il tipo deve essere compreso tra 1 e 7');
    end


    if type == 1
        % calcolo V20 e V02
        v20 =  compute_momenti_assoluti_invarianti(image, 2, 0);
        v02 = compute_momenti_assoluti_invarianti(image, 0, 2);
        momento = v20 + v02;
    elseif type == 2
        v11 = compute_momenti_assoluti_invarianti(image, 1, 1);
        v20 = compute_momenti_assoluti_invarianti(image, 2, 0);
        v02 = compute_momenti_assoluti_invarianti(image, 0, 2);
        momento = (v20 - v02)^2 + 4 * (v11)^2;
    elseif type == 3
        v30 = compute_momenti_assoluti_invarianti(image, 3, 0);
        v12 = compute_momenti_assoluti_invarianti(image, 1, 2);
        v03 = compute_momenti_assoluti_invarianti(image, 0, 3);
        v21 = compute_momenti_assoluti_invarianti(image, 2, 1);
        momento = (v30 - 3 * v12)^2 + (v03 - 3 * v21)^2;
    elseif type == 4
        v30 = compute_momenti_assoluti_invarianti(image, 3, 0);
        v12 = compute_momenti_assoluti_invarianti(image, 1, 2);
        v03 = compute_momenti_assoluti_invarianti(image, 0, 3);
        v21 = compute_momenti_assoluti_invarianti(image, 2, 1);
        momento = (v30 + 3 * v12)^2 + (v03 + 3 * v21)^2;
    elseif type == 5
        v30 = compute_momenti_assoluti_invarianti(image, 3, 0);
        v12 = compute_momenti_assoluti_invarianti(image, 1, 2);
        v03 = compute_momenti_assoluti_invarianti(image, 0, 3);
        v21 = compute_momenti_assoluti_invarianti(image, 2, 1);
        momento = (v30 - 3*v12)*(v30+v12)*((v30+v12)^2 - 3 * (v03 + v21)^2) + (3*v21-v03)*(v03+v21) * (3 * (v30+v12)^2 - (v03 + v21)^2);
    elseif type == 6
        v30 = compute_momenti_assoluti_invarianti(image, 3, 0);
        v02 = compute_momenti_assoluti_invarianti(image, 0, 2);
        v03 = compute_momenti_assoluti_invarianti(image, 0, 3);
        v12 = compute_momenti_assoluti_invarianti(image, 1, 2);
        v21 = compute_momenti_assoluti_invarianti(image, 2, 1);
        v11 = compute_momenti_assoluti_invarianti(image, 1, 1);
        v20 = compute_momenti_assoluti_invarianti(image, 2, 0);
        momento = (v20 - v02) * ((v30+v12)^2 - (v03+v21)^2) + 4*v11*(v30+v12)*(v03+v21);
    elseif type == 7
        v30 = compute_momenti_assoluti_invarianti(image, 3, 0);
        v12 = compute_momenti_assoluti_invarianti(image, 1, 2);
        v03 = compute_momenti_assoluti_invarianti(image, 0, 3);
        v21 = compute_momenti_assoluti_invarianti(image, 2, 1);
        momento = (3*v21-v03)*(v30+v12)*((v30+v12)^2 - 3*(v03+v21)^2) + (3*v12-v30)*(v03+v21)*(3*(v30+v12)^2 - (v03+v21)^2);
    end
        



end

