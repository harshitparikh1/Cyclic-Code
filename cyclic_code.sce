clc;
clear all;
k= input('Enter the number of msg bits:');
n= input('Enter number of codeword bits:');
G= input('Enter the generator matrix from MSB to LSB:');
g = poly(G,'x','c')
disp("Generator Polynomial");
disp(g);
/// Encoding
s=n-k;
t=poly([zeros(1,(n-k)),s],'x','c');
t=t/s;
m=0:(2^k)-1;
disp("--------------------------------------------------");
for i=2:size(m,2)
    D(1:k,i)=strtod(strsplit(dec2bin(m(i),k)));
    d = poly(D(1:k,i),'x','c');
    disp('Message');
    disp(d);
    d1=[d*t];
    [r,q]=pdiv(d1,g);
    r=abs(r);
    disp(inv_coeff(pmodulo(coeff(r),2)));
    C=bitxor(coeff(d1),[coeff(r),zeros(1,length(coeff(d1))-length(coeff(r)))]);
    disp("Codeword");
    C=pmodulo(C,2);
    C1=[C,zeros(1,(n-length(C)))];
    C2=flipdim(C1,2,n-k);
    disp(C2);
    disp("--------------------------------------------------");
end
//Decoding 
disp("--------------------------------------------------");
for i=0:n-1
    E=[zeros(1,(n-i-1)),1,zeros(1,i)];     
    i=i+1;
    disp(E)
    E1=poly(E,'x','c');
    disp("E(x)=");
    disp(E1);
    [r,q]=pdiv(E1,g);
    S=abs(r);
    disp("S(x)=");
    disp(S);
    S1=coeff(S)
    S2=[S1,zeros(1,(n-k)-length(S1))];
    disp("The coeff is: ");
    disp(S2)
    disp("--------------------------------------------------");
end
R1=[1 0 1 0 1 0];
disp("The recieved codeword is");
disp(R1);
R2=poly(R1,'x','c');
disp("Its polynomial is: ");
disp(R2);
[r1,q]=pdiv(R2,g);
r3=abs(r1);
disp("Remainder = ");
disp(inv_coeff(pmodulo(coeff(r3),2)));
disp("Coeff of remainder = ");
R4=(coeff(pmodulo(coeff(r3),2)));
R5=[R4,zeros(1,(n-k)-length(R4))]
disp(R5);
for i=0:n-1
    E=[zeros(1,i),1,zeros(1,(n-i-1))];
    i=i+1;
    E1=poly(E,'x','c');
    [r,q]=pdiv(E1,g);
    S=abs(r);
    S1=coeff(S)
    S2=[S1,zeros(1,(n-k)-length(S1))];
    if(R5==S2)
        disp("Here is the error at i=");
        disp(i);
        b=i;      
end
end
R1(b)=~R1(b);
disp("The new Codeword is:");
disp(R1);
j=1:k;
disp("The message bits are : ")
disp(R1(j));

