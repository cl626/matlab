function error=maxerr(n,a,b)
c=abs(a-b);
c(1)=abs(a(1)-b(1));
for i=2:n-1
    if c(i)>c(i-1)
        error=c(i);
    end
end
