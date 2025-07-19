`timescale 1ps / 1ps

module tb;

    reg clk = 0;
    reg rst = 1;

    reg  [15:0] a_tb = 16'b0;
    reg  [15:0] b_tb = 16'b0;
    reg         cin_tb = 1'b0;
    wire        cout_tb;
    wire [15:0] s_tb;

    always #650 clk = ~clk; 

    CarrySkipReg uut (
        .clk(clk),
        .rst(rst),
        .A(a_tb),
        .B(b_tb),
        .Cin(cin_tb),
        .Cout(cout_tb),
        .Outp(s_tb)
    );

    initial begin
        $sdf_annotate("CarrySkipReg_m.sdf", uut, , "sdf.log", "MAXIMUM");
    end

    initial begin
        #10 rst = 1;
        #20 rst = 0;

        @(posedge clk);
        a_tb = 16'h0000; b_tb = 16'h0000; cin_tb = 1'b0;
        @(posedge clk);
        a_tb = 16'h00FF; b_tb = 16'h0001; cin_tb = 1'b0;
        @(posedge clk);
        a_tb = 16'h1234; b_tb = 16'h4321; cin_tb = 1'b1;
        @(posedge clk);
        a_tb = 16'hFFFF; b_tb = 16'h0001; cin_tb = 1'b1;
        @(posedge clk);
        a_tb = 16'hABCD; b_tb = 16'h1234; cin_tb = 1'b0;

        #5500 $stop;
    end

endmodule
