`timescale 1ns / 1ps

module stage0(P,G,a,b);
input[15:0] a, b;
output[15:0] P, G;
assign P[0]=a[0]^b[0], P[1]=a[1]^b[1], P[2]=a[2]^b[2], P[3]=a[3]^b[3], P[4]=a[4]^b[4], P[5]=a[5]^b[5], P[6]=a[6]^b[6], P[7]=a[7]^b[7], P[8]=a[8]^b[8], P[9]=a[9]^b[9], P[10]=a[10]^b[10], P[11]=a[11]^b[11], P[12]=a[12]^b[12], P[13]=a[13]^b[13], P[14]=a[14]^b[14], P[15]=a[15]^b[15],
       G[0]=a[0]&b[0], G[1]=a[1]&b[1], G[2]=a[2]&b[2], G[3]=a[3]&b[3], G[4]=a[4]&b[4], G[5]=a[5]&b[5], G[6]=a[6]&b[6], G[7]=a[7]&b[7], G[8]=a[8]&b[8], G[9]=a[9]&b[9], G[10]=a[10]&b[10], G[11]=a[11]&b[11], G[12]=a[12]&b[12], G[13]=a[13]&b[13], G[14]=a[14]&b[14], G[15]=a[15]&b[15];     
endmodule


module stage1(ip,ig,p,g);
input[15:0] p,g;
output[7:0] ip,ig;
assign ip[0]=p[0]&p[1], ip[1]=p[2]&p[3], ip[2]=p[4]&p[5], ip[3]=p[6]&p[7], ip[4]=p[8]&p[9], ip[5]=p[10]&p[11], ip[6]=p[12]&p[13], ip[7]=p[14]&p[15],
       ig[0]=g[1]|(g[0]&p[1]), ig[1]=g[3]|(g[2]&p[3]), ig[2]=g[5]|(g[4]&p[5]), ig[3]=g[7]|(g[6]&p[7]), ig[4]=g[9]|(g[8]&p[9]), ig[5]=g[11]|(g[10]&p[11]), ig[6]=g[13]|(g[12]&p[13]), ig[7]=g[15]|(g[14]&p[15]);
endmodule


module stage2(ip,ig,p,g);
input[7:0] p,g;
output[6:0] ip,ig;
assign ip[0]=p[0]&p[1], ip[1]=p[1]&p[2], ip[2]=p[2]&p[3], ip[3]=p[3]&p[4], ip[4]=p[4]&p[5], ip[5]=p[5]&p[6], ip[6]=p[6]&p[7],
       ig[0]=g[1]|(g[0]&p[1]), ig[1]=g[2]|(g[1]&p[2]), ig[2]=g[3]|(g[2]&p[3]), ig[3]=g[4]|(g[3]&p[4]), ig[4]=g[5]|(g[4]&p[5]), ig[5]=g[6]|(g[5]&p[6]), ig[6]=g[7]|(g[6]&p[7]);
endmodule

module stage3(ip,ig,p,g,ip0,ig0);
input[6:0] p,g;
input ip0,ig0;
output[5:0] ip,ig;
assign ip[0]=ip0&p[1], ip[1]=p[0]&p[2], ip[2]=p[1]&p[3], ip[3]=p[2]&p[4], ip[4]=p[3]&p[5], ip[5]=p[4]&p[6],
       ig[0]=g[1]|(ig0&p[1]), ig[1]=g[2]|(g[0]&p[2]), ig[2]=g[3]|(g[1]&p[3]), ig[3]=g[4]|(g[2]&p[4]), ig[4]=g[5]|(g[3]&p[5]), ig[5]=g[6]|(g[4]&p[6]);
endmodule   

module stage4(ip,ig,p,g,P2,G2,P4,G4,P6,G6,P8,G8,P10,G10,P12,G12,P14,G14,ip0,ig0,ip8,ig8);
input[5:0] p,g;
input P2,G2,P4,G4,P6,G6,P8,G8,P10,G10,P12,G12,P14,G14,ip0,ig0,ip8,ig8;
output[6:0] ip,ig;          
assign ip[0]=ip0&P2, ip[1]=ip8&P4, ip[2]=p[0]&P6, ip[3]=p[1]&P8, ip[4]=p[2]&P10, ip[5]=p[3]&P12, ip[6]=p[4]&P14,
       ig[0]=G2|(ig0&P2), ig[1]=G4|(ig8&P4), ig[2]=G6|(g[0]&P6), ig[3]=G8|(g[1]&P8), ig[4]=G10|(g[2]&P10), ig[5]=G12|(g[3]&P12), ig[6]=G14|(g[4]&P14);
endmodule      

module carryGen(C,cout,cin,ip,ig,P0,G0);
input[27:0] ip,ig;
input cin,P0,G0;
output[14:0] C; 
output cout;
assign C[0]=G0|(P0&cin), C[1]=ig[0]|(ip[0]&cin), C[2]=ig[21]|(ip[21]&cin), C[3]=ig[8]|(ip[8]&cin), C[4]=ig[22]|(ip[22]&cin), C[5]=ig[15]|(ip[15]&cin), 
       C[6]=ig[23]|(ip[23]&cin),C[7]=ig[16]|(ip[16]&cin), C[8]=ig[24]|(ip[24]&cin), C[9]=ig[17]|(ip[17]&cin),C[10]=ig[25]|(ip[25]&cin), C[11]=ig[18]|(ip[18]&cin), 
       C[12]=ig[26]|(ip[26]&cin), C[13]=ig[19]|(ip[19]&cin), C[14]=ig[27]|(ip[27]&cin), 
       cout=ig[20]|(ip[20]&cin);
endmodule


module sumGen(s,C,cin,P);
input[14:0] C; input cin; input[15:0] P;
output[15:0] s;
assign s[0]=P[0]^cin, s[1]=P[1]^C[0], s[2]=P[2]^C[1], s[3]=P[3]^C[2],
       s[4]=P[4]^C[3], s[5]=P[5]^C[4], s[6]=P[6]^C[5], s[7]=P[7]^C[6],
       s[8]=P[8]^C[7], s[9]=P[9]^C[8], s[10]=P[10]^C[9], s[11]=P[11]^C[10],
       s[12]=P[12]^C[11], s[13]=P[13]^C[12], s[14]=P[14]^C[13], s[15]=P[15]^C[14];
endmodule

module HC16(clk,a,b,cin,s,cout);
input clk;
input[15:0] a,b;
input cin;
output[15:0] s,cout;
wire[15:0] P,G;
wire[14:0] C; wire[27:0] ip,ig;

vio_0 HC16_vio (
  .clk(clk),                // input wire clk
  .probe_in0(s),    // input wire [14 : 0] probe_in0
  .probe_in1(cout),    // input wire [0 : 0] probe_in1
  .probe_out0(a),  // output wire [14 : 0] probe_out0
  .probe_out1(b),  // output wire [14 : 0] probe_out1
  .probe_out2(cin)  // output wire [0 : 0] probe_out2
);



stage0 s0(P,G,a,b);
stage1 s1(ip[7:0],ig[7:0],P[15:0],G[15:0]);
stage2 s2(ip[14:8],ig[14:8],ip[7:0],ig[7:0]);
stage3 s3(ip[20:15],ig[20:15],ip[14:8],ig[14:8],ip[0],ig[0]);
stage4 s4(ip[27:21],ig[27:21],ip[20:15],ig[20:15],P[2],G[2],P[4],G[4],P[6],G[6],P[8],G[8],P[10],G[10],P[12],G[12],P[14],G[14],ip[0],ig[0],ip[8],ig[8]);
carryGen c4(C,cout,cin,ip,ig,P[0],G[0]);
sumGen s5(s,C,cin,P);
endmodule


module tbHC;
wire[15:0] s; wire cout;
reg[15:0] a,b; reg cin;
HC16 BK(a,b,cin,s,cout);
initial 
begin 
    a<=16'h00A5; b<=16'h00A0; cin<=1'b0;
    
    #20    a<=16'h09A5; b<=16'h00B0; cin<=1'b0;
    
    #20    a<=16'h0AA3; b<=16'h10A0; cin<=1'b0;
    
    #20    a<=16'hC0A5; b<=16'h0BA0; cin<=1'b0;

    #20 $finish;
end
endmodule
