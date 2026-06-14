module alu_32bit(
       input [31:0]a,b,
       input cin,
       input [3:0]op,
       input[3:0]shift_amt,
       output reg [31:0]result,
       output zero_flag,
       output carry_flag,
       output overflow_flag,
       output negative_flag
    );
    wire [31:0]add_result,sub_result,mul_result;
    wire add_cout,sub_cout,add_overflow_flag,sub_overflow_flag;
    add_sub adder(a[31:0],b[31:0],1'b0,add_result[31:0],add_cout,add_overflow_flag);
    add_sub subtractor(a[31:0],b[31:0],1'b1,sub_result[31:0],sub_cout,sub_overflow_flag);
    multiplier_32bit multiply(a[31:0],b[31:0],mul_result[31:0]);
    reg c_reg,o_reg;
    always @(*)begin
       c_reg=1'b0;
       o_reg=1'b0;
       case(op)
         4'b0000:begin
         result=add_result;
         c_reg=add_cout;
         o_reg=add_overflow_flag;
         end
         4'b0001:begin
         result=sub_result;
         c_reg=sub_cout;
         o_reg=sub_overflow_flag;
         end
         4'b0010:
         result=mul_result;
         4'b0011:result=a&b;
         4'b0100:result=a|b;
         4'b0101:result=a^b;
         4'b0110:result=~a;
         4'b0111:result=a<<shift_amt;
         4'b1000:result=a>>shift_amt;
         4'b1001:result=$signed(a)>>>shift_amt;
         4'b1010:result=($signed(a)<$signed(b))?32'b1:32'b0;
         4'b1011:result=~(a&b);
         4'b1100:result=~(a|b);
         4'b1101:result=~(a^b);
         4'b1110:result=(a<<shift_amt)|(a>>(32-shift_amt));
         4'b1111:result=(a>>shift_amt)|(a<<(32-shift_amt));
         default:result=32'b0;
        endcase
       end 
       assign zero_flag=(result==32'd0);  
       assign negative_flag=result[31];
       assign carry_flag=c_reg;
       assign overflow_flag=o_reg;        
endmodule
