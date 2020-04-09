function route =design(i,j,d,L)%state指小车的状态，1为一个环都没有，2为下方有环，上方无环，3为下方有环，增益环已找到
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
%N=[2 3;3 2;5 3;3 4;5 4;2 5;5 5;3 6;7 2;8 3;7 4;8 5;7 6] ;   %创建一个单独表示环位置的2维矩阵；
global state;
route=-ones(20,1);
if state==1
  route=route_create(i,j,d,L);
  if route(1)~=1
    route=zeros(10,1); route(2)=random();
  else 
     state=2; %修改到下一次的状态，代表已找到环
  end
% elseif state==2   %下方如果有环且增益环还没找到，直接找增益环
%   route=find_1(i,j,4,6,L,2); 
else %if state==3  %下方有环，且增益环已放置,回收集区
    if j<7 
        route=find_1(i,j,8,5,L,2);
    else
        route=find_1(i,j,8,7,L,2);
    end
   state=1;   %先暂时只有推环功能 
    % else   %下方有环，上方有增益环，先去放增益环
%     if j<4
%        route=find_1(i,j,8,4,L,2);%离左边的近
%     elseif j>8
%        route=find_1(i,j,8,8,L,2);
%     else
%         route=find_1(i,j,8,6,L,2);
%     end
%     state=    
end

end

