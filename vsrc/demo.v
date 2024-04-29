module demo(
        input clk,
        input rst,
        input wire a,
        output wire w
    );

    reg [2:0] buffer; //要检测的序列长度为3

    always @(posedge clk) begin
        if(rst) begin
            buffer <= 3'b0;
        end
        else begin
            buffer <= {buffer[1:0], a};
        end
    end

assign w = (buffer == 3'b101);

endmodule

