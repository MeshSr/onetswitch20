`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/12/04 10:19:43
// Design Name: 
// Module Name: onetswitch_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module onetswitch_top(
        inout [14:0]DDR_addr,
        inout [2:0]DDR_ba,
        inout DDR_cas_n,
        inout DDR_ck_n,
        inout DDR_ck_p,
        inout DDR_cke,
        inout DDR_cs_n,
        inout [3:0]DDR_dm,
        inout [31:0]DDR_dq,
        inout [3:0]DDR_dqs_n,
        inout [3:0]DDR_dqs_p,
        inout DDR_odt,
        inout DDR_ras_n,
        inout DDR_reset_n,
        inout DDR_we_n,
        inout FIXED_IO_ddr_vrn,
        inout FIXED_IO_ddr_vrp,
        inout [53:0]FIXED_IO_mio,
        inout FIXED_IO_ps_clk,
        inout FIXED_IO_ps_porb,
        inout FIXED_IO_ps_srstb,
        output    [1:0]   pl_led,
        output             pl_pmod
    );

reg   [23:0]   cnt_0;
reg   [23:0]   cnt_1;
reg   [23:0]   cnt_2;


wire           bd_fclk0_125m;
wire           bd_fclk1_75m;
wire           bd_fclk2_200m;

always@(posedge bd_fclk0_125m)
   cnt_0 <= cnt_0 + 1'b1;
   
always@(posedge bd_fclk1_75m)
   cnt_1 <= cnt_1 + 1'b1;    
    
always@(posedge bd_fclk2_200m)
   cnt_2 <= cnt_2 + 1'b1;    

    
assign pl_led[0] = cnt_0[23];
assign pl_led[1] = cnt_1[23];
assign pl_pmod   = cnt_2[23];
   
onets_7020_procsys_wrapper onets_7020_procsys_wrapper(

        .FCLK_CLK0_125MHz        (bd_fclk0_125m),              //output   bd_fclk0_125m,
        .FCLK_CLK1_75MHz         (bd_fclk1_75m),              //output   bd_fclk1_75m,
        .FCLK_CLK2_200MHz        (bd_fclk2_200m),             //output  bd_fclk2_200m,          
                              
         .DDR_addr               (DDR_addr),                  //inout [14:0]DDR_addr;
         .DDR_ba                 (DDR_ba),                    //inout [2:0]DDR_ba;
         .DDR_cas_n              (DDR_cas_n),                //inout DDR_cas_n;
         .DDR_ck_n               (DDR_ck_n),                  //inout DDR_ck_n;
         .DDR_ck_p               (DDR_ck_p),                   //inout DDR_ck_p;
         .DDR_cke                (DDR_cke),                    //inout DDR_cke;
         .DDR_cs_n               (DDR_cs_n),                   //inout DDR_cs_n;
         .DDR_dm                 (DDR_dm),                     //inout [3:0]DDR_dm;
         .DDR_dq                 (DDR_dq),                     //inout [31:0]DDR_dq;
         .DDR_dqs_n              (DDR_dqs_n),                  //inout [3:0]DDR_dqs_n;
         .DDR_dqs_p              (DDR_dqs_p),                  //inout [3:0]DDR_dqs_p;
         .DDR_odt                (DDR_odt),                    //inout DDR_odt;
         .DDR_ras_n              (DDR_ras_n),                  //inout DDR_ras_n;
         .DDR_reset_n            (DDR_reset_n),                //inout DDR_reset_n;
         .DDR_we_n               (DDR_we_n),                   //inout DDR_we_n;
         
         .FIXED_IO_ddr_vrn       (FIXED_IO_ddr_vrn) ,         //inout FIXED_IO_ddr_vrn
         .FIXED_IO_ddr_vrp       (FIXED_IO_ddr_vrp),          //inout FIXED_IO_ddr_vrp       
         .FIXED_IO_ps_srstb      (FIXED_IO_ps_srstb),                  //inout FIXED_IO_ps_srstb
         .FIXED_IO_ps_clk        (FIXED_IO_ps_clk),                     //inout FIXED_IO_ps_clk
         .FIXED_IO_ps_porb       (FIXED_IO_ps_porb)                     //inout FIXED_IO_ps_porb         
);
endmodule
