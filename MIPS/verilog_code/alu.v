module alu(input [31:0]op1,op2,input [3:0] alu_control,input [4:0]shamt,
            output zero,output reg [31:0]alu_result);

always@(*)begin
    case(alu_control)
    4'b0000 : alu_result=op1 & op2;
    4'b0001 : alu_result=op1 | op2;
    4'b0010 : alu_result=op1 + op2;
    4'b0110 : alu_result=op1 - op2;
    4'b0111 : alu_result=(op1<op2);
    4'b1100 : alu_result=~(op1 | op2);
    4'b1000 : alu_result=op2<<shamt;
    4'b1001 : alu_result=op2>>shamt;
    4'b1010 : alu_result=op2>>>shamt;
    default : alu_result=32'bXX;
    endcase
end
assign zero=((op1==op2) & alu_control==4'b0110)?1:0;
endmodule

