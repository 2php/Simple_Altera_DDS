/*******************************(C) COPYRIGHT 2017 Wind（谢玉伸）*********************************/
/**============================================================================
* @FileName    : App_Led.v
* @Description : Led灯
* @Date        : 2017/4/16
* @By          : Wind（谢玉伸）
* @Email       : 1659567673@ qq.com
* @Platform    : Quartus II 15.0 (64-bit) (EP4CE22E22C8)
* @Explain     : Led的应用程序
*=============================================================================*/ 
/* 设置接口 ---------------------------*/
module App_Led
( 
	input in_clr     
	,input in_clk_ms     
	
	,output reg [3:0]out_led
);	 

/* 寄存器配置 -------------------------*/
//reg [3:0]led = 4'b0110;//LED灯
reg [15:0]cnt; 

/* 连接输出 ---------------------------*/
//assign out_led = led;

/* 运行线程 ---------------------------*/
always @(posedge in_clk_ms or negedge in_clr)
begin   
	if(in_clr == 0) 
	begin
		out_led <= 4'b1010; 
	end
	
	else 
	//if(in_clk_ms)
	begin
        cnt <= (cnt + 1)%300; 
		if(cnt == 0) 
		begin
			out_led[0] <= ~out_led[0]; 
		end  
	end
	
end 
  

endmodule
/*******************************(C) COPYRIGHT 2017 Wind（谢玉伸）*********************************/







