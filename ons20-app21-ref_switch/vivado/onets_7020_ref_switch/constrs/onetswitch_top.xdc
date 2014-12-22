#set_false_path -from [get_clocks clk_fpga_1] -to [get_clocks clk_fpga_0]
set_false_path -from [get_clocks clk_fpga_0] -to [get_clocks clk_fpga_1]



#set_max_delay -from [get_cells {*rxdata_in_bus[?].rgmii_rx_data_in*} -hierarchical] -to [get_cells {*GMII_MII_RX_GEN/RXD_REG1_reg[?]*} -hierarchical] 2.200
#set_property IDELAY_VALUE 10 [get_cells {*rgmii_interface/delay_rgmii_rx*}]
#set_property IDELAY_VALUE 10 [get_cells {*rgmii_interface/rxdata_bus[*].delay_rgmii_rx*}]
current_instance i_onets_bd_wrapper/onets_bd_i/axi_ethernet_0/eth_mac/inst
set_property IDELAY_VALUE 6 [get_cells {tri_mode_ethernet_mac_i/rgmii_interface/delay_rgmii_rx* tri_mode_ethernet_mac_i/rgmii_interface/rxdata_bus[*].delay_rgmii_rx*}]
current_instance -quiet
current_instance i_onets_bd_wrapper/onets_bd_i/axi_ethernet_1/eth_mac/inst
set_property IDELAY_VALUE 5 [get_cells {rgmii_interface/delay_rgmii_rx* rgmii_interface/rxdata_bus[*].delay_rgmii_rx*}]
current_instance -quiet
current_instance i_onets_bd_wrapper/onets_bd_i/axi_ethernet_2/eth_mac/inst
set_property IDELAY_VALUE 3 [get_cells {rgmii_interface/delay_rgmii_rx* rgmii_interface/rxdata_bus[*].delay_rgmii_rx*}]
current_instance -quiet
current_instance i_onets_bd_wrapper/onets_bd_i/axi_ethernet_3/eth_mac/inst
set_property IDELAY_VALUE 3 [get_cells {rgmii_interface/delay_rgmii_rx* rgmii_interface/rxdata_bus[*].delay_rgmii_rx*}]
current_instance -quiet