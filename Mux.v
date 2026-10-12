module  top (
    input a,
    input b,
    input sel,
    output c
);
    assign c=sel?a:b;
    
endmodule