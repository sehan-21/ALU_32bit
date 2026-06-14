
module cla_32bit(
         input [31:0]a,b,
         input cin,
         output [31:0]sum,
         output cout
    );
    wire c1;
    cla_16bit m1(a[15:0],b[15:0],cin,sum[15:0],c1);
    cla_16bit m2(a[31:16],b[31:16],c1,sum[31:16],cout);
endmodule
