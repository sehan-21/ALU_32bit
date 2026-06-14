module cla_16bit(
          input [15:0]a,b,
          input cin,
          output [15:0]sum,
          output cout
    );
    wire c1,c2,c3;
    cla_4bit m1(a[3:0],b[3:0],cin,sum[3:0],c1);
    cla_4bit m2(a[7:4],b[7:4],c1,sum[7:4],c2);
    cla_4bit m3(a[11:8],b[11:8],c2,sum[11:8],c3);
    cla_4bit m4(a[15:12],b[15:12],c3,sum[15:12],cout);
endmodule
