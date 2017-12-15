load C:\Users\Natan\Documents\MATLAB\Exam\data\cells.mat;
timeError=zeros(1,7);
timeCells=zeros(1,7);
for t=10:2:22
    bounds=0;
    cs=0;
    array=cells(:,:,:,(t-10)/2+1);
    dim=size(array);
    for z=1:dim(3)
        for y=1:dim(1)
            for x=1:dim(2)
                if((x==1||x==dim(2)||y==1||y==dim(1)||z==1||z==dim(3))&&(array(y,x,z)~=0))
                    bounds=bounds+array(y,x,z);
                elseif((x==1||x==dim(2)||y==1||y==dim(1)||z==1||z==dim(3))&&(array(y,x,z)==0))
                    0;
                elseif((array(y,x,z)~=0)&&(array(y+1,x,z)==0||array(y-1,x,z)==0||array(y,x+1,z)==0||array(y,x-1,z)==0||array(y-1,x-1,z)==0||array(y+1,x+1,z)==0||array(y-1,x+1,z)==0||array(y+1,x-1,z)==0))
                    bounds=bounds+array(y,x,z);
                elseif((array(y,x,z-1)~=0)&&(array(y+1,x,z-1)==0||array(y-1,x,z-1)==0||array(y,x+1,z-1)==0||array(y,x-1,z-1)==0||array(y-1,x-1,z-1)==0||array(y+1,x+1,z-1)==0||array(y-1,x+1,z-1)==0||array(y+1,x-1,z-1)==0))
                    bounds=bounds+array(y,x,z);
                elseif((array(y,x,z+1)~=0)&&(array(y+1,x,z+1)==0||array(y-1,x,z+1)==0||array(y,x+1,z+1)==0||array(y,x-1,z+1)==0||array(y-1,x-1,z+1)==0||array(y+1,x+1,z+1)==0||array(y-1,x+1,z+1)==0||array(y+1,x-1,z+1)==0))
                    bounds=bounds+array(y,x,z);
                end
                if(array(y,x,z)~=0)
                    cs=cs+array(y,x,z);
                end
                 if((x==1||x==dim(2)||y==1||y==dim(1)&&(array(y,x,z)~=0)))
                     bounds=bounds+array(y,x,z);
                 elseif((x==1||x==dim(2)||y==1||y==dim(1)&&(array(y,x,z)==0)))
                     0;
                 elseif((array(y,x,z)~=0)&&(array(y+1,x,z)==0||array(y-1,x,z)==0||array(y,x+1,z)==0||array(y,x-1,z)==0||array(y-1,x-1,z)==0||array(y+1,x+1,z)==0||array(y-1,x+1,z)==0||array(y+1,x-1,z)==0))
                     bounds=bounds+array(y,x,z);
                 end
                 if(array(y,x,z)~=0)
                     cs=cs+array(y,x,z);
                 end
            end
        end
    end
    timeError((t-10)/2+1)=bounds;
    timeCells((t-10)/2+1)=cs;
end
timeError=timeError*.5;
x=[0,10,12,14,16,18,20,22];
y=horzcat([100000],timeCells(1:7));
error=horzcat([10000],timeError(1:7));
h=figure;
errorbar(x,y,error,'LineWidth',2,'Marker','o','MarkerSize',4);
xlabel('Time [days]');
ylabel('Tumor Cell Count');
title('Rat''s Brain Tumor Growth','FontSize',16);
saveas(h,'C:\Users\Natan\Documents\MATLAB\Exam\results\errorgraph.png');