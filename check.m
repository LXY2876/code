function z = check(x,y,i,j,L,index)  %用于找到两点间的路径，可用于找环
%UNTITLED2 此处显示有关此函数的摘要 先在绝对坐标系中确定运动路线,再根据不同的方向确定相应相对坐标系中的运动路线
%   此处显示详细说明       1       
%                 2  当前位置()  0    
%                        3 
z=-ones(20,1); 
s1=(i-x)/abs(i-x);  s2=(j-y)/abs(j-y);
if x==i
    s1=0;
elseif y==j
    s2=0;
end
if  x==i && y==j
   z(1)=1;  
elseif x==i && (L(x,y+s2)==6 || L(x,y+s2)==9)    %x轴坐标相同,看y方向
   z=check(x,y+s2,i,j,L,index+1);z(index)=1-s2;
elseif y==j && (L(x+s1,y)==6 || L(x+s1,y)==9)    %y轴坐标相同，看x方向
   z=check(x+s1,y,i,j,L,index+1);z(index)=2+s1;
elseif L(x,y+s2)==6  && y~=j
    z=check(x,y+s2,i,j,L,index+1);z(index)=1-s2;
elseif L(x+s1,y)==6   && x~=i
    z=check(x+s1,y,i,j,L,index+1);z(index)=2+s1;
else
    z(1)=0; 
end 
end
