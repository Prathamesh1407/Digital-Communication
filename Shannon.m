clc
clear all
close all
pkg load communications
n=input("Enter the length of array: ");
symbols=(input("Enter the symbol array (as space-separated values): "));
prob=(input("Enter the probability array (as space-separated values): "));
dict=shannonfanodict(symbols,prob);

disp("\nSymbol | Proability | Code");
disp("-------------------------------");
for i=1:n
 fprintf("%6d | %11.4f | %s\n", symbols(i), prob(i),num2str(dict{i}));
end
inputSig=[4 3 1 1 1 2 3 3 3];
code=shannonfanoenco(inputSig, dict);
decode=shannonfanodeco(code,dict);
disp("Input Signal: ");
disp(inputSig);
disp("Encoded Signal: ");
disp(code);
disp("Decoded Signal: ");
disp(decode);

len=[]
for i=1:n
  len=[len length(dict{i})];
endfor
disp(len);

H=0;
for i=1:n
  H=H+prob(i)*log2(1/prob(i));
endfor
disp("Entropy");
disp(H);

L=0;
for i=1:n
  L=L+(prob(i)*len(i));
endfor
disp("Average Length");
disp(L);

efficiency=(H/L)*100;
disp("Efficiency in % ");
disp(efficiency);

