`timescale 1ns/1ns

module demo_tb();


    reg clk;
    reg rst;
    reg input_;
    wire output_;

    demo demo_dut(
            .clk(clk),
            .rst(rst),
            .a(input_),
            .w(output_)
        );

     //生成波形文件
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, demo_tb);
    end


    //生成时钟
    initial begin
        #5
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    //生成输入测试信号
    initial begin
        forever #10 input_ = $random % 2;
    end

    //生成复位信号和设置仿真时长
    initial begin
        rst = 1;  //使能复位
        #15  rst = 0;
        #200 $stop;   //停止仿真
    end



endmodule
