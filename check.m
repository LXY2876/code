function z = check(x,y,i,j,L,index)  %�����ҵ�������·�����������һ�
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ ���ھ�������ϵ��ȷ���˶�·��,�ٸ��ݲ�ͬ�ķ���ȷ����Ӧ�������ϵ�е��˶�·��
%   �˴���ʾ��ϸ˵��       1       
%                 2  ��ǰλ��()  0    
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
elseif x==i && (L(x,y+s2)==6 || L(x,y+s2)==9)    %x��������ͬ,��y����
   z=check(x,y+s2,i,j,L,index+1);z(index)=1-s2;
elseif y==j && (L(x+s1,y)==6 || L(x+s1,y)==9)    %y��������ͬ����x����
   z=check(x+s1,y,i,j,L,index+1);z(index)=2+s1;
elseif L(x,y+s2)==6  && y~=j
    z=check(x,y+s2,i,j,L,index+1);z(index)=1-s2;
elseif L(x+s1,y)==6   && x~=i
    z=check(x+s1,y,i,j,L,index+1);z(index)=2+s1;
else
    z(1)=0; 
end 
end
