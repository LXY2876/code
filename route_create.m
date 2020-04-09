function route = route_create(i,j,d,L) %专用于找环
%UNTITLED2 此处显示有关此函数的摘要 先在绝对坐标系中确定运动路线,再根据不同的方向确定相应相对坐标系中的运动路线
%   此处显示详细说明      1        
%                 2  当前位置  0    
%                        3 
 %朝前。。。。。。。。。。。。。。。。。。。。。 
route=-ones(20,1);
 if d==0                %需要注意的一点是，每次查找环的位置都是优先从车的左侧开始找       
        for k=1:2      %先单独对前方两个进行判断
            if L(i,j+k)==9
            route=check(i,j,i,j+k,L,2);
            end
            if   route(1)==1
              break; 
            end
        end
        if route(1)==0    %如果前方两个找不到，从上两行到下两行开始找
           for k=-2:2  
               for l=-2:2               
                 if  L(i+k,j+l)==9 %如果找到跳出循环
                     route=check(i,j,i+k,j+l,L,2);
                     if route(1)==1
                         break;
                     end
                 end
               end
               if route(1)==1  && L(i+k,j+l)==9   %跳出最外层循环
                 break;
               end
           end
        end
%朝左    。。。。。。。。。。。。。。。。。。。。。     
elseif d==1
       for k=1:2      %先单独对前两个点进行判断（此时在绝对参考系中是左）
            route=check(i,j,i-k,j,L,2);
            if  L(i-k,j)==9 && route(1)==1
              break; 
            end
        end
        if route(1)==0    %如果前方两个找不到，从上两行到下两行开始找
           for k=-2:2  
               for l=-2:2               
                 if  L(i-l,j+k)==9 %如果找到跳出循环
                     route=check(i,j,i-l,j+k,L,2);
                     if route(1)==1
                         break;
                     end
                 end
               end
               if route(1)==1  && L(i-l,j+k)==9   %跳出最外层循环
                 break;
               end
           end
        end
%朝后  。。。。。。。。。 。。。。。。。。。。    
elseif d==2
       for k=1:2      %先单独对前两个点进行判断（此时在绝对参考系中是后）
            route=check(i,j,i,j-k,L,2);
            if  L(i,j-k)==9 && route(1)==1
              break; 
            end
        end
        if route(1)==0    %如果前方两个找不到，从上两行到下两行开始找
           for k=-2:2  
               for l=-2:2               
                 if  L(i-k,j-l)==9 %如果找到跳出循环
                     route=check(i,j,i-k,j-l,L,2);
                     if route(1)==1
                         break;
                     end
                 end
               end
               if route(1)==1  && L(i-k,j-l)==9   %跳出最外层循环
                 break;
               end
           end
        end
%朝右。。。。。。。。。。。。。。。。。        
else
    for k=1:2      %先单独对前两个点进行判断（此时在绝对参考系中是右）
            route=check(i,j,i+k,j,L,2);
            if  L(i+k,j)==9 && route(1)==1
              break;  
            end
        end
        if route(1)==0    %如果前方两个找不到，从上两行到下两行开始找
           for k=-2:2  
               for l=-2:2               
                 if  L(i+l,j-k)==9 %如果找到跳出循环
                     route=check(i,j,i+l,j-k,L,2);
                     if route(1)==1
                         break;
                     end
                 end
               end
               if route(1)==1  && L(i+l,j-k)==9   %跳出最外层循环
                 break;
               end
           end
        end
end

end
