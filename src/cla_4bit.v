module cla_4bit(input [3:0]a,b,
                input cin, 
                output [3:0]sum,
                output cout );
                wire [3:0]g,p;
                wire c1,c2,c3;
                //Carry generate
                assign g[0]=a[0]&b[0];
                assign g[1]=a[1]&b[1];
                assign g[2]=a[2]&b[2];
                assign g[3]=a[3]&b[3];
                //Carry propagate 
                assign p[0]=a[0]^b[0];
                assign p[1]=a[1]^b[1];
                assign p[2]=a[2]^b[2];
                assign p[3]=a[3]^b[3];
                //Carry
                
                assign c1=g[0]|(p[0]&cin);
                assign c2=g[1]|(p[1]&c1);
                assign c3=g[2]|(p[2]&c2);
                assign cout=g[3]|(p[3]&c3);
                //Sum
                assign sum[0]=p[0]^cin;
                assign sum[1]=p[1]^c1;
                assign sum[2]=p[2]^c2;
                assign sum[3]=p[3]^c3;
                
                
                   
endmodule
