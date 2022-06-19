function e=Estimator(y,lambda,tau,win, fs)

[maks, maks_indeks]  = find(y > 0, 1);
if (isempty(maks))
    e = 0;
    return 
end
j = 0;
for i = maks_indeks + tau-1:length(y)
    if ((y(i) > 0) && (maks*exp(-lambda*fs*(i-maks_indeks-tau)) <  y(i)))
        j = i;
        break;
    end
end
if (j == 0)
    e = 0;
    return
else
    e = j - maks_indeks;
    return
end

end

