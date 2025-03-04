
		
`timescale 1 ps / 1 ps

module softmax_8p
	#(
		parameter TOTAL_WORDS = 16,
		parameter PARALLEL_FACTOR = 8
	)
	(
	input	clk,
	input	rst,
	//input registers
	input  [255:0]data_in, //8x32=256
	//output buffer
	output [255:0] data_out
	);
	
	
wire [31:0] expo_q_w0, expo_q_w1,expo_q_w2, expo_q_w3, expo_q_w4, expo_q_w5, expo_q_w6, expo_q_w7;
wire [31:0]	expo_q_w8, expo_q_w9,expo_q_w10,expo_q_w11,expo_q_w12,expo_q_w13,expo_q_w14,expo_q_w15;	

wire [31:0] reg_w0,reg_w1,reg_w2,reg_w3,reg_w4,reg_w5,reg_w6,reg_w7;
wire [31:0] reg_w8, reg_w9,reg_w10,reg_w11,reg_w12,reg_w13,reg_w14,reg_w15;

wire [31:0] adder1_w0, adder1_w1, adder1_w2, adder1_w3,adder1_w4,adder1_w5,adder1_w6,adder1_w7;
wire [31:0] adder2_w0, adder2_w1, adder2_w2, adder2_w3;
wire [31:0] adder3_w0, adder3_w1;
wire [31:0] adder4_w;

wire [31:0] acc_r, reci_q;

	
//Exponent blocks
expo expo_0(.clk(clk), .areset(rst),.a(data_in[31:0]),.q(expo_q_w0));	
expo expo_1(.clk(clk), .areset(rst),.a(data_in[63:32]),.q(expo_q_w1));
expo expo_2(.clk(clk), .areset(rst),.a(data_in[95:64]),.q(expo_q_w2));
expo expo_3(.clk(clk), .areset(rst),.a(data_in[127:96]),.q(expo_q_w3));	
expo expo_4(.clk(clk), .areset(rst),.a(data_in[159:128]),.q(expo_q_w4));
expo expo_5(.clk(clk), .areset(rst),.a(data_in[191:160]),.q(expo_q_w5));
expo expo_6(.clk(clk), .areset(rst),.a(data_in[223:192]),.q(expo_q_w6));	
expo expo_7(.clk(clk), .areset(rst),.a(data_in[255:224]),.q(expo_q_w7));	



// intermediate memory registers
reg32 m_reg0(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w0), .q(reg_w0));
reg32 m_reg1(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w1), .q(reg_w1));	
reg32 m_reg2(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w2), .q(reg_w2));
reg32 m_reg3(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w3), .q(reg_w3));
reg32 m_reg4(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w4), .q(reg_w4));
reg32 m_reg5(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w5), .q(reg_w5));	
reg32 m_reg6(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w6), .q(reg_w6));
reg32 m_reg7(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w7), .q(reg_w7));	
reg32 m_reg8(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w8), .q(reg_w8));
reg32 m_reg9(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w9), .q(reg_w9));	
reg32 m_reg10(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w10), .q(reg_w10));
reg32 m_reg11(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w11), .q(reg_w11));	
reg32 m_reg12(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w12), .q(reg_w12));
reg32 m_reg13(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w13), .q(reg_w13));	
reg32 m_reg14(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w14), .q(reg_w14));
reg32 m_reg15(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w15), .q(reg_w15));			

	
//Adder Tree	

//adder tree stage 1
adder addrTree14(.clock(clk),.dataa(expo_q_w0),.datab(expo_q_w1),.result(adder1_w0));
adder addrTree13(.clock(clk),.dataa(expo_q_w2),.datab(expo_q_w3),.result(adder1_w1));
adder addrTree12(.clock(clk),.dataa(expo_q_w4),.datab(expo_q_w5),.result(adder1_w2));
adder addrTree11(.clock(clk),.dataa(expo_q_w6),.datab(expo_q_w7),.result(adder1_w3));
adder addrTree10(.clock(clk),.dataa(expo_q_w8),.datab(expo_q_w9),.result(adder1_w4));
adder addrTree9(.clock(clk),.dataa(expo_q_w10),.datab(expo_q_w11),.result(adder1_w5));
adder addrTree8(.clock(clk),.dataa(expo_q_w12),.datab(expo_q_w13),.result(adder1_w6));
adder addrTree7(.clock(clk),.dataa(expo_q_w14),.datab(expo_q_w15),.result(adder1_w7));
//stage 2
adder addrTree6(.clock(clk),.dataa(adder1_w0),.datab(adder1_w1),.result(adder2_w0));
adder addrTree5(.clock(clk),.dataa(adder1_w2),.datab(adder1_w3),.result(adder2_w1));
adder addrTree4(.clock(clk),.dataa(adder1_w4),.datab(adder1_w5),.result(adder2_w2));
adder addrTree3(.clock(clk),.dataa(adder1_w6),.datab(adder1_w7),.result(adder2_w3));
//stage 3
adder addrTree2(.clock(clk),.dataa(adder2_w0),.datab(adder2_w1),.result(adder3_w0));
adder addrTree1(.clock(clk),.dataa(adder2_w2),.datab(adder2_w3),.result(adder3_w1));
//stage 4
adder addrTree0(.clock(clk),.dataa(adder3_w0),.datab(adder3_w1),.result(adder4_w));
	


acc1 accumulator(
		.clk(clk),    //    clk.clk
		.areset(rst), // areset.reset
		.x(adder4_w),      //      x.x
		.n(),      //      n.n
		.r(acc_r),      //      r.r
		.xo(),     //     xo.xo
		.xu(),     //     xu.xu
		.ao(),     //     ao.ao
		.en(1'b1)      //     en.en
	);	
	


	
reciprocal1 (
		.clk(clk),    //    clk.clk
		.areset(rst), // areset.reset
		.a(acc_r),      //      a.a
		.q(reci_q)       //      q.q
	);	
		

	
	
multiplier1 mult0(.clk(clk),  .areset(rst), .a(reci_q), .b(reg_w0), .q(data_out[31:0]));	
multiplier1 mult1(.clk(clk),  .areset(rst), .a(reci_q), .b(reg_w1), .q(data_out[63:32]));
multiplier1 mult2(.clk(clk),  .areset(rst), .a(reci_q), .b(reg_w2), .q(data_out[95:64]));
multiplier1 mult3(.clk(clk),  .areset(rst), .a(reci_q), .b(reg_w3), .q(data_out[127:96]));
multiplier1 mult4(.clk(clk),  .areset(rst), .a(reci_q), .b(reg_w4), .q(data_out[159:128]));		
multiplier1 mult5(.clk(clk),  .areset(rst), .a(reci_q), .b(reg_w5), .q(data_out[191:160]));	
multiplier1 mult6(.clk(clk),  .areset(rst), .a(reci_q), .b(reg_w6), .q(data_out[223:192]));
multiplier1 mult7(.clk(clk),  .areset(rst), .a(reci_q), .b(reg_w7), .q(data_out[255:224]));
multiplier1 mult8(.clk(clk),  .areset(rst), .a(reci_q), .b(reg_w8), .q(data_out[287:256]));
multiplier1 mult9(.clk(clk),  .areset(rst), .a(reci_q), .b(reg_w9), .q(data_out[319:288]));
multiplier1 mult10(.clk(clk),  .areset(rst), .a(reci_q), .b(reg_w10), .q(data_out[351:320]));	
multiplier1 mult11(.clk(clk),  .areset(rst), .a(reci_q), .b(reg_w11), .q(data_out[383:352]));
multiplier1 mult12(.clk(clk),  .areset(rst), .a(reci_q), .b(reg_w12), .q(data_out[415:384]));
multiplier1 mult13(.clk(clk),  .areset(rst), .a(reci_q), .b(reg_w13), .q(data_out[447:416]));
multiplier1 mult14(.clk(clk),  .areset(rst), .a(reci_q), .b(reg_w14), .q(data_out[479:448]));		
multiplier1 mult15(.clk(clk),  .areset(rst), .a(reci_q), .b(reg_w15), .q(data_out[511:480]));


	
endmodule
						