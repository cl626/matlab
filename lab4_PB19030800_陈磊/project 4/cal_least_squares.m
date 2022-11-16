function ansj=cal_least_squares(b)
a=zeros(2,2);   
a(1,1)=5;   a(2,1)=5;
a(1,2)=-log(10)-log(20)-log(40)-log(80)-log(160);
for i=0:4
    a(2,2)=a(2,2)-log(10*2^i)*log(10*2^i);
end
%b(1,1)=log(error1)+log(error2)+log(error3)+log(error4)+log(error5);
%b(2,1)=log(error1)*log(error1)+log(error2)*log(error2)+log(error3)*log(error3)+log(error4)*log(error4)+log(error5)*log(error1);
ansj=a\b;
