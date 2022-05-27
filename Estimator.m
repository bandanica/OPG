function e=Estimator(y,lambda,tau,win)

% lambda-brzina sa kojom opada pomocni signal
% win-duzina prozora u odbircima
% tau-blanking time (3-4)ms
j=1;

% Trazimo prvi maksimum u okviru prozora
while y(j)==0 && j<win
    j=j+1;
end

% Kada smo nasli prvi maksimum pustamo blanking time (od tog trentka se
% meri tau), a nakon zavrsetka blanking time-a krece eksponencijalni signal
% A*exp^(lambda*t)
A=y(j); % amplituda za eksponencijalni signal (uvek intenzitet prvog maksimuma od kog se meri tau)
t=j; % u odnosu na ovu poziciju merimo pitch periodu
j=min(win, j+tau-1); % dodavanje blanking perioda 3ms
while j<win && y(j)<A*exp(-lambda*(j-t))
    % j<win sluzi da bizmo pazili o tome da ne izadjemo iz prozora
    % drugi uslov govori o tome da li smo dosli do nardenog maksimuma
    % (eksponencijalna f-ja opada sve dok ne udari u naredni maksimum)
    j=j+1;
    % Povecavamo indeks dok ne dodjemo da maksimuma
end
e=j-t; % procena pitch periode

%poboljsanje, da budemo sigurni da smo iskoristili ceo prozor na najbolji
%nacin: treba nastaviti trazenje narednih pikova u sekvenci do kraja
%prozora, na kraju uraditi procenu kao medianu svih

end
