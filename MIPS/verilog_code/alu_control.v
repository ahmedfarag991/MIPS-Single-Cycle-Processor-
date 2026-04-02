module alu_control(input [1:0]AluOp,input [5:0]Func ,output reg [3:0]alu_control);
always@(*)begin

    if(AluOp==0) alu_control=4'b0010;//lw or sw
    else if(AluOp==1) alu_control=4'b0110;//beq
    
    else if (AluOp==2) begin

        case (Func)
        6'b100000 : alu_control=4'b0010;//add
        6'b100010 : alu_control=4'b0110;//sub
        6'b100100 : alu_control=4'b0000;//and
        6'b100101 : alu_control=4'b0001;//OR
        6'b101010 : alu_control=4'b0111;//slt
        6'b100111 : alu_control=4'b1100;//nor
        6'b000000 : alu_control=4'b1000;//sll
        6'b000010 : alu_control=4'b1001;//srl
        6'b000011 : alu_control=4'b1010;//sra
        default :  alu_control =4'bxxxx;
        endcase
    end
    else alu_control=4'bxxxx;
end
endmodule
