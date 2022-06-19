function e=Estimator(y,lambda,tau,win, fs)

[maks, maks_indeks]  = find(y > 0, 1);
if (isempty(maks))
    e = 0;
    return 
end
j = 0;
i = maks_indeks+tau-1;
A=maks;
while i<length(y)
    if ((y(i)>A*exp(-lambda*fs*(i-maks_indeks-tau))) && y(i)>0)
        j=i;
        break;
    end
    i=i+1;
end
if (j == 0)
    e = 0;
else
    e = j - maks_indeks;
end

end

