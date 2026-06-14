`timescale 1ns / 1ps
module alu_32bit_tb;
       reg [31:0]a,b;
       reg cin;
       reg [3:0]op;
       reg [3:0]shift_amt;
       wire [31:0] result;
       wire zero_flag,carry_flag,overflow_flag,negative_flag;
       alu_32bit uut(.a(a),.b(b),.cin(cin),.op(op),.shift_amt(shift_amt),.result(result),.zero_flag(zero_flag),.carry_flag(carry_flag),.overflow_flag(overflow_flag),.negative_flag(negative_flag));
       initial begin
       //ADD 21+27=48
       a=32'd21;b=32'd27;cin=1'b0;op=4'b0000;shift_amt=0;#10;
       $display("ADD|result=%0d zero_flag=%b negative_flag=%b carry_flag=%b,overflow_flag=%b",result,zero_flag,negative_flag,carry_flag,overflow_flag);
       //SUB 10-3=7
       a=32'd10;b=32'd3;cin=1'b1;op=4'b0001;shift_amt=0;#10;
       $display("SUB|result=%0d zero_flag=%b negative_flag=%b carry_flag=%b,overflow_flag=%b",result,zero_flag,negative_flag,carry_flag,overflow_flag);
       //MULTIPLY 2*21=42
       a=32'd2;b=32'd21;op=4'b0010;shift_amt=0;#10;
       $display("MUL|result=%0d",result);
       //AND
       a=32'hff00ff00;b=32'h0f0f0f0f;op=4'b0011;shift_amt=0;#10;
       $display("AND|result=%h",result);
       //OR
       a=32'hf0f0f0f0;b=32'h0f0f0f0f;op=4'b0100;shift_amt=0;#10;
       $display("OR|result=%h",result);
       //XOR
       a=32'haaaaaaaa;b=32'haaaaaaaa;op=4'b0101;shift_amt=0;#10;
       $display("MUL|result=%h zero_flag=%b",result,zero_flag);
       //NOT
       a=32'h00000000;op=4'b0110;shift_amt=0;#10;
       $display("NOT|result=%b",result);
       //Logical Left Shift 1<<4=16
       a=32'd1;op=4'b0111;shift_amt=4'd4;#10;
       $display("SLL|result=%0d",result);
       //Logical Right shift 16>>4=1
       a=32'd16;op=4'b1000;shift_amt=4'd4;#10;
       $display("SRL|result=%0d",result);
       // Shift Right Arithmetic: -16 >>> 4 = -1
       a=32'hFFFFFFF0; op=4'b1001; shift_amt=4'd4; #10;
       $display("SRA|result=%h", result);
       // Set Less Than: 1 < 2
       a=32'd1; b=32'd2; op=4'b1010; shift_amt=0; #10;
       $display("SLT|result=%0d", result);
       //NAND 
       a=32'hffffffff; b=32'hffffffff; op=4'b1011; shift_amt=0; #10;
       $display("NAND|result=%h zero_flag=%b", result,zero_flag);
       //NOR
       a=32'h0000000; b=32'h0000000; op=4'b1100; shift_amt=0; #10;
       $display("NOR|result=%h", result);
       //XNOR
       a=32'haaaaaaa; b=32'haaaaaaa; op=4'b1101; shift_amt=0; #10;
       $display("XNOR|result=%h", result);
       //Rotate left
       a=32'h8000000;op=4'b1110; shift_amt=4'b1; #10;
       $display("ROL|result=%h", result);
       //Rotate Right
       a=32'h0000001;op=4'b1111; shift_amt=4'b1; #10;
       $display("ROR|result=%h", result);
       end
endmodule
