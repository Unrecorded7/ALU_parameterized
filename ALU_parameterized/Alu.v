module alu #(
    parameter WIDTH = 4
)(
    input  [WIDTH-1:0] A,
    input  [WIDTH-1:0] B,
    input  [1:0] sel,

    output reg [WIDTH-1:0] Y
);
    
    reg [WIDTH-1:0] add,sub,_and,_or;
    always @(*) begin

    case (sel) 
        2'b00:Y=A+B;
        2'b01:Y=A-B;
        2'b10:Y=A&B;
        2'b11:Y=A|B;
        default: Y=1'b0;
    endcase
end

endmodule