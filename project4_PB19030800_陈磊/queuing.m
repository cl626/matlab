function [p0,p,ls,lq,ws,wq]=queuing(lamada,mu,c,N)
s1=0;   p=zeros(N,1);
h=lamada/mu;
for k=0:c
    s1=s1+(c*h)^k/factorial(k);
end
p0=1/(s1+c^c*h*(h^c-h^N)/(factorial(c)*(1-h)));
for k=1:c
    p(k,1)=p0*(c*h)^k/factorial(k);
end
for k=c:N
    p(k,1)=p0*c^c*h^k/factorial(c);
end
lq=(1-h^(N-c)-(N-c)*h^(N-c)*(1-h))*p0*h*(c*h)^c/(factorial(c)*(1-h)^2);
ls=lq+c*h*(1-p(N,1));
wq=lq/(lamada*(1-p(N,1)));
ws=wq+1/mu;