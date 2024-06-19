module random_pulse_generator( input clk, ce, rst, output reg q);

parameter LN2_PERIOD = 4; 

parameter MASK = {LN2_PERIOD{1'b0}}; 
wire [31:0] uniform_random;
wire [LN2_PERIOD-1:0] sample;
pseudo_random pseudo_random_gen(clk, ce, rst, uniform_random);

assign sample = uniform_random[LN2_PERIOD-1:0];
always @ (posedge clk)
    if(ce) begin
        if (sample == MASK) q <= 1'b1;
        if (q) q <= 1'b0;
    end
endmodule
