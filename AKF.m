function Rxx=AKF(y)

N=length(y);
for k=0:N-1
    Rxx_pom=0;
   for j=0:N-1-k
      Rxx_pom=Rxx_pom+conj(y(j+1))*y(j+1+k);
   end
   Rxx(k+1)=1/N*Rxx_pom;
end

