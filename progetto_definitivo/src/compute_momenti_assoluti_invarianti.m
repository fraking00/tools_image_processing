function momento = compute_momenti_assoluti_invarianti(image, m, n)

    momento = 0;

    alpha_val = ((m + n) / 2) + 1;

    m00 = compute_momenti(image, 0, 0);
    m10 = compute_momenti(image, 1, 0);
    m01 = compute_momenti(image, 0, 1);

    xbar = m10 / m00;
    ybar = m01 / m00;

    numeratore = compute_secondi_momenti(image, m, n, xbar, ybar);

    momento = numeratore / (m00)^alpha_val;


end

