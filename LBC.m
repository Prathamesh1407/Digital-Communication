clear all
close all
clc
n=input("Enter No of code bits "); %n
k=input("Enter No of message bits "); %k
p=input("Enter Parity Coeff Matrix\n");

disp("Parity Matrix\n")
disp(p);

I=eye(k);
G=[I,p];
disp("Generator Matrix\n")
disp(G);

m=dec2bin(0:1:2^k-1); #1 to 2^n -1 binary bits
C=m * G;

for i=1:2^k %row
  for j=1:n %cols
    C(i,j)=mod(C(i,j),2); %for converting to 0 or 1
  endfor
endfor
disp("Codewords are\n")
disp(C);

disp("Hamming Weights are");
weight=sum(C');
disp(weight');
weight(1,1)=weight(1,2); %for removing zero was at first place
disp(weight);
d=min(weight);
disp("Minimum Hamming Distance is ");
disp(d)

td=d-1;
disp("No. of errors can be detected is ");
disp(td);

tc=td/2;
disp("No. of errors can be corrected is ");
disp(tc);

%detection and correction part
H=[p',eye(n-k)];
disp("Parity Check Matrix")
disp(H);

h=H';

E=eye([n,n]);
disp(E);

r=input("Enter the received Codeword ");

s=r*H'; %Syndrome=Y*H Transpose
for i=1:n-k
  s(1,i)=mod(s(1,i),2);
endfor
disp("Syndrome")
disp(s);

if(s==[0 0 0])
disp("Valid Codeword");
disp(r);
else
for i=1:n
  if(s==h(i,:))
disp("Error is in bit No. ");
error=i;
disp(i);
break;
end
endfor
disp("Error Pattern");
disp(E(error,:));
c=mod(r+E(error,:),2);
disp("Corrected Codeword is");
disp(c);
end

