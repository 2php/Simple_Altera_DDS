 /*******************************(C) COPYRIGHT 2019 Teemo（陈晓东）*********************************/
/**============================================================================
* @FileName    : App_Orthogonal_DDS.v
* @Description : 正交DDS的应用层，通过DAC2900和NCO输出两路频率可调的正交正弦信号
* @Date        : 2019/6/18
* @By          : Teemo（陈晓东）
* @Email       : 
* @Platform    : Quartus Prime 18.0 (64-bit) (EP4CE22E22C8)
* @Explain     : 接口的终端
*=============================================================================*/
/* 设置接口 ---------------------------*/
module App_Orthogonal_DDS
( 
	input in_rst     
	,input in_clk_DAC2900
	,input in_clk_NCO
    ,input [31:0]in_output_freq
    
	,output wire DAC_clk1
    ,output wire DAC_clk2 
    ,output wire DAC_wrt1
    ,output wire DAC_wrt2  
    ,output wire [9:0]out_DA1_data
    ,output wire [9:0]out_DA2_data
);

/* 寄存器配置 -------------------------*/

wire [9:0]NCO_out_sin;
wire [9:0]NCO_out_cos;
wire NCO_out_valid;

//assign out_DA1_data = {~NCO_out_sin[9],NCO_out_sin[8:0]};
//assign out_DA2_data = {~NCO_out_cos[9],NCO_out_cos[8:0]};
assign out_DA1_data = NCO_out_sin + 10'd512;
assign out_DA2_data = NCO_out_cos + 10'd512;


/* 连接输出 ---------------------------*/
assign DAC_clk1 = in_clk_DAC2900;
assign DAC_clk2 = in_clk_DAC2900;
assign DAC_wrt1 = in_clk_DAC2900;
assign DAC_wrt2 = in_clk_DAC2900;


/* 例化底层驱动 -------------------------*/
//TODO: 输入频率转换成相位递增字
//ALTFP_MULT
//reg [31:0] NCO_phi_inc = in_output_freq*(2^32/100M);

//d42950 1k d42949673 1M
NCO NCO_instance (
    .clk       (in_clk_NCO),       // clk.clk
    .reset_n   (1'b1),   // rst.reset_n
    .clken     (1'b1),     //  in.clken
    .phi_inc_i (32'd42949673), //    .phi_inc_i
    .fsin_o    (NCO_out_sin),    // out.fsin_o
    .fcos_o    (NCO_out_cos),    //    .fcos_o
    .out_valid (NCO_out_valid)  //    .out_valid
);

//Drive_DAC2900 Drive_DAC2900_instance
//(   
//    .in_rst(in_rst),
//    .in_DA1_data(fsin_o),
//    .in_DA2_data(fcos_o),
//    
//    .out_clk1(out_clk1),
//    .out_clk2(out_clk2),
//    .out_wrt1(out_wrt1),
//    .out_wrt2(out_wrt2),  
//    .out_DA1_data(out_DA1_data),
//    .out_DA2_data(out_DA2_data),
//    .out_PD(out_PD)
//);

/* 运行线程 ---------------------------*/

  

endmodule

/*******************************(C) COPYRIGHT 2019 Teemo（陈晓东）*********************************/







