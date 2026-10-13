
`timescale 1ns/100ps

module alu_tb #(
    parameter WIDTH = 4
);

    reg  [WIDTH-1:0] A;
    reg  [WIDTH-1:0] B;
    reg  [1:0] sel;

    wire [WIDTH-1:0] Y;

    integer passed;
    integer failed;

    alu #(
        .WIDTH(WIDTH)
    ) dut (
        .A(A),
        .B(B),
        .sel(sel),
        .Y(Y)
    );

    // Compare actual output with expected output
    task check_result;
        input [WIDTH-1:0] expected;
        input [127:0] operation;

        begin
            #10;

            if (Y === expected) begin
                $display(
                    "PASS: %0s | A=%0d B=%0d Y=%0d",
                    operation, A, B, Y
                );
                passed = passed + 1;
            end
            else begin
                $display(
                    "FAIL: %0s | A=%0d B=%0d Expected=%0d Got=%0d",
                    operation, A, B, expected, Y
                );
                failed = failed + 1;
            end
        end
    endtask

    initial begin
        $dumpfile("tb_.vcd");
        $dumpvars(0, alu_tb);

        passed = 0;
        failed = 0;

        // Test 1: A=5, B=3
        A = 5; B = 3;

        sel = 2'b00;
        check_result(8, "ADD");

        sel = 2'b01;
        check_result(2, "SUB");

        sel = 2'b10;
        check_result(1, "AND");

        sel = 2'b11;
        check_result(7, "OR");

        // Test 2: A=15, B=1
        A = 15; B = 1;

        sel = 2'b00;
        check_result(0, "ADD overflow");

        sel = 2'b01;
        check_result(14, "SUB");

        sel = 2'b10;
        check_result(1, "AND");

        sel = 2'b11;
        check_result(15, "OR");

        // Test 3: A=1, B=15
        A = 1; B = 15;

        sel = 2'b00;
        check_result(0, "ADD overflow");

        sel = 2'b01;
        check_result(2, "SUB underflow");

        sel = 2'b10;
        check_result(1, "AND");

        sel = 2'b11;
        check_result(15, "OR");

        // Final summary
        $display("--------------------------------");
        $display("TOTAL:  %0d", passed + failed);
        $display("PASSED: %0d", passed);
        $display("FAILED: %0d", failed);
        $display("--------------------------------");

        if (failed == 0)
            $display("ALL TESTS PASSED");
        else
            $display("SOME TESTS FAILED");

        $finish;
    end

endmodule
