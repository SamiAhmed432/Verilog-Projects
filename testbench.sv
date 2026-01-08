`timescale 1ns / 1ps

module tb_vending_machine;

  // Testbench signals
  reg clk;
  reg rst;
  reg [1:0] in;
  wire out;
  wire [1:0] change;

  // Instantiate DUT (Device Under Test)
  vending_machine_18105070 DUT (
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out),
    .change(change)
  );

  // Clock generation (10 ns period)
  always #5 clk = ~clk;

  initial begin
    // Initialize signals
    clk = 0;
    rst = 1;
    in  = 2'b00;

    // Apply reset
    #10 rst = 0;

    // ------------------------------
    // TEST CASE 1: Insert 5 Rs, then cancel
    // ------------------------------
    #10 in = 2'b01;  // insert 5 Rs
    #10 in = 2'b00;  // cancel → expect change = 5 Rs

    // ------------------------------
    // TEST CASE 2: Insert 10 Rs → product
    // ------------------------------
    #10 in = 2'b10;  // insert 10 Rs
    #10 in = 2'b00;

    // ------------------------------
    // TEST CASE 3: Insert 5 Rs + 5 Rs → product
    // ------------------------------
    #10 in = 2'b01;
    #10 in = 2'b01;

    // ------------------------------
    // TEST CASE 4: Insert 5 Rs + 10 Rs → product
    // ------------------------------
    #10 in = 2'b01;
    #10 in = 2'b10;

    // ------------------------------
    // TEST CASE 5: Insert 10 Rs + 10 Rs → product + 5 Rs change
    // ------------------------------
    #10 in = 2'b10;
    #10 in = 2'b10;

    // ------------------------------
    // End simulation
    // ------------------------------
    #20 $stop;
  end

endmodule
