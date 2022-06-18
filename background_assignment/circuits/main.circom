// Specifying compiler version for the .circom file 
pragma circom 2.0.3;

// Defining a template to multiply two input signals
template Multiplier2() {
   // Declaring input signals
   signal input in1;
   signal input in2;
   // Declaring output signal
   signal output out;
   // Assigning out to be the product of input signals in1 and in2 
   out <== in1 * in2;
   // Printing the output signal
   log(out);
}

// Initializing a 'Multiplier2()' component 'main' while defining the input signals in1 and in2 to be public
component main {public [in1,in2]} = Multiplier2();

/* INPUT = {
    "in1": "2",
    "in2": "9"
} */
