# Cyclic-Code
Cyclic code is a block code, where the circular shifts of each codeword gives another word that belongs to the code. They are error-correcting codes that have algebraic properties that are convenient for efficient error detection and correction.
So here we have designed a cyclic code using Scilab.
IT WORKS BEST FOR (n,k) = (3,6).


Let's try to understand the algorithm through some steps listed down below:-

Step1:-Enter the message bits of length(k) and codeword length(n).
Step2:-Create a generator polynomial matrix g(x).
Step3:-You will then get all 8 possibilities for message bits as information message.
Step4:-You will see all message polynomials.
Step5:-To generate codeword polynomial we multiply message polynomial to x^(n-k).
Step6:-Divide the above product by the generator matrix g(x).
Step7:-Convert the remainder polynomial r(x) to binary to get parity check matrix polynomial.
Step8:-Add the remainder polynomial to the shifted polynomial to get the codeword polynomial c(x).
Step9:-In case the coefficients of the c(x) turns out to be negative it has to be removed
       since the coefficients cannot be negative.
Step10:-For generation of n bit codeword from the coefficient of the codeword polynomial.
Step11:- Display the generated codeword.
Step12:- For Decoding, we first enter the E(x) matrix starting from x^(n-k) to x^0.
Step13:- We then calculate S(x) by dividing g(x) from E(x) and the convert the value into binary.
Step14: Then from the first k message bits we then determine the error and correct it and display the final message.
