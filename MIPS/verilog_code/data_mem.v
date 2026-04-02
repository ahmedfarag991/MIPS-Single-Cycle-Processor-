module Data_Mem(input [31:0] Adderss,Write_Data,input MemWrite,MemRead,clk,output [31:0] Read_data);
   
    reg [31:0] Mem [0:255];
    assign Read_data=(MemRead)?Mem[Adderss>>2]:1'b0;
   
    always @(posedge clk) begin
        if(MemWrite) Mem[Adderss>>2]<=Write_Data;
    end
endmodule
