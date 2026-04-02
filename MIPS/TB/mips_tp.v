module mips_tb;
reg clk,rst;
initial begin
    clk=0;
    forever begin
        #1; clk=~clk;
    end
end

top DUT(clk,rst);
integer i;
initial begin
    for(i=0;i<1024;i=i+1)begin
        DUT.instruction_memory.mem[i]=0;
    end

    for(i=0;i<32;i=i+1)begin
        DUT.Reg_file.reg_mem[i]=0;
    end

    for(i=0;i<32;i=i+1)begin
        DUT.Data_memory.Mem[i]=0;
    end

    DUT.Reg_file.reg_mem[8]=32'd9;
    DUT.Reg_file.reg_mem[16]=32'd31;

    DUT.instruction_memory.mem[0]=32'b000000_10000_01000_01001_00000_100000;  // add $t1,$s0,$t0
    DUT.instruction_memory.mem[1]=32'b000000_10000_01000_01010_00000_100010;  // sub $t2,$s0,$t0
    DUT.instruction_memory.mem[2]=32'b000000_10000_01000_01011_00000_100100;  // and $t3,$s0,$t0
    DUT.instruction_memory.mem[3]=32'b000000_10000_01000_01100_00000_100101;  // or  $t4,$s0,$t0
    DUT.instruction_memory.mem[4]=32'b000000_01000_10000_01101_00000_101010;  // slt $t5,$t0,$s0
    DUT.instruction_memory.mem[5]=32'b000000_10000_01000_01110_00000_100111;  // nor $t6,$s0,$t0
    DUT.instruction_memory.mem[6]=32'b000000_00000_01000_01111_00010_000000;  // sll $t7,$t0,2
    DUT.instruction_memory.mem[7]=32'b000000_00000_10000_10001_00001_000010;  // srl $s1,$s0,1
    DUT.instruction_memory.mem[8]=32'b000000_00000_10000_10010_00001_000011;  // sra $s2,$s0,1
    DUT.instruction_memory.mem[9]=32'b101011_00000_01001_0000000000000000;        // sw  $t1,0($zero)
    DUT.instruction_memory.mem[10]=32'b100011_00000_00010_0000000000000000;       // lw  $v0,0($zero)
    DUT.instruction_memory.mem[11]=32'b000100_01001_00010_0000000000000001;       // beq $t1,$t2, +1
    DUT.instruction_memory.mem[12]=32'b000000_01000_01000_01000_00000_100000;     // add $t0,$t0,$t0
    DUT.instruction_memory.mem[13]=32'b000010_00000000000000000000000000;        // j   0
end

initial begin
    rst=1;
    @(negedge clk);
    rst=0;
    repeat(16)@(negedge clk);
    $stop;
end
endmodule


