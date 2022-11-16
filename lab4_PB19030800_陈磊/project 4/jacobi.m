function [answer,iterate_time]=jacobi(n,f)
a=zeros(n-1,n-1);   b=zeros(n-1,1); k=0;
for i=1:(n-1)
    b(i)=subs(f,'x',i/n);
end
a(1,1)=2*n; 
a(1,2)=-n;
a(n-1,n-2)=-n;
a(n-1,n-1)=2*n;
for i=2:(n-2)
    a(i,i-1)=-n;
    a(i,i)=2*n;
    a(i,i+1)=-n;
end
x1=zeros(n-1,1);
x2=ones(n-1,1);
while(abs(x2-x1)>1e-10)
    x1=x2;
    for i=1:(n-1)
        s=0;
        for j=1:(n-1)
            s=s+a(i,j)*x1(j);
        end
        x2(i)=(b(i)-s+a(i,i)*x1(i))/a(i,i);
    end
    k=k+1;
end
answer=x2;
iterate_time=k;