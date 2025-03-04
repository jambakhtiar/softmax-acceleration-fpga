
		
`timescale 1 ps / 1 ps

module softmax_v2
	#(
		parameter TOTAL_WORDS = 16,
		parameter PARALLEL_FACTOR = 32
	)
	(
	input	clk,
	input	rst,
	//input registers
	input  [1023:0]data_in,
	//output buffer
	output reg [1023:0] data_out
	);
	
	
wire [1023:0] expo_q_w;	
	
/*
	
//Exponent blocks
expo expo_0(.clk(clk), .areset(rst),.a(data_in[31:0]),.q(expo_q_w[31:0]));	
expo expo_1(.clk(clk), .areset(rst),.a(data_in[63:32]),.q(expo_q_w[63:32]));
expo expo_2(.clk(clk), .areset(rst),.a(data_in[95:64]),.q(expo_q_w[95:64]));
expo expo_3(.clk(clk), .areset(rst),.a(data_in[127:96]),.q(expo_q_w[127:96]));	
expo expo_4(.clk(clk), .areset(rst),.a(data_in[159:128]),.q(expo_q_w[159:128]));
expo expo_5(.clk(clk), .areset(rst),.a(data_in[191:160]),.q(expo_q_w[191:160]));
expo expo_6(.clk(clk), .areset(rst),.a(data_in[223:192]),.q(expo_q_w[223:192]));	
expo expo_7(.clk(clk), .areset(rst),.a(data_in[255:224]),.q(expo_q_w[255:224]));
expo expo_8(.clk(clk), .areset(rst),.a(data_in[287:256]),.q(expo_q_w[287:256]));
expo expo_9(.clk(clk), .areset(rst),.a(data_in[319:288]),.q(expo_q_w[319:288]));	
expo expo_10(.clk(clk), .areset(rst),.a(data_in[351:320]),.q(expo_q_w[351:320]));
expo expo_11(.clk(clk), .areset(rst),.a(data_in[383:352]),.q(expo_q_w[383:352]));
expo expo_12(.clk(clk), .areset(rst),.a(data_in[415:384]),.q(expo_q_w[415:384]));	
expo expo_13(.clk(clk), .areset(rst),.a(data_in[447:416]),.q(expo_q_w[447:416]));
expo expo_14(.clk(clk), .areset(rst),.a(data_in[479:448]),.q(expo_q_w[479:448]));
expo expo_15(.clk(clk), .areset(rst),.a(data_in[511:480]),.q(expo_q_w[511:480]));	
expo expo_16(.clk(clk), .areset(rst),.a(data_in[543:512]),.q(expo_q_w[543:512]));	
expo expo_17(.clk(clk), .areset(rst),.a(data_in[575:544]),.q(expo_q_w[575:544]));
expo expo_18(.clk(clk), .areset(rst),.a(data_in[607:576]),.q(expo_q_w[607:576]));
expo expo_19(.clk(clk), .areset(rst),.a(data_in[639:608]),.q(expo_q_w[639:608]));	
expo expo_20(.clk(clk), .areset(rst),.a(data_in[671:640]),.q(expo_q_w[671:640]));
expo expo_21(.clk(clk), .areset(rst),.a(data_in[703:672]),.q(expo_q_w[703:672]));
expo expo_22(.clk(clk), .areset(rst),.a(data_in[735:704]),.q(expo_q_w[735:704]));	
expo expo_23(.clk(clk), .areset(rst),.a(data_in[767:736]),.q(expo_q_w[767:736]));
expo expo_24(.clk(clk), .areset(rst),.a(data_in[799:768]),.q(expo_q_w[799:768]));
expo expo_25(.clk(clk), .areset(rst),.a(data_in[831:800]),.q(expo_q_w[831:800]));	
expo expo_26(.clk(clk), .areset(rst),.a(data_in[863:832]),.q(expo_q_w[863:832]));
expo expo_27(.clk(clk), .areset(rst),.a(data_in[895:864]),.q(expo_q_w[895:864]));
expo expo_28(.clk(clk), .areset(rst),.a(data_in[927:896]),.q(expo_q_w[927:896]));	
expo expo_29(.clk(clk), .areset(rst),.a(data_in[959:928]),.q(expo_q_w[959:928]));
expo expo_30(.clk(clk), .areset(rst),.a(data_in[991:960]),.q(expo_q_w[991:960]));
expo expo_31(.clk(clk), .areset(rst),.a(data_in[1023:992]),.q(expo_q_w[1023:992]));	



reg32 m_reg0(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[31:0]), .q());
reg32 m_reg1(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[63:32]), .q());	
reg32 m_reg2(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[95:64]), .q());
reg32 m_reg3(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[127:96]), .q());
reg32 m_reg4(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[159:128]), .q());
reg32 m_reg5(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[191:160]), .q());	
reg32 m_reg6(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[223:192]), .q());
reg32 m_reg7(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[255:224]), .q());	
reg32 m_reg8(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[287:256]), .q());
reg32 m_reg9(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[319:288]), .q());	
reg32 m_reg10(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[351:320]), .q());
reg32 m_reg11(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[383:352]), .q());	
reg32 m_reg12(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[415:384]), .q());
reg32 m_reg13(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[447:416]), .q());	
reg32 m_reg14(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[479:448]), .q());
reg32 m_reg15(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[511:480]), .q());			
reg32 m_reg16(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[543:512]), .q());
reg32 m_reg17(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[575:544]), .q());	
reg32 m_reg18(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[607:576]), .q());
reg32 m_reg19(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[639:608]), .q());
reg32 m_reg20(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[671:640]), .q());
reg32 m_reg21(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[703:672]), .q());	
reg32 m_reg22(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[735:704]), .q());
reg32 m_reg23(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[767:736]), .q());	
reg32 m_reg24(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[799:768]), .q());
reg32 m_reg25(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[831:800]), .q());	
reg32 m_reg26(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[863:832]), .q());
reg32 m_reg27(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[895:864]), .q());	
reg32 m_reg28(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[927:896]), .q());
reg32 m_reg29(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[959:928]), .q());	
reg32 m_reg30(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[991:960]), .q());
reg32 m_reg31(.clk(clk), .rst(rst), .en(1'b1), .d(expo_q_w[1023:992]), .q());	

	
//Adder Tree	
// adder tree stage 1	
adder addrTree30(.clock(clk),.dataa,.datab,.result);
adder addrTree29(.clock(clk),.dataa,.datab,.result);
adder addrTree28(.clock(clk),.dataa,.datab,.result);
adder addrTree27(.clock(clk),.dataa,.datab,.result);
adder addrTree26(.clock(clk),.dataa,.datab,.result);
adder addrTree25(.clock(clk),.dataa,.datab,.result);
adder addrTree24(.clock(clk),.dataa,.datab,.result);
adder addrTree23(.clock(clk),.dataa,.datab,.result);
adder addrTree22(.clock(clk),.dataa,.datab,.result);
adder addrTree21(.clock(clk),.dataa,.datab,.result);
adder addrTree20(.clock(clk),.dataa,.datab,.result);
adder addrTree19(.clock(clk),.dataa,.datab,.result);
adder addrTree18(.clock(clk),.dataa,.datab,.result);
adder addrTree17(.clock(clk),.dataa,.datab,.result);
adder addrTree16(.clock(clk),.dataa,.datab,.result);
adder addrTree15(.clock(clk),.dataa,.datab,.result);
//adder tree stage 2
adder addrTree14(.clock(clk),.dataa,.datab,.result);
adder addrTree13(.clock(clk),.dataa,.datab,.result);
adder addrTree12(.clock(clk),.dataa,.datab,.result);
adder addrTree11(.clock(clk),.dataa,.datab,.result);
adder addrTree10(.clock(clk),.dataa,.datab,.result);
adder addrTree9(.clock(clk),.dataa,.datab,.result);
adder addrTree8(.clock(clk),.dataa,.datab,.result);
adder addrTree7(.clock(clk),.dataa,.datab,.result);
//stage 3
adder addrTree6(.clock(clk),.dataa,.datab,.result);
adder addrTree5(.clock(clk),.dataa,.datab,.result);
adder addrTree4(.clock(clk),.dataa,.datab,.result);
adder addrTree3(.clock(clk),.dataa,.datab,.result);
//stage 4
adder addrTree2(.clock(clk),.dataa,.datab,.result);
adder addrTree1(.clock(clk),.dataa,.datab,.result);
//stage 5
adder addrTree0(.clock(clk),.dataa,.datab,.result);
	

acc1 accumulator(
		.clk(clk),    //    clk.clk
		.areset(rst), // areset.reset
		.x(expo_q),      //      x.x
		.n(),      //      n.n
		.r(acc_r),      //      r.r
		.xo(),     //     xo.xo
		.xu(),     //     xu.xu
		.ao(),     //     ao.ao
		.en(acc_en)      //     en.en
	);	
	


	
reciprocal1 (
		.clk(clk),    //    clk.clk
		.areset(rst), // areset.reset
		.a(acc_r),      //      a.a
		.q(reci_q)       //      q.q
	);	
		

	
multiplier1 mult0(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));	
multiplier1 mult1(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult2(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult3(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult4(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));		
multiplier1 mult5(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));	
multiplier1 mult6(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult7(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult8(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult9(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult10(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));	
multiplier1 mult11(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult12(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult13(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult14(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));		
multiplier1 mult15(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));	
multiplier1 mult16(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult17(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult18(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult19(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult20(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));	
multiplier1 mult21(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult22(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult23(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult24(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));		
multiplier1 mult25(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));	
multiplier1 mult26(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult27(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult28(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult29(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult30(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));
multiplier1 mult31(.clk(clk),  .areset(rst), .a(reci_q), .b(ram2_data_b_out), .q(multi_q));


	*/
	
	
endmodule
						