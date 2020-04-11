                           
  L=[ 0 0 0 0 0 0 0 0 0 0 0     
 0 0,0,-2,-1,-3,-1,-2,0,0 0                  
 0 5,6,9,6,6,6,9,6,4 0                      
 0 5,9,6,6,7,6,6,9,4 0                      
 0 10,6,9,6,9,6,9,6,10 0
 0 5,9,6,6,8,6,6,9,4 0                       
 0 5,6,9,6,6,6,9,6,4 0
 0 0,0,2,1,3,1,3,0,0 0                             
 0 0 0 0 0 0 0 0 0 0 0  ];            %0,0,0,0,0,0,0,0,0,0,0  % [L(2,3),L(3,2),L(4,3),L(5,2),L(6,3),L(4,5),L(2,7),L(3,8),L(4,7),L(5,8),L(6,7),L(3,5)]=deal(50);
figure;
imagesc(L);
task=-ones(20,1);
global  x1; global y1;  global state;   global d; %d即direction表示方向
x1=5;y1=2;state=1;d=0;
while (sum(sum(L))~=261)
   task=design(x1,y1,d,L); 
   i=2;%task(2)=0;task(3)=0;task(4)=1;
   a=d;%a用于储存方向；
   if task(1)~=1
       L=random(L);
   else
    while(task(i)~=-1) %执行一次任务；
       
       switch  mod(task(i)-d+1000,4)
        case 0  
         L=go_forward(d,L);  
        case 1
         L=turn_left(d,L); a=a+(b~=task(i)-d+1000)*1;   
       case 2
         L=go_back(d,L); a=a+(b~=task(i)-d+1000)*2; 
       case 3
         L=turn_right(d,L);a=a-(b~=task(i)-d+1000)*1;
       end
       b=task(i)-d+1000;
       i=i+1;
    imagesc(L);        
    saveas(gcf,strcat('D:\ruanjian\MATLABfiles',int2str(8),'1.jpg'));%saveas函数是为了让图片显示并保存                                                                        %运行时请修改路径名
    end
   
   d=mod(a+1000,4);
   end
 end
imagesc(L);

%end