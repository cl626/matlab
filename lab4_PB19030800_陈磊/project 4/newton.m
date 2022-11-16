function [answer,iterate]=newton(n,f)   
k=0;
g=zeros(n-1,1);     %存放(g1,...gn-1)
x=zeros(n-1,n-1);   %存放g对u的导数   
x1=zeros(n-1,1);    %存放u(k)
x2=ones(n-1,1);     %存放u(k+1)
u=zeros(n-1,1);     %存放L的ui
v=zeros(n-1,1);     %存放U的vi
y=zeros(n-1,1);     %存放Ly=(0,...,i,...0)T
%step1: LU=g对u的导数n-1阶矩阵x
while(abs(x2-x1)>0)
    x1=x2;
    for t=1:n-1
%A=L*U; 取得u,v
    u(1)=2*n+3*x1(1)^2-n;
    v(1)=-n/u(1);
    for i=2:n-1
        u(i)=2*n+3*x1(i)^2+n*v(i-1);
        v(i)=-n/u(i);
    end
%Ly=x(i)取得y;Uxt=y 取得xt
    y(t)=1/u(t);
    x(t,t+1)=y(t)/v(t);
    for j=(t+1):n-2
        y(j)=(1+n*y(j-1))/u(i);
        x(t,j+1)=(y(j)-x(t,j))/v(j);        
    end
        y(n-1)=(1+n*y(n-2))/u(n-1); 
    end
%step2: 取得g在uk处的值
g(1)=2*n*x1(1)-n*x1(2)-subs(f,'x',1/n);
g(n-1)=-n*x1(n-2)+2*n*x1(n-1)-subs(f,'x',n-1/n);
for i=2:n-2
    g(i)=-n*x1(i-1)+2*n*x1(i)-n*x1(i+1)-subs(f,'x',i/n);
end
%step3: 迭代取得uk+1
    x2=x1-x*g;  %uk+1=uk-x*g(uk);
    k=k+1;
end
answer=x2;
iterate=k;