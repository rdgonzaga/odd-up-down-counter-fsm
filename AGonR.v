// Rainer D. Gonzaga S08
`timescale 1ns / 1ps

module odd_up_down_counter (Y, reset, clock, count);

    input Y, reset, clock;
    output reg [3:0] count;

    initial begin
        $display("Rainer D. Gonzaga");
        $display("Behavioral odd up-down Binary counter using D Flip Flop");
    end

    always @(posedge clock, negedge reset) begin
        if (reset == 1'b0) begin
            count <= 4'b0001; 
        end else begin
            case (count)
                4'b0001: count <= (Y) ? 4'b0011 : 4'b1111;
                4'b0011: count <= (Y) ? 4'b0101 : 4'b0001;
                4'b0101: count <= (Y) ? 4'b0111 : 4'b0011;
                4'b0111: count <= (Y) ? 4'b1001 : 4'b0101;
                4'b1001: count <= (Y) ? 4'b1011 : 4'b0111;
                4'b1011: count <= (Y) ? 4'b1101 : 4'b1001;
                4'b1101: count <= (Y) ? 4'b1111 : 4'b1011;
                4'b1111: count <= (Y) ? 4'b0001 : 4'b1101;
                default: count <= 4'b0001;
            endcase
        end
    end

endmodule