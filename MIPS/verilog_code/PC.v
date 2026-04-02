module Program_counter (
    input[31:0] Next_Add,
    input clk,rst,
    output reg [31:0] PC
);
    always @(posedge clk or posedge rst) begin
        if(rst)
            PC<=0;
        else 
            PC<=Next_Add;
    end
endmodule

module PC_adder (
    input[31:0] PC,
    output  [31:0] seq_PC
);
assign seq_PC = PC + 4;
endmodule

