function L= random(L)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
global x1;global y1; global d;
i=1;j=1; item=1; X=[3 1 0 2;2 0 3 1;1 3 2 0;0 2 1 3];
while  L(i,j)~=6
i=x1;j=y1;
    a=unifrnd (0,4);
  if a>3
    i=x1+1;
  elseif a>2
    i=x1-1; item=2;
  elseif a>1 
     j=y1+1; item=3;
  else
      j=y1-1; item=4;
  end
  
end

L(i,j)=10;L(x1,y1)=6;
d=X(d+1,item);
x1=i;y1=j;
end

