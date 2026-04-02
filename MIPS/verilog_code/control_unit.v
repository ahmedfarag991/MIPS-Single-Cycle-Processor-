module control_unit(input [5:0]opcode,output reg RegDst,Jump,Branch,MemRead,MemtoReg,MemWrite,RegWrite,AluSrc,
                        output reg[1:0]AluOp);

    always@(*)begin
        case(opcode)
        6'h00 : begin 
            AluOp=2;Jump=0;RegDst=1;Branch=0;MemRead=1'bX;MemtoReg=0;AluSrc=0;MemWrite=1'bX;RegWrite=1;
        end
        6'd35  : begin 
            AluOp=0;Jump=0;RegDst=0;Branch=0;MemRead=1;MemtoReg=1;AluSrc=1;MemWrite=0;RegWrite=1;
        end
        6'd43 : begin 
            AluOp=0;Jump=0;RegDst=0;Branch=0;MemRead=0;MemtoReg=1'bx;AluSrc=1;MemWrite=1;RegWrite=1'bx;
        end
        6'd4 : begin 
            AluOp=1;Jump=0;RegDst=0;Branch=1;MemRead=1'bX;MemtoReg=1'bx;AluSrc=0;MemWrite=1'bx;RegWrite=1'bx;
        end
        6'd2 : begin 
            AluOp=2'bx;Jump=1;RegDst=1'bx;Branch=0;MemRead=1'b0;MemtoReg=1'bx;AluSrc=1'bx;MemWrite=1'b0;RegWrite=1'b0;
        end
        default : begin
            AluOp=2'bx;Jump=1'bx;RegDst=1'bx;Branch=1'bx;MemRead=1'bx;MemtoReg=1'bx;AluSrc=1'bx;MemWrite=1'bx;RegWrite=1'bx;
        end
            
        endcase
    end
endmodule

