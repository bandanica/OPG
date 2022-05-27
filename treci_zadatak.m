clear all
close all
clc

N=3; % broj stanja (urni)
M=3; % broj razlicitih boja
T=100; % broj opservacija

a=0.05;
b=0.1;
%a=0.2;
%b=0.33;

% Matrica tranzicije 
A=[1-3*a a 2*a; b 1-2*b b; 0.1 0.1 0.8];
% Matrica opservacija
B=[5/8 2/8 1/8; 2/13 7/13 4/13; 1/10 3/10 6/10];
% Matrica inicijalnih verovatnoca
Pi=[1/3 1/3 1/3];

Q=zeros(1,T); % skup stanja u kojima se nalazimo u svakom  od t(100) trenutaka
O=zeros(1,T); % skup opservacija
Q(1)=Generator(Pi);

for t=1:T-1
    O(t)=Generator(B(Q(t),:));
    Q(t+1)=Generator(A(Q(t),:));
end
O(T)=Generator(B(Q(T),:));

%% Problem 1

alfa=zeros(T,N); % forward koeficijenti-alfa(t, i) je varovatnoca da je u trenutku t aktivno stanje Si

% Inicijalizacija

for i=1:N
    alfa(1,i)=Pi(i)*B(i, O(1));
end

% Indukcija

for t=1:T-1
    for j=1:N
        for i=1:N
        alfa(t+1, i)=alfa(t+1, i)+alfa(t,j)*A(j,i)*B(i, O(t+1));
        end
    end
end

% Terminacija

P1=0;
P1=sum(alfa(T,:));

%% Problem 2


% clc
% clear all
% close all



%P = [0.6, 0.4];

%A = [0.7, 0.3; 0.4, 0.6];
    
%B = [0.5, 0.4, 0.1; 0.1, 0.3, 0.6];

%x = [1 2 3]; %sekvinca opservacija


[P1,v1] = myViterbi(O,Pi,A,B);
% Pu = myHMMEval(x,P,A,B)
% [p,a,b]=myBaumWelch(x,P,A,B)
