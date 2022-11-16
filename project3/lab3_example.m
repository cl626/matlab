%f:min目标函数系数，若求max需要转换一下
%intcon:限制为整数的变量序号
%A:约束Ax<=b中的A
%b:约束Ax<=b中的b
%Aeq:约束Aeqx=beq中的Aeq
%beq:约束Aeqx=beq中的beq
%lb:x的下限
%ub:x的上限
%例如：课本134页，例1

f=[-20,-10];
intcon=1:2; %生成[1,2]，意味着1号和2号变量约束为整数
A=[5,4;2,5];
b=[24,13];
Aeq=[];
beq=[];
lb=zeros(2,1);
ub=[];

[x, fval] = intlinprog(f,intcon,A,b,Aeq,beq,lb,ub);
disp("最优整数解:")
x
disp("最大目标函数值:")
-fval