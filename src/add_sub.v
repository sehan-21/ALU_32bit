module add_sub(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum,
    output cout,
    output v_flag
);
   
    wire c1;
    wire [31:0]bin;
    assign bin=b^{32{sub}};
    cla_32bit m1(a[31:0],bin[31:0],sub,sum[31:0],cout);
    assign v_flag=((a[31]==b[31])&&(sum[31]!=a[31]));
endmodule
