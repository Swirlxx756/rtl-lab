`timescale 1ns/1ps
// 自检 testbench：每个向量写清楚期望值，最后统一打印 PASS / FAIL
module tb;
    reg  a, b;
    wire y;
    integer errors = 0;
    integer total  = 0;

    top_module dut (.a(a), .b(b), .y(y));

    // 时序题用：取消注释，并把时钟/复位接到 dut
    // reg clk = 0;  always #5 clk = ~clk;

    task check(input exp_y);
        begin
            total = total + 1;
            if (y !== exp_y) begin
                errors = errors + 1;
                $display("[FAIL] t=%0t a=%b b=%b | y=%b 期望=%b", $time, a, b, y, exp_y);
            end
        end
    endtask

    integer i;
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        // 穷举 / 随机激励：期望值由你自己按题意算，不要抄 DUT
        for (i = 0; i < 4; i = i + 1) begin
            {a, b} = i[1:0];
            #10 check(a & b);
        end

        if (errors == 0) $display("PASS  (%0d/%0d)", total, total);
        else             $display("FAIL  (%0d errors / %0d checks)", errors, total);
        $finish;
    end
endmodule
