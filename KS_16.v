`timescale 1ns / 1ps


module stage00(P,G,a,b);
input[15:0] a,b;
output[15:0] P,G;
assign P[0]=a[0]^b[0], P[1]=a[1]^b[1], P[2]=a[2]^b[2], P[3]=a[3]^b[3], P[4]=a[4]^b[4], P[5]=a[5]^b[5], P[6]=a[6]^b[6], P[7]=a[7]^b[7], P[8]=a[8]^b[8], P[9]=a[9]^b[9], 
       P[10]=a[10]^b[10], P[11]=a[11]^b[11], P[12]=a[12]^b[12], P[13]=a[13]^b[13], P[14]=a[14]^b[14], P[15]=a[15]^b[15],
       
       G[0]=a[0]&b[0], G[1]=a[1]&b[1], G[2]=a[2]&b[2], G[3]=a[3]&b[3], G[4]=a[4]&b[4], G[5]=a[5]&b[5], G[6]=a[6]&b[6], G[7]=a[7]&b[7], G[8]=a[8]^b[8], G[9]=a[9]^b[9], 
       G[10]=a[10]^b[10], G[11]=a[11]^b[11], G[12]=a[12]^b[12], G[13]=a[13]^b[13], G[14]=a[14]^b[14], G[15]=a[15]^b[15];
endmodule


module stage01(ip,ig,P,G);
input[15:0] P,G;
output[14:0] ip,ig;
assign ip[0]=P[0]&P[1], ip[1]=P[2]&P[1], ip[2]=P[2]&P[3], ip[3]=P[4]&P[3], ip[4]=P[4]&P[5], ip[5]=P[5]&P[6], ip[6]=P[6]&P[7], ip[7]=P[7]&P[8], ip[8]=P[8]&P[9], 
       ip[9]=P[9]&P[10], ip[10]=P[10]&P[11], ip[11]=P[11]&P[12], ip[12]=P[12]&P[13], ip[13]=P[13]&P[14], ip[14]=P[14]&P[15],
       
       ig[0]=G[1]|(G[0]&P[1]), ig[1]=G[2]|(G[1]&P[2]), ig[2]=G[3]|(G[2]&P[3]), ig[3]=G[4]|(G[3]&P[4]), ig[4]=G[5]|(G[4]&P[5]), ig[5]=G[6]|(G[5]&P[6]), 
       ig[6]=G[7]|(G[6]&P[7]), ig[7]=G[8]|(G[7]&P[8]), ig[8]=G[9]|(G[8]&P[9]), ig[9]=G[10]|(G[9]&P[10]), ig[10]=G[11]|(G[10]&P[11]), ig[11]=G[12]|(G[11]&P[12]), 
       ig[12]=G[13]|(G[12]&P[13]), ig[13]=G[14]|(G[13]&P[14]), ig[14]=G[15]|(G[14]&P[15]);
endmodule


module stage02(ip,ig,p,g,p0,g0);
input[14:0] p,g;
input p0,g0;
output[13:0] ip,ig;
assign ip[0]=p0&p[1], ip[1]=p[0]&p[2], ip[2]=p[1]&p[3], ip[3]=p[2]&p[4], ip[4]=p[3]&p[5], ip[5]=p[4]&p[6], ip[6]=p[5]&p[7], ip[7]=p[6]&p[8], ip[8]=p[7]&p[9], 
       ip[9]=p[8]&p[10], ip[10]=p[9]&p[11], ip[11]=p[10]&p[12], ip[12]=p[11]&p[13], ip[13]=p[12]&p[14],
       
       ig[0]=g[1]|(g0&p[1]), ig[1]=g[2]|(g[0]&p[2]), ig[2]=g[3]|(g[1]&p[3]), ig[3]=g[4]|(g[2]&p[4]), ig[4]=g[5]|(g[3]&p[5]), ig[5]=g[6]|(g[4]&p[6]), 
       ig[6]=g[7]|(g[5]&p[7]), ig[7]=g[8]|(g[6]&p[8]), ig[8]=g[9]|(g[7]&p[9]), ig[9]=g[10]|(g[8]&p[10]), ig[10]=g[11]|(g[9]&p[11]), ig[11]=g[12]|(g[10]&p[12]), 
       ig[12]=g[13]|(g[11]&p[13]), ig[13]=g[14]|(g[12]&p[14]);
endmodule


module stage03(ip,ig,p,g,p0,g0,p1,g1);
input[13:0] p,g;
input p0,g0,p1,g1;
output[11:0] ip,ig;
assign ip[0]=p0&p[2], ip[1]=p1&p[3], ip[2]=p[0]&p[4], ip[3]=p[1]&p[5], ip[4]=p[2]&p[6], ip[5]=p[3]&p[7], ip[6]=p[4]&p[8], ip[7]=p[5]&p[9], ip[8]=p[6]&p[10], 
       ip[9]=p[7]&p[11], ip[10]=p[8]&p[12], ip[11]=p[9]&p[13],
        
       ig[0]=g[2]|(g0&p[2]), ig[1]=g[3]|(g1&p[3]), ig[2]=g[4]|(g[0]&p[4]), ig[3]=g[5]|(g[1]&p[5]), ig[4]=g[6]|(g[2]&p[6]), ig[5]=g[7]|(g[3]&p[7]), 
       ig[6]=g[8]|(g[4]&p[8]), ig[7]=g[9]|(g[5]&p[9]), ig[8]=g[10]|(g[6]&p[10]), ig[9]=g[11]|(g[7]&p[11]), ig[10]=g[12]|(g[8]&p[12]), ig[11]=g[13]|(g[9]&p[13]);
endmodule


module stage04(ip,ig,p,g,p0,g0,p1,g1,p2,g2,p3,g3);
input[11:0] p,g;
input p0,g0,p1,g1,p2,g2,p3,g3;
output[7:0] ip,ig;
assign ip[0]=p0&p[4], ip[1]=p1&p[5], ip[2]=p2&p[6], ip[3]=p3&p[7], ip[4]=p[4]&p[8], ip[5]=p[5]&p[9], ip[6]=p[6]&p[10], ip[7]=p[7]&p[11],
 
       ig[0]=g[4]|(g0&p[4]), ig[1]=g[5]|(g1&p[5]), ig[2]=g[6]|(g2&p[6]), ig[3]=g[7]|(g3&p[7]), ig[4]=g[8]|(g[4]&p[8]), ig[5]=g[9]|(g[5]&p[9]), 
       ig[6]=g[10]|(g[6]&p[10]), ig[7]=g[11]|(g[7]&p[11]);
endmodule

module carryGen(C,cout,cin,ip,ig,p0,g0);
input[48:0] ip,ig;
input cin,p0,g0;
output[14:0] C; output cout;
assign C[0]=g0|(p0&cin), C[1]=ig[0]|(ip[0]&cin), C[2]=ig[15]|(ip[15]&cin), C[3]=ig[16]|(ip[16]&cin), C[4]=ig[29]|(ip[29]&cin), C[5]=ig[30]|(ip[30]&cin), 
       C[6]=ig[31]|(ip[31]&cin),C[7]=ig[32]|(ip[32]&cin), C[8]=ig[41]|(ip[41]&cin), C[9]=ig[42]|(ip[42]&cin),C[10]=ig[43]|(ip[43]&cin), C[11]=ig[44]|(ip[44]&cin), 
       C[12]=ig[45]|(ip[45]&cin), C[13]=ig[46]|(ip[46]&cin), C[14]=ig[47]|(ip[47]&cin), 
       cout=ig[48]|(ip[48]&cin);
endmodule


module sumGen(s,C,cin,P);
input[14:0] C; input cin; input[7:0] P;
output[15:0] s;
assign s[0]=P[0]^cin, s[1]=P[1]^C[0], s[2]=P[2]^C[1], s[3]=P[3]^C[2],
       s[4]=P[4]^C[3], s[5]=P[5]^C[4], s[6]=P[6]^C[5], s[7]=P[7]^C[6],
       s[8]=P[8]^C[7], s[9]=P[9]^C[8], s[10]=P[10]^C[9], s[11]=P[11]^C[10],
       s[12]=P[12]^C[11], s[13]=P[13]^C[12], s[14]=P[14]^C[13], s[15]=P[15]^C[14];
endmodule


module KS16(a,b,cin,s,cout);
input[15:0] a,b;
input cin;
output[15:0] s,cout;
wire[15:0] P,G;
wire[14:0] C; wire[48:0] ip,ig;

stage00 s0(P,G,a,b);
stage01 s1(ip[14:0],ig[14:0],P[15:0],G[15:0]);
stage02 s2(ip[28:15],ig[28:15],ip[14:0],ig[14:0],P[0],G[0]);
stage03 s3(ip[40:29],ig[40:29],ip[28:15],ig[28:15],P[0],G[0],P[1],G[1]);
stage04 s4(ip[48:41],ig[48:41],ip[40:29],ig[40:29],P[0],G[0],P[1],G[1],P[2],G[2],P[3],G[3]);
carryGen c4(C,cout,cin,ip,ig,P[0],G[0]);
sumGen s5(s,C,cin,P);
endmodule

module tbKS;
wire[15:0] s; wire cout;
reg[15:0] a,b; reg cin;
KS16 BK(a,b,cin,s,cout);
initial 
begin 
    a<=16'h00A5; b<=16'h00A0; cin<=1'b0;
    
    #20    a<=16'h09A5; b<=16'h00B0; cin<=1'b0;
    
    #20    a<=16'h0AA3; b<=16'h10A0; cin<=1'b0;
    
    #20    a<=16'hC0A5; b<=16'h0BA0; cin<=1'b0;

    #20 $finish;
end
endmodule