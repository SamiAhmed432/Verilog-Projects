// Testbench for Vending machine

module vending_machine_tb; // tb for testbench
  
  //inputs
  reg clk;   //clock used as inputs
  reg[1:0]in;
  reg rst;  
  
  //outputs
  wire out;
  wire[1:0]change;
  
  vending_machine_18105070 uut(
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out),
    .change(change)
  );
  
  initial begin
    //initialise inputs
    $dumpfile("vending_machine_18105070.vcd");
    $dumpvars(0,vending_machine_tb);
    rst = 1;
    clk = 0;
    
    #6 rst = 0;  //delay clock reset time 6 ns
    in = 2;
    #19 in = 2;
    #25 $finish; //finish for waveforms
    
  end
  always#5 clk = ~clk;
  
endmodule
