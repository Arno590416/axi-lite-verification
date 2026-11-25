`timescale 1ns/1ps
module hello;
reg clk = 0;
always #5 clk = ~clk;
initial begin
repeat (5) @(negedge clk);
$display("HELLO_PASS");
$finish;
end
endmodule