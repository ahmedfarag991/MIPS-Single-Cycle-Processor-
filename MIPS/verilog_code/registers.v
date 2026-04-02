module Register_File(
                    input [4:0] Read_Reg1,Read_Reg2,Write_Reg,
                    input clk,RegWrite,
                    input [31:0] Write_Data,
                    output [31:0]Read_Data1,Read_Data2);
    reg [31:0] reg_mem [0:31];
    
    assign Read_Data1=reg_mem[Read_Reg1];
    assign Read_Data2=reg_mem[Read_Reg2];

    always@(posedge clk)begin
        if (RegWrite==1 && Write_Reg!=0)            
            reg_mem[Write_Reg]<=Write_Data;
    end
endmodule
