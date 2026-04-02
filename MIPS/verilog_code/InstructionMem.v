module Instruction_Mem (input [31:0] Address,output [31:0] instruction);
    reg [31:0] mem [0:1023];
    assign instruction = mem[Address>>2];
endmodule

module mux(input [31:0] in0,in1,input sel,output [31:0]mux_out);
    assign mux_out=(sel)?in1:in0;
endmodule

module shift_left(input [31:0] in,output[31:0] shift_out);
    assign shift_out=in<<2;
endmodule

module Sign_extend (input [15:0]in,output [31:0] extended_out);
    assign extended_out={{16{in[15]}},in};
endmodule

module Adder(input [31:0]A,[31:0]B,output [31:0]C);
    assign C=A+B;
endmodule
