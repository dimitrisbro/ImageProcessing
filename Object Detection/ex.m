%%first
clc;
clear all;
close all;

v=VideoReader('noisy.avi');
 myVid=VideoWriter('noisymovingVar.avi');
 open(myVid);

ma=[-1 0 1; -1 0 1; -1 0 1];
l=0;
while hasFrame(v)
    vframe=readFrame(v);
    vframeg=double(rgb2gray(vframe));
    y = conv2(vframeg, ma, 'same');
    th = y < 100;
    y(th) = 0;
    if l==0
        for i=1:480                
            va(i)=var(y(i,:));
        end
%         plot(va)
        the=291;
        l=l+1;
    else
        for i=(the-5):(the+5)
            va(i)=var(y(i,:));
        end
        [vari,c]=max(va);
        the=th-5+c;
    end
    for i=1:the  %boundary==296 apo to plot tou variance
         vframe(i,:,:)=0;
    end
    vframe(the,:,1)=256;
    %[aa,e]=sobel(double(rgb2gray(vframe)));
   imshow(vframe)
   writeVideo(myVid,vframe);
 end
%plot(va) %variance

%% second
clc;
clear all;
close all;

v=VideoReader('april21.avi');
%myVid=VideoWriter('noskycleared.avi');
%open(myVid);
while hasFrame(v)
    vframe=readFrame(v);
    thresh = multithresh(rgb2gray(vframe),3);
    seg = imquantize(rgb2gray(vframe),thresh);
    RGB = label2rgb(seg);
    for i=1:480
        for j=1:704
            if (RGB(i,j,1)==255)&&(RGB(i,j,2)==255)&&(RGB(i,j,3)==0)
                vframe(i,j,1)=255;
                vframe(i,j,2)=255;
                vframe(i,j,3)=255;
            elseif (RGB(i,j,1)==255)&&(RGB(i,j,2)==0)&&(RGB(i,j,3)==0)
                vframe(i,j,1)=255;
                vframe(i,j,2)=255;
                vframe(i,j,3)=255;
            end
        end
    end
    %imshow(vframe)
    %writeVideo(myVid,vframe);

    frame = imgaussfilt3(vframe);
    channel1MinY = 130;
    channel1MaxY = 255;

    channel2MinY = 130;
    channel2MaxY = 255;

    channel3MinY = 0;
    channel3MaxY = 130;

    Yellow=((frame(:,:,1)>=channel1MinY)|(frame(:,:,1)<=channel1MaxY))& ...
        (frame(:,:,2)>=channel2MinY)&(frame(:,:,2)<=channel2MaxY)&...
        (frame(:,:,3)>=channel3MinY)&(frame(:,:,3)<=channel3MaxY);

    channel1MinW = 200;
    channel1MaxW = 255;

    channel2MinW = 200;
    channel2MaxW = 255;

    channel3MinW = 200;
    channel3MaxW = 255;

    White=((frame(:,:,1)>=channel1MinW)|(frame(:,:,1)<=channel1MaxW))&...
        (frame(:,:,2)>=channel2MinW)&(frame(:,:,2)<=channel2MaxW)& ...
        (frame(:,:,3)>=channel3MinW)&(frame(:,:,3)<=channel3MaxW);

    frameW = edge(White, 'sobel', 0.2);
    frameY = edge(Yellow, 'sobel', 0.2);

    frameY = bwareaopen(frameY,15);
    frameW = bwareaopen(frameW,15);

    subplot(1,2,1)
    imshow(frameY);
    title('White')
    subplot(1,2,2)
    imshow(frameW);
    title('Yellow')
    %imshow(vframe)
    suptitle('Original Video')
 end

%% noise
clc;
clear all;
close all;

%myVid=VideoWriter('noisy.avi');
%open(myVid);
v=VideoReader('april21.avi');
%while hasFrame(v)
    vframe=readFrame(v);
    [imgau,n]=gaussian(vframe,0.2,0.01);
    imsnp=snp(imgau,0.05);
    %writeVideo(myVid,uint8(imsnp));
    
    imshow(uint8(imsnp))
%end
%close(myVid);

%% noise cancel

clc;
clear all;
close all;

%myVid=VideoWriter('cleared.avi');
%open(myVid);
v=VideoReader('noisy.avi');
while hasFrame(v)
    vframe=readFrame(v);
    imout=medianf(vframe);
    imout=meanf(imout);
    %imshow(uint8(imout))
    %writeVideo(myVid,uint8(imout));
end

%% mask 
clc;
clear all;
close all;

%myVid=VideoWriter('cleared.avi');
%open(myVid);
v=VideoReader('noskycleared.avi');
% while hasFrame(v)
    vframe=readFrame(v);
    [aa,e]=sobel(double(rgb2gray(vframe)));
    %e= edge(rgb2gray(vframe),'Sobel');
    imshow(e)
    %writeVideo(myVid,uint8(imout));
% end