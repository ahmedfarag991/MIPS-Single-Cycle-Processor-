module top(input clk,rst);
wire [31:0] PC,Next_PC,instruction,Branch_address,seq_PC,PC_or_Branch_add,write_back;
wire [5:0] opcode,func;
wire [4:0] rs,rt,rd,write_reg_sel,shamt;
wire [15:0] offset;
wire [25:0] address;
wire [31:0] Read_data1,Read_data2,sign_extended_out,alu_result,jump_address,Read_Data_mem,Byte_adressable_offset,alu_op2;
wire [1:0]AluOP ;
wire RegDst,Jump,Branch,MemRead,MemtoReg,MemWrite,RegWrite,AluSrc,zero,Branch_check;
wire [3:0]alu_control;

Program_counter PC1(.Next_Add(Next_PC),.clk(clk),.rst(rst),.PC(PC));

PC_adder PC_add(.PC(PC),.seq_PC(seq_PC));

Instruction_Mem instruction_memory(.Address(PC),.instruction(instruction));

assign opcode=instruction [31:26]; //opcode
assign rs=instruction [25:21];   //rs
assign rt=instruction [20:16];   //rt
assign rd=instruction [15:11];    //rd
assign offset=instruction[15:0];   //offset for lw/sw
assign address=instruction[25:0];   // hump address
assign shamt=instruction[10:6];      // shift amount
assign func = instruction[5:0];      //function


control_unit CU(opcode,RegDst,Jump,Branch,MemRead,MemtoReg,MemWrite,RegWrite,AluSrc,AluOP);
alu_control AC(AluOP,func,alu_control);


assign jump_address = {seq_PC[31:28],address,2'b00};

Sign_extend sign_ext(.in(offset),.extended_out(sign_extended_out));

assign write_reg_sel=(RegDst)?rd:rt;

Register_File Reg_file(.clk(clk),.Read_Reg1(rs),.Read_Reg2(rt),.Write_Reg(write_reg_sel),.RegWrite(RegWrite),.Write_Data(write_back),
                        .Read_Data1(Read_data1),.Read_Data2(Read_data2));

shift_left shiftl2(.in(sign_extended_out),.shift_out(Byte_adressable_offset));

Adder Branch_add(.A(seq_PC),.B(Byte_adressable_offset),.C(Branch_address));

mux op2_sel(.in0(Read_data2),.in1(sign_extended_out),.sel(AluSrc),.mux_out(alu_op2));
alu ALU (.op1(Read_data1),.op2(alu_op2),.alu_control(alu_control),.shamt(shamt),.zero(zero),.alu_result(alu_result));

assign Branch_check=Branch&zero;

Data_Mem Data_memory(.Adderss(alu_result),.Write_Data(Read_data2),.clk(clk),.MemWrite(MemWrite),.MemRead(MemRead),.Read_data(Read_Data_mem));

mux write_data_sel(.in0(alu_result),.in1(Read_Data_mem),.sel(MemtoReg),.mux_out(write_back));
mux PC_Branch_sel(.in0(seq_PC),.in1(Branch_address),.sel(Branch_check),.mux_out(PC_or_Branch_add));
mux Next_add_sel(.in0(PC_or_Branch_add),.in1(jump_address),.sel(Jump),.mux_out(Next_PC));


endmodule



