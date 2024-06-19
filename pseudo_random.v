module pseudo_random(input  clk, ce, rst, output reg [31:0] q);
// 32-bit uniform pseudo-random number generator, based on fibonacci LFSR

wire feedback = q[31]^q[29]^q[28]^ q[27]^ q[23]^q[20]^ q[19]^q[17]^ q[15]^q[14]^q[12]^ q[11]^q[9]^ q[4]^ q[3]^q[2];


always @(posedge clk or posedge rst)
  if (rst) 
    q <= 32'haaaaaaaa;   // the start is more random with this initialization
  else if (ce)
    q <= {q[30:0], feedback} ;
endmodule
