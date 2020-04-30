clear; clc;
%Program to calculate the apparent resisitivity values at different
%frequencies for a two layer model varying the values of thickness in the
%first layer
f=[0.00001000 0.00001778 0.00003162 0.00005623 0.00010000 0.00017783 0.00031623 0.00056234 0.00100000 0.00177828 0.00316228 0.00562341 0.01000000 0.01778279 0.03162278 0.05623413 0.10000000 0.17782794 0.31622777 0.56234133 1.00000000 1.77827941 3.16227766 5.62341325 10.00000000];
w=2*pi*f;
u=4*pi*10^-7;
sigma=[0.2, 0.1, 0.01]; %units in S/m
n=length(sigma);
z=w*u./sqrt(-1*i*w*u*sigma(n)); %evaluates the impedance for the nth layer
t=[1000, 1000, 1000
    300 1000 3000];
m=size(t,1);
p = size(t,2)
res=zeros(n,length(f));
res(n,:) = z

for k = n-1:-1:1
    res(k,:)=-1*w*u./sqrt(-1*i*w*u*sigma(k)).*coth((i*sqrt(-1*i*w*u*sigma(k)).*3000)-acoth((sqrt(-1*i*w*u*sigma(k))./w*u).*res(k+1,:)));
end
    

rho=abs(res).^2./(w*u)
