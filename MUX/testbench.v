`timescale 1ns/100ps
module test ;

reg a;
reg b;
reg sel;

wire c;

top t1 (
    .a(a),
    .b(b),
    .c(c),
    .sel(sel)
    );

    initial begin
         $dumpfile("wave.vcd");
        $dumpvars(0, test);
 
        sel=1'b0;
        a=1'b0;
        b=1'b0;
        #10
        sel=1'b0;
        a=1'b1;
        b=1'b0;
        #10
        sel=1'b0;
        a=1'b1;
        b=1'b1;
        #10
        sel=1'b1;
        a=1'b0;
        b=1'b0;
        #10
        sel=1'b1;
        a=1'b1;
        b=1'b0;
        #10
        sel=1'b1;
        a=1'b0;
        b=1'b1;
        #10
        sel=1'b1;
        a=1'b1;
        b=1'b1;
        #10
        $finish;

    end
endmodule