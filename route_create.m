function route = route_create(i,j,d,L) %ר�����һ�
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ ���ھ�������ϵ��ȷ���˶�·��,�ٸ��ݲ�ͬ�ķ���ȷ����Ӧ�������ϵ�е��˶�·��
%   �˴���ʾ��ϸ˵��      1        
%                 2  ��ǰλ��  0    
%                        3 
 %��ǰ������������������������������������������ 
route=-ones(20,1);
 if d==0                %��Ҫע���һ���ǣ�ÿ�β��һ���λ�ö������ȴӳ�����࿪ʼ��       
        for k=1:2      %�ȵ�����ǰ�����������ж�
            if L(i,j+k)==9
            route=check(i,j,i,j+k,L,2);
            end
            if   route(1)==1
              break; 
            end
        end
        if route(1)==0    %���ǰ�������Ҳ������������е������п�ʼ��
           for k=-2:2  
               for l=-2:2               
                 if  L(i+k,j+l)==9 %����ҵ�����ѭ��
                     route=check(i,j,i+k,j+l,L,2);
                     if route(1)==1
                         break;
                     end
                 end
               end
               if route(1)==1  && L(i+k,j+l)==9   %���������ѭ��
                 break;
               end
           end
        end
%����    ������������������������������������������     
elseif d==1
       for k=1:2      %�ȵ�����ǰ����������жϣ���ʱ�ھ��Բο�ϵ������
            route=check(i,j,i-k,j,L,2);
            if  L(i-k,j)==9 && route(1)==1
              break; 
            end
        end
        if route(1)==0    %���ǰ�������Ҳ������������е������п�ʼ��
           for k=-2:2  
               for l=-2:2               
                 if  L(i-l,j+k)==9 %����ҵ�����ѭ��
                     route=check(i,j,i-l,j+k,L,2);
                     if route(1)==1
                         break;
                     end
                 end
               end
               if route(1)==1  && L(i-l,j+k)==9   %���������ѭ��
                 break;
               end
           end
        end
%����  ������������������ ��������������������    
elseif d==2
       for k=1:2      %�ȵ�����ǰ����������жϣ���ʱ�ھ��Բο�ϵ���Ǻ�
            route=check(i,j,i,j-k,L,2);
            if  L(i,j-k)==9 && route(1)==1
              break; 
            end
        end
        if route(1)==0    %���ǰ�������Ҳ������������е������п�ʼ��
           for k=-2:2  
               for l=-2:2               
                 if  L(i-k,j-l)==9 %����ҵ�����ѭ��
                     route=check(i,j,i-k,j-l,L,2);
                     if route(1)==1
                         break;
                     end
                 end
               end
               if route(1)==1  && L(i-k,j-l)==9   %���������ѭ��
                 break;
               end
           end
        end
%���ҡ���������������������������������        
else
    for k=1:2      %�ȵ�����ǰ����������жϣ���ʱ�ھ��Բο�ϵ�����ң�
            route=check(i,j,i+k,j,L,2);
            if  L(i+k,j)==9 && route(1)==1
              break;  
            end
        end
        if route(1)==0    %���ǰ�������Ҳ������������е������п�ʼ��
           for k=-2:2  
               for l=-2:2               
                 if  L(i+l,j-k)==9 %����ҵ�����ѭ��
                     route=check(i,j,i+l,j-k,L,2);
                     if route(1)==1
                         break;
                     end
                 end
               end
               if route(1)==1  && L(i+l,j-k)==9   %���������ѭ��
                 break;
               end
           end
        end
end

end
