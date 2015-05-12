`timescale 1 ps / 1 ps

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
   output phy_rst_n_0,
   inout mdio_0_io,
   output mdio_0_mdc,
   inout mdio_1_io,
   output mdio_1_mdc,
   inout mdio_2_io,
   output mdio_2_mdc,
   inout mdio_3_io,
   output mdio_3_mdc,
   input [3:0]rgmii_0_rd,
   input rgmii_0_rx_ctl,
   input rgmii_0_rxc,
   output [3:0]rgmii_0_td,
   output rgmii_0_tx_ctl,
   output rgmii_0_txc,
   input [3:0]rgmii_1_rd,
   input rgmii_1_rx_ctl,
   input rgmii_1_rxc,
   output [3:0]rgmii_1_td,
   output rgmii_1_tx_ctl,
   output rgmii_1_txc,
   input [3:0]rgmii_2_rd,
   input rgmii_2_rx_ctl,
   input rgmii_2_rxc,
   output [3:0]rgmii_2_td,
   output rgmii_2_tx_ctl,
   output rgmii_2_txc,
   input [3:0]rgmii_3_rd,
   input rgmii_3_rx_ctl,
   input rgmii_3_rxc,
   output [3:0]rgmii_3_td,
   output rgmii_3_tx_ctl,
   output rgmii_3_txc,

   output [1:0]         pl_led,
   output [1:0]         pl_pmod   
   
);

   wire bd_fclk0_125m ;
   wire bd_fclk1_75m  ;
   wire bd_fclk2_200m ;

   reg [23:0] cnt_0;
   reg [23:0] cnt_1;
   reg [23:0] cnt_2;
   reg [23:0] cnt_3;

   always @(posedge bd_fclk0_125m) begin
     cnt_0 <= cnt_0 + 1'b1;
   end
   always @(posedge bd_fclk1_75m) begin
     cnt_1 <= cnt_1 + 1'b1;
   end
   always @(posedge bd_fclk2_200m) begin
     cnt_2 <= cnt_2 + 1'b1;
   end
   always @(posedge bd_fclk2_200m) begin
     cnt_3 <= cnt_3 + 1'b1;
   end

   assign pl_led[0]  = cnt_0[23];
   assign pl_led[1]  = cnt_1[23];
   assign pl_pmod[0] = cnt_2[23];
   assign pl_pmod[1] = cnt_3[23];

onets_bd_wrapper i_onets_bd_wrapper(
   .DDR_addr(DDR_addr),
   .DDR_ba(DDR_ba),
   .DDR_cas_n(DDR_cas_n),
   .DDR_ck_n(DDR_ck_n),
   .DDR_ck_p(DDR_ck_p),
   .DDR_cke(DDR_cke),
   .DDR_cs_n(DDR_cs_n),
   .DDR_dm(DDR_dm),
   .DDR_dq(DDR_dq),
   .DDR_dqs_n(DDR_dqs_n),
   .DDR_dqs_p(DDR_dqs_p),
   .DDR_odt(DDR_odt),
   .DDR_ras_n(DDR_ras_n),
   .DDR_reset_n(DDR_reset_n),
   .DDR_we_n(DDR_we_n),
   .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
   .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
   .FIXED_IO_mio(FIXED_IO_mio),
   .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
   .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
   .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),

   .mdio_0_io       (mdio_0_io       ),
   .mdio_0_mdc      (mdio_0_mdc      ),
   .mdio_1_io       (mdio_1_io       ),
   .mdio_1_mdc      (mdio_1_mdc      ),
   .mdio_2_io       (mdio_2_io       ),
   .mdio_2_mdc      (mdio_2_mdc      ),
   .mdio_3_io       (mdio_3_io       ),
   .mdio_3_mdc      (mdio_3_mdc      ),
   .phy_rst_n_0     (phy_rst_n_0),
   .phy_rst_n_1     (),
   .phy_rst_n_2     (),
   .phy_rst_n_3     (),
   .rgmii_0_rd      (rgmii_0_rd      ),
   .rgmii_0_rx_ctl  (rgmii_0_rx_ctl  ),
   .rgmii_0_rxc     (rgmii_0_rxc     ),
   .rgmii_0_td      (rgmii_0_td      ),
   .rgmii_0_tx_ctl  (rgmii_0_tx_ctl  ),
   .rgmii_0_txc     (rgmii_0_txc     ),
   .rgmii_1_rd      (rgmii_1_rd      ),
   .rgmii_1_rx_ctl  (rgmii_1_rx_ctl  ),
   .rgmii_1_rxc     (rgmii_1_rxc     ),
   .rgmii_1_td      (rgmii_1_td      ),
   .rgmii_1_tx_ctl  (rgmii_1_tx_ctl  ),
   .rgmii_1_txc     (rgmii_1_txc     ),
   .rgmii_2_rd      (rgmii_2_rd      ),
   .rgmii_2_rx_ctl  (rgmii_2_rx_ctl  ),
   .rgmii_2_rxc     (rgmii_2_rxc     ),
   .rgmii_2_td      (rgmii_2_td      ),
   .rgmii_2_tx_ctl  (rgmii_2_tx_ctl  ),
   .rgmii_2_txc     (rgmii_2_txc     ),
   .rgmii_3_rd      (rgmii_3_rd      ),
   .rgmii_3_rx_ctl  (rgmii_3_rx_ctl  ),
   .rgmii_3_rxc     (rgmii_3_rxc     ),
   .rgmii_3_td      (rgmii_3_td      ),
   .rgmii_3_tx_ctl  (rgmii_3_tx_ctl  ),
   .rgmii_3_txc     (rgmii_3_txc     ),

   .bd_fclk0_125m   ( bd_fclk0_125m   ),
   .bd_fclk1_75m    ( bd_fclk1_75m    ),
   .bd_fclk2_200m   ( bd_fclk2_200m   ),   
   
   .ext_rst         (1'b0)
);
endmodule