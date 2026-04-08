// Rainer D. Gonzaga S08
`timescale 1ns / 1ps

module odd_up_down_counter_tb;
    reg Y;
    reg reset;
    reg clock;
    wire [3:0] count;

    odd_up_down_counter uut(Y, reset, clock, count);

    initial
    begin
        clock = 1'b0;
        forever #5 clock = ~clock;
    end

    initial
    begin
        reset = 1'b0;
        #10 reset = 1'b1;
    end

    initial
    begin
        Y = 1'b0;
        #90 Y = 1'b1;
    end

    initial
    begin
        $display("---------------------------------------------------------------------------------");
        $display("Rainer D. Gonzaga - S08,  Behavioral odd up-down Binary counter using D Flip Flop");
        $display("---------------------------------------------------------------------------------");
        $monitor("time = %3d | clock = %b | reset = %b | Y = %b | count = %b", $time, clock, reset, Y, count);
        $dumpfile("AGonR.vcd");
        $dumpvars(0, odd_up_down_counter_tb);
    end

    initial #170 $finish;
endmodule