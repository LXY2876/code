function route =design(i,j,d,L)%stateָС����״̬��1Ϊһ������û�У�2Ϊ�·��л����Ϸ��޻���3Ϊ�·��л������滷���ҵ�
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%N=[2 3;3 2;5 3;3 4;5 4;2 5;5 5;3 6;7 2;8 3;7 4;8 5;7 6] ;   %����һ��������ʾ��λ�õ�2ά����
global state;
route=-ones(20,1);
if state==1
  route=route_create(i,j,d,L);
  if route(1)~=1
    route=zeros(10,1); route(2)=random();
  else 
     state=2; %�޸ĵ���һ�ε�״̬���������ҵ���
  end
% elseif state==2   %�·�����л������滷��û�ҵ���ֱ�������滷
%   route=find_1(i,j,4,6,L,2); 
else %if state==3  %�·��л��������滷�ѷ���,���ռ���
    if j<7 
        route=find_1(i,j,8,5,L,2);
    else
        route=find_1(i,j,8,7,L,2);
    end
   state=1;   %����ʱֻ���ƻ����� 
    % else   %�·��л����Ϸ������滷����ȥ�����滷
%     if j<4
%        route=find_1(i,j,8,4,L,2);%����ߵĽ�
%     elseif j>8
%        route=find_1(i,j,8,8,L,2);
%     else
%         route=find_1(i,j,8,6,L,2);
%     end
%     state=    
end

end

