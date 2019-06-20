 /*******************************(C) COPYRIGHT 2019 Teemo（陈晓东）*********************************/
/**============================================================================
* @FileName    : Drive_DAC2900.v
* @Description : 顾名思义,DAC2900的驱动
* @Date        : 2019/6/18
* @By          : Teemo（陈晓东）
* @Email       : 
* @Platform    : Quartus Prime 18.0 (64-bit) (EP4CE22E22C8)
* @Explain     : 接口的终端
*=============================================================================*/  
module Drive_DAC2900
(   
    input in_rst,
    input wire [9:0]in_DA1_data,
    input wire [9:0]in_DA2_data,
    
	output reg out_clk1,
    output reg out_clk2, 
    output reg out_wrt1,
    output reg out_wrt2, 
    output wire [9:0]out_DA1_data,
    output wire [9:0]out_DA2_data,
    output reg out_PD
);

always @(posedge in_clk1 or negedge in_rst)
begin

    if(in_rst == 0)
    begin
        out_PD <= 0;
    end
    
    
	if(in_clk1)
	begin
    
	end
	
end
	
	
	
	
	
	
endmodule


/*******************************(C) COPYRIGHT 2019 Teemo（陈晓东）*********************************/









