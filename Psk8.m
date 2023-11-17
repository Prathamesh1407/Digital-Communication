clear all;
clc;
close all;
pkg load communications
N=1002;
x=randi([0,1],1,N);
%randi: This is a MATLAB function used for generating random integers.
%[0, 1]: The [0, 1] argument specifies the range from which random integers should be generated. In this case, it's the range from 0 to 1, which corresponds to generating random integers of 0 and 1.
%1, N: These arguments specify the dimensions of the output array. The 1 indicates that the output should be a row vector, and N indicates that the length of the vector should be N.
M=8;
yy=[]

for i=1:3:length(x) % 1 to length(x) increment by 3
  if(x(i)==0 && x(i+1)==0 & x(i+2)==0) y=cosd(0)+1j*sind(0);
  elseif(x(i)==0 && x(i+1)==0 & x(i+2)==1) y=cosd(45)+1j*sind(45);
  elseif(x(i)==0 && x(i+1)==1 & x(i+2)==0) y=cosd(90)+1j*sind(90);
  elseif(x(i)==0 && x(i+1)==1 & x(i+2)==1) y=cosd(135)+1j*sind(135);
  elseif(x(i)==1 && x(i+1)==0 & x(i+2)==0) y=cosd(180)+1j*sind(180);
  elseif(x(i)==1 && x(i+1)==0 & x(i+2)==1) y=cosd(225)+1j*sind(225);
  elseif(x(i)==1 && x(i+1)==1 & x(i+2)==0) y=cosd(270)+1j*sind(270);
  elseif(x(i)==1 && x(i+1)==1 & x(i+2)==1) y=cosd(315)+1j*sind(315);
  endif
 yy=[yy y]
endfor
scatterplot(yy) %without AWGN


EbN0db=20;
EbN0=10^(EbN0db/10); % to conver db->linear scale S/N in db=10 logb10(S/N) take antilog

%AWGN Channel
n=(1/sqrt(2))*[randn(1,length(yy))+1j*randn(1,length(yy))];

sigma=sqrt(1/((log2(M))*EbN0));

r=yy+sigma*n;
scatterplot(r); %With AWGN

%n: The complex Gaussian noise signal that represents the noise in the received signal.

%randn(1, length(yy)): This generates a sequence of random numbers from a standard normal distribution (mean = 0, variance = 1). It has the same length as the transmitted symbol sequence yy.

%1j * randn(1, length(yy)): This generates another sequence of random numbers with the same properties but uses 1j to represent the imaginary unit (complex numbers).

%(1/sqrt(2)): This term scales the noise to ensure that it has a unit power, which means it has a standard deviation of 1.

%The formula generates complex Gaussian noise with a mean of 0, a variance of 1, and a standard deviation of 1. It is scaled by 1/sqrt(2) to ensure that it has a unit power, which is typical in communication system simulations.

%The resulting n array is a sequence of complex numbers representing the noise in the received signal. This noise is then added to the transmitted symbols to simulate the effects of noise in the communication channel.
