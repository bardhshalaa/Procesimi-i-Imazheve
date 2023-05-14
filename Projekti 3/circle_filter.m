function y=circle_filter(I,d0,W)
[M,N]=size(I);
for i=1:M
for j=1:N
if(sqrt((i-(M/2))^2+(j-(N/2))^2)<d0-(W/2))
A(i,j)=1;
elseif(sqrt((i-(M/2))^2+(j-(N/2))^2)>d0+(W/2))
A(i,j)=1;
elseif(sqrt((i-(M/2))^2+(j-(N/2))^2)>=d0-(W/2))
A(i,j)=0;

else(sqrt((i-(M/2))^2+(j-(N/2))^2)<=d0+(W/2))
A(i,j)=0;
end
end
end
y=A;
