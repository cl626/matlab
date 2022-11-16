function accu=accurate(n,f)
a=zeros(n-1,n-1);   b=zeros(n-1,1);
a(1,1)=2*n; a(1,2)=-n;
a(n-1,n-2)=-n; a(n-1,n-1)=2*n;
for i=2:n-2
    a(i,i-1)=-n;
    a(i,i)=2*n;
    a(i,i+1)=-n;
end
for i=1:n-1
    b(i)=subs(f,'x',i/n);
end
accu=a\b;
