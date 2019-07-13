 /*******************************(C) COPYRIGHT 2019 Teemo（陈晓东）*********************************/
/**============================================================================
* @FileName    : Interface_bsp.v
* @Description : 顶层接口
* @Date        : 2019/6/18
* @By          : Teemo（陈晓东）
* @Email       : 
* @Platform    : Quartus Prime 18.0 (64-bit) (EP4CE22E22C8)
* @Explain     : 接口的终端
*=============================================================================*/   
/* 顶层接口模块 ----------------------*/
module Interface_bsp
( 
	/* Drive_Clock -------------------*/
	input clk_50M,
	input rst,
    
	/* Drive_Led ---------------------*/
	output [3:0]led_bus,
    
    /* DAC ---------------------------*/
	output DAC_clk1,
    output DAC_clk2, 
    output DAC_wrt1,
    output DAC_wrt2, 
    output [9:0]DAC1_data,
    output [9:0]DAC2_data
);   

/* Drive_Clock ----------------------*/
wire out_clk_us;  
wire out_clk_ms; 
wire out_clk_20ms;  
wire out_clk_s;  
wire out_clk_100M; 

Drive_PLL Drive_PLL0
(
    .inclk0(clk_50M)
    ,.c0(out_clk_100M)
);

Drive_Clock Drive_Clock0
(  
    .in_clk_50M(clk_50M)
    ,.in_clr(rst)

    ,.out_clk_us(out_clk_us)
    ,.out_clk_ms(out_clk_ms)
    ,.out_clk_20ms(out_clk_20ms) 
    ,.out_clk_s(out_clk_s) 
); 

 App_Led App_Led0
(    
	.in_clr(rst) 
	,.in_clk_ms(out_clk_ms) 
	,.out_led(led_bus)
);

wire [31:0] NCO_phi_inc;
App_Orthogonal_DDS App_Orthogonal_DDS_instance
( 
	.in_rst(rst)
	,.in_clk_DAC2900(out_clk_100M)
	,.in_clk_NCO(out_clk_100M)
    ,.in_output_freq(NCO_phi_inc)//TODO:输入频率
    
	,.DAC_clk1(DAC_clk1)
    ,.DAC_clk2(DAC_clk2)
    ,.DAC_wrt1(DAC_wrt1)
    ,.DAC_wrt2(DAC_wrt2)
    ,.out_DA1_data(DAC1_data)
    ,.out_DA2_data(DAC2_data)
);

//NIOS IP核
kernel u0 (
    .clk_clk       (out_clk_100M),       //   clk.clk
    .pio_nco_phi_export(NCO_phi_inc),
    .reset_reset_n (rst)  // reset.reset_n
);

endmodule
/*******************************(C) COPYRIGHT 2019 Teemo（陈晓东）*********************************/





  
  
  
  
  
 
  
  