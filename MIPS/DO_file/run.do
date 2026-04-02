vlib work
vlog *.v
vsim -voptargs=+acc work.mips_tb
add wave *
add wave -position insertpoint  \
sim:/mips_tb/DUT/PC \
sim:/mips_tb/DUT/Next_PC \
sim:/mips_tb/DUT/instruction \
sim:/mips_tb/DUT/Branch_address \
sim:/mips_tb/DUT/seq_PC \
sim:/mips_tb/DUT/PC_or_Branch_add \
sim:/mips_tb/DUT/write_back \
sim:/mips_tb/DUT/opcode \
sim:/mips_tb/DUT/func \
sim:/mips_tb/DUT/rs \
sim:/mips_tb/DUT/rt \
sim:/mips_tb/DUT/rd \
sim:/mips_tb/DUT/write_reg_sel \
sim:/mips_tb/DUT/offset \
sim:/mips_tb/DUT/address \
sim:/mips_tb/DUT/Read_data1 \
sim:/mips_tb/DUT/Read_data2 \
sim:/mips_tb/DUT/sign_extended_out \
sim:/mips_tb/DUT/alu_result \
sim:/mips_tb/DUT/jump_address \
sim:/mips_tb/DUT/Read_Data_mem \
sim:/mips_tb/DUT/Byte_adressable_offset \
sim:/mips_tb/DUT/alu_op2 \
sim:/mips_tb/DUT/zero \
sim:/mips_tb/DUT/Branch_check \
sim:/mips_tb/DUT/alu_control \
sim:/mips_tb/DUT/shamt
add wave -position insertpoint  \
sim:/mips_tb/DUT/instruction_memory/mem \
sim:/mips_tb/DUT/Reg_file/reg_mem \
sim:/mips_tb/DUT/Data_memory/Mem 
run -all
#quit -sim