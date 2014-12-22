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
   input btn_rst_n
);
/*
    reg[23:0] cnt_user;
    reg[23:0] cnt_gtref;
    reg[23:0] cnt_200m;
    wire clk_200,ref_clk;
    wire userclk2_out,gtref_clk_out;
    wire btn_rst;
    assign btn_rst = !btn_rst_n;
    always @(posedge userclk2_out) begin
        cnt_user <= cnt_user + 1'b1;
    end
    always @(posedge gtref_clk_out) begin
        cnt_gtref <= cnt_gtref + 1'b1;
    end
    always @(posedge ref_clk) begin
        cnt_200m <= cnt_200m + 1'b1;
    end
    assign pl_led[0] = cnt_user[23];
    assign pl_led[1] = cnt_gtref[23];
    assign pl_pmod[0] = cnt_200m[23];
    assign pl_pmod[1] = 1'b1;
    IBUFDS ibufds_clk200(
        .I (clk200m_p),
        .IB (clk200m_n),
        .O (clk_200)
    );
    BUFG bufg_clk200(
        .I (clk_200),
        .O (ref_clk)
    );
*/
onetsw_1_wrapper i_onetsw_1_wrapper(
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
   .ext_rst         (1'b0)
);
endmodule