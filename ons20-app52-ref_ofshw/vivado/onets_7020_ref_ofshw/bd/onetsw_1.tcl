
################################################################
# This is a generated script based on design: onetsw_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2013.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source onetsw_1_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z020clg484-1


# CHANGE DESIGN NAME HERE
set design_name onetsw_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}


# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
if { ${design_name} ne "" && ${cur_design} eq ${design_name} } {
   # Checks if design is empty or not
   set list_cells [get_bd_cells -quiet]

   if { $list_cells ne "" } {
      set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
      set nRet 1
   } else {
      puts "INFO: Constructing design in IPI design <$design_name>..."
   }
} else {

   if { [get_files -quiet ${design_name}.bd] eq "" } {
      puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

      create_bd_design $design_name

      puts "INFO: Making design <$design_name> as current_bd_design."
      current_bd_design $design_name

   } else {
      set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
      set nRet 3
   }

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]
  set mdio_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:mdio_rtl:1.0 mdio_0 ]
  set mdio_1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:mdio_rtl:1.0 mdio_1 ]
  set mdio_2 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:mdio_rtl:1.0 mdio_2 ]
  set mdio_3 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:mdio_rtl:1.0 mdio_3 ]
  set rgmii_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:rgmii_rtl:1.0 rgmii_0 ]
  set rgmii_1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:rgmii_rtl:1.0 rgmii_1 ]
  set rgmii_2 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:rgmii_rtl:1.0 rgmii_2 ]
  set rgmii_3 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:rgmii_rtl:1.0 rgmii_3 ]

  # Create ports
  set ext_rst [ create_bd_port -dir I -type rst ext_rst ]
  set_property -dict [ list CONFIG.POLARITY {ACTIVE_HIGH}  ] $ext_rst
  set phy_rst_n_0 [ create_bd_port -dir O -type rst phy_rst_n_0 ]
  set phy_rst_n_1 [ create_bd_port -dir O -type rst phy_rst_n_1 ]
  set phy_rst_n_2 [ create_bd_port -dir O -type rst phy_rst_n_2 ]
  set phy_rst_n_3 [ create_bd_port -dir O -type rst phy_rst_n_3 ]

  # Create instance: axi_dma_0, and set properties
  set axi_dma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0 ]
  set_property -dict [ list CONFIG.c_include_mm2s_dre {1} CONFIG.c_include_s2mm_dre {1} CONFIG.c_sg_use_stsapp_length {1}  ] $axi_dma_0

  # Create instance: axi_ethernet_0, and set properties
  set axi_ethernet_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_ethernet:6.0 axi_ethernet_0 ]
  set_property -dict [ list CONFIG.PHYADDR {1} CONFIG.PHY_TYPE {RGMII} CONFIG.Statistics_Counters {true} CONFIG.Statistics_Reset {false} CONFIG.Statistics_Width {32bit}  ] $axi_ethernet_0

  # Create instance: axi_ethernet_1, and set properties
  set axi_ethernet_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_ethernet:6.0 axi_ethernet_1 ]
  set_property -dict [ list CONFIG.PHYADDR {1} CONFIG.PHY_TYPE {RGMII} CONFIG.Statistics_Counters {true} CONFIG.Statistics_Reset {false} CONFIG.Statistics_Width {32bit} CONFIG.SupportLevel {0}  ] $axi_ethernet_1

  # Create instance: axi_ethernet_2, and set properties
  set axi_ethernet_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_ethernet:6.0 axi_ethernet_2 ]
  set_property -dict [ list CONFIG.PHYADDR {1} CONFIG.PHY_TYPE {RGMII} CONFIG.Statistics_Counters {true} CONFIG.Statistics_Reset {false} CONFIG.Statistics_Width {32bit} CONFIG.SupportLevel {0}  ] $axi_ethernet_2

  # Create instance: axi_ethernet_3, and set properties
  set axi_ethernet_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_ethernet:6.0 axi_ethernet_3 ]
  set_property -dict [ list CONFIG.PHYADDR {1} CONFIG.PHY_TYPE {RGMII} CONFIG.Statistics_Counters {true} CONFIG.Statistics_Reset {false} CONFIG.Statistics_Width {32bit} CONFIG.SupportLevel {0}  ] $axi_ethernet_3

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list CONFIG.NUM_MI {1} CONFIG.NUM_SI {3}  ] $axi_mem_intercon

  # Create instance: const_gnd, and set properties
  set const_gnd [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.0 const_gnd ]
  set_property -dict [ list CONFIG.CONST_VAL {0}  ] $const_gnd

  # Create instance: const_vcc, and set properties
  set const_vcc [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.0 const_vcc ]

  # Create instance: dma2eth_intercon_0, and set properties
  set dma2eth_intercon_0 [ create_bd_cell -type ip -vlnv meshsr:user:dma2eth_intercon:1.0 dma2eth_intercon_0 ]

  # Create instance: eth2dma_intercon_0, and set properties
  set eth2dma_intercon_0 [ create_bd_cell -type ip -vlnv meshsr:user:eth2dma_intercon:1.0 eth2dma_intercon_0 ]

  # Create instance: proc_sys_reset, and set properties
  set proc_sys_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset ]
  set_property -dict [ list CONFIG.C_AUX_RESET_HIGH {0}  ] $proc_sys_reset

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.3 processing_system7_0 ]
  set_property -dict [ list CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} CONFIG.PCW_ENET0_RESET_ENABLE {0} CONFIG.PCW_EN_CLK0_PORT {1} CONFIG.PCW_EN_CLK1_PORT {1} CONFIG.PCW_EN_CLK2_PORT {1} CONFIG.PCW_EN_CLK3_PORT {0} CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {125} CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {75} CONFIG.PCW_FPGA2_PERIPHERAL_FREQMHZ {200} CONFIG.PCW_FPGA3_PERIPHERAL_FREQMHZ {125} CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} CONFIG.PCW_IRQ_F2P_INTR {1} CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} CONFIG.PCW_SD0_GRP_CD_ENABLE {1} CONFIG.PCW_SD0_GRP_CD_IO {MIO 47} CONFIG.PCW_SD0_GRP_WP_ENABLE {1} CONFIG.PCW_SD0_GRP_WP_IO {MIO 46} CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} CONFIG.PCW_UART0_PERIPHERAL_ENABLE {0} CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {0.41} CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {0.411} CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {0.341} CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {0.358} CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {0.025} CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 {0.028} CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {-0.009} CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {-0.061} CONFIG.PCW_UIPARAM_DDR_TRAIN_DATA_EYE {1} CONFIG.PCW_UIPARAM_DDR_TRAIN_READ_GATE {1} CONFIG.PCW_UIPARAM_DDR_TRAIN_WRITE_LEVEL {1} CONFIG.PCW_UIPARAM_DDR_USE_INTERNAL_VREF {1} CONFIG.PCW_USB0_PERIPHERAL_ENABLE {1} CONFIG.PCW_USB0_RESET_ENABLE {0} CONFIG.PCW_USE_FABRIC_INTERRUPT {1} CONFIG.PCW_USE_S_AXI_HP0 {1} CONFIG.PCW_WDT_PERIPHERAL_ENABLE {0} CONFIG.preset {ZedBoard*}  ] $processing_system7_0

  # Create instance: processing_system7_0_axi_periph, and set properties
  set processing_system7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 processing_system7_0_axi_periph ]
  set_property -dict [ list CONFIG.NUM_MI {9}  ] $processing_system7_0_axi_periph

  # Create instance: ref_openflow_core_0, and set properties
  set ref_openflow_core_0 [ create_bd_cell -type ip -vlnv meshsr:user:ref_openflow_core:1.0 ref_openflow_core_0 ]

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:1.0 xlconcat_0 ]
  set_property -dict [ list CONFIG.NUM_PORTS {6}  ] $xlconcat_0

  # Create interface connections
  connect_bd_intf_net -intf_net axi_dma_0_m_axi_mm2s [get_bd_intf_pins axi_dma_0/M_AXI_MM2S] [get_bd_intf_pins axi_mem_intercon/S00_AXI]
  connect_bd_intf_net -intf_net axi_dma_0_m_axi_s2mm [get_bd_intf_pins axi_dma_0/M_AXI_S2MM] [get_bd_intf_pins axi_mem_intercon/S02_AXI]
  connect_bd_intf_net -intf_net axi_dma_0_m_axi_sg [get_bd_intf_pins axi_dma_0/M_AXI_SG] [get_bd_intf_pins axi_mem_intercon/S01_AXI]
  connect_bd_intf_net -intf_net axi_dma_0_m_axis_cntrl [get_bd_intf_pins axi_dma_0/M_AXIS_CNTRL] [get_bd_intf_pins dma2eth_intercon_0/s_txc_axis]
  connect_bd_intf_net -intf_net axi_dma_0_m_axis_mm2s [get_bd_intf_pins axi_dma_0/M_AXIS_MM2S] [get_bd_intf_pins dma2eth_intercon_0/s_txd_axis]
  connect_bd_intf_net -intf_net axi_ethernet_0_m_axis_rxd [get_bd_intf_pins axi_ethernet_0/m_axis_rxd] [get_bd_intf_pins ref_openflow_core_0/s_axis_rxd_0]
  connect_bd_intf_net -intf_net axi_ethernet_0_m_axis_rxs [get_bd_intf_pins axi_ethernet_0/m_axis_rxs] [get_bd_intf_pins ref_openflow_core_0/s_axis_rxs_0]
  connect_bd_intf_net -intf_net axi_ethernet_0_mdio [get_bd_intf_ports mdio_0] [get_bd_intf_pins axi_ethernet_0/mdio]
  connect_bd_intf_net -intf_net axi_ethernet_0_rgmii [get_bd_intf_ports rgmii_0] [get_bd_intf_pins axi_ethernet_0/rgmii]
  connect_bd_intf_net -intf_net axi_ethernet_1_m_axis_rxd [get_bd_intf_pins axi_ethernet_1/m_axis_rxd] [get_bd_intf_pins ref_openflow_core_0/s_axis_rxd_1]
  connect_bd_intf_net -intf_net axi_ethernet_1_m_axis_rxs [get_bd_intf_pins axi_ethernet_1/m_axis_rxs] [get_bd_intf_pins ref_openflow_core_0/s_axis_rxs_1]
  connect_bd_intf_net -intf_net axi_ethernet_1_mdio [get_bd_intf_ports mdio_1] [get_bd_intf_pins axi_ethernet_1/mdio]
  connect_bd_intf_net -intf_net axi_ethernet_1_rgmii [get_bd_intf_ports rgmii_1] [get_bd_intf_pins axi_ethernet_1/rgmii]
  connect_bd_intf_net -intf_net axi_ethernet_2_m_axis_rxd [get_bd_intf_pins axi_ethernet_2/m_axis_rxd] [get_bd_intf_pins ref_openflow_core_0/s_axis_rxd_2]
  connect_bd_intf_net -intf_net axi_ethernet_2_m_axis_rxs [get_bd_intf_pins axi_ethernet_2/m_axis_rxs] [get_bd_intf_pins ref_openflow_core_0/s_axis_rxs_2]
  connect_bd_intf_net -intf_net axi_ethernet_2_mdio [get_bd_intf_ports mdio_2] [get_bd_intf_pins axi_ethernet_2/mdio]
  connect_bd_intf_net -intf_net axi_ethernet_2_rgmii [get_bd_intf_ports rgmii_2] [get_bd_intf_pins axi_ethernet_2/rgmii]
  connect_bd_intf_net -intf_net axi_ethernet_3_m_axis_rxd [get_bd_intf_pins axi_ethernet_3/m_axis_rxd] [get_bd_intf_pins ref_openflow_core_0/s_axis_rxd_3]
  connect_bd_intf_net -intf_net axi_ethernet_3_m_axis_rxs [get_bd_intf_pins axi_ethernet_3/m_axis_rxs] [get_bd_intf_pins ref_openflow_core_0/s_axis_rxs_3]
  connect_bd_intf_net -intf_net axi_ethernet_3_mdio [get_bd_intf_ports mdio_3] [get_bd_intf_pins axi_ethernet_3/mdio]
  connect_bd_intf_net -intf_net axi_ethernet_3_rgmii [get_bd_intf_ports rgmii_3] [get_bd_intf_pins axi_ethernet_3/rgmii]
  connect_bd_intf_net -intf_net axi_mem_intercon_m00_axi [get_bd_intf_pins axi_mem_intercon/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net dma2eth_intercon_0_m_txc0_axis [get_bd_intf_pins dma2eth_intercon_0/m_txc0_axis] [get_bd_intf_pins ref_openflow_core_0/s_axis_mm2s_ctrl_0]
  connect_bd_intf_net -intf_net dma2eth_intercon_0_m_txc1_axis [get_bd_intf_pins dma2eth_intercon_0/m_txc1_axis] [get_bd_intf_pins ref_openflow_core_0/s_axis_mm2s_ctrl_1]
  connect_bd_intf_net -intf_net dma2eth_intercon_0_m_txc2_axis [get_bd_intf_pins dma2eth_intercon_0/m_txc2_axis] [get_bd_intf_pins ref_openflow_core_0/s_axis_mm2s_ctrl_2]
  connect_bd_intf_net -intf_net dma2eth_intercon_0_m_txc3_axis [get_bd_intf_pins dma2eth_intercon_0/m_txc3_axis] [get_bd_intf_pins ref_openflow_core_0/s_axis_mm2s_ctrl_3]
  connect_bd_intf_net -intf_net dma2eth_intercon_0_m_txd0_axis [get_bd_intf_pins dma2eth_intercon_0/m_txd0_axis] [get_bd_intf_pins ref_openflow_core_0/s_axis_mm2s_0]
  connect_bd_intf_net -intf_net dma2eth_intercon_0_m_txd1_axis [get_bd_intf_pins dma2eth_intercon_0/m_txd1_axis] [get_bd_intf_pins ref_openflow_core_0/s_axis_mm2s_1]
  connect_bd_intf_net -intf_net dma2eth_intercon_0_m_txd2_axis [get_bd_intf_pins dma2eth_intercon_0/m_txd2_axis] [get_bd_intf_pins ref_openflow_core_0/s_axis_mm2s_2]
  connect_bd_intf_net -intf_net dma2eth_intercon_0_m_txd3_axis [get_bd_intf_pins dma2eth_intercon_0/m_txd3_axis] [get_bd_intf_pins ref_openflow_core_0/s_axis_mm2s_3]
  connect_bd_intf_net -intf_net eth2dma_intercon_0_m_rxd_axis [get_bd_intf_pins axi_dma_0/S_AXIS_S2MM] [get_bd_intf_pins eth2dma_intercon_0/m_rxd_axis]
  set_property -dict [ list HDL_ATTRIBUTE.MARK_DEBUG {false}  ] [get_bd_intf_nets eth2dma_intercon_0_m_rxd_axis]
  connect_bd_intf_net -intf_net eth2dma_intercon_0_m_rxs_axis [get_bd_intf_pins axi_dma_0/S_AXIS_STS] [get_bd_intf_pins eth2dma_intercon_0/m_rxs_axis]
  set_property -dict [ list HDL_ATTRIBUTE.MARK_DEBUG {false}  ] [get_bd_intf_nets eth2dma_intercon_0_m_rxs_axis]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M01_AXI [get_bd_intf_pins processing_system7_0_axi_periph/M01_AXI] [get_bd_intf_pins ref_openflow_core_0/s_axi_lite]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_m00_axi [get_bd_intf_pins axi_dma_0/S_AXI_LITE] [get_bd_intf_pins processing_system7_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_m02_axi [get_bd_intf_pins axi_ethernet_0/s_axi] [get_bd_intf_pins processing_system7_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_m03_axi [get_bd_intf_pins axi_ethernet_1/s_axi] [get_bd_intf_pins processing_system7_0_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_m04_axi [get_bd_intf_pins axi_ethernet_2/s_axi] [get_bd_intf_pins processing_system7_0_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_m05_axi [get_bd_intf_pins axi_ethernet_3/s_axi] [get_bd_intf_pins processing_system7_0_axi_periph/M05_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_ddr [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_fixed_io [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_m_axi_gp0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins processing_system7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net ref_openflow_core_0_m_axis_s2mm_0 [get_bd_intf_pins eth2dma_intercon_0/s_rxd0_axis] [get_bd_intf_pins ref_openflow_core_0/m_axis_s2mm_0]
  connect_bd_intf_net -intf_net ref_openflow_core_0_m_axis_s2mm_1 [get_bd_intf_pins eth2dma_intercon_0/s_rxd1_axis] [get_bd_intf_pins ref_openflow_core_0/m_axis_s2mm_1]
  connect_bd_intf_net -intf_net ref_openflow_core_0_m_axis_s2mm_2 [get_bd_intf_pins eth2dma_intercon_0/s_rxd2_axis] [get_bd_intf_pins ref_openflow_core_0/m_axis_s2mm_2]
  connect_bd_intf_net -intf_net ref_openflow_core_0_m_axis_s2mm_3 [get_bd_intf_pins eth2dma_intercon_0/s_rxd3_axis] [get_bd_intf_pins ref_openflow_core_0/m_axis_s2mm_3]
  connect_bd_intf_net -intf_net ref_openflow_core_0_m_axis_s2mm_sts_0 [get_bd_intf_pins eth2dma_intercon_0/s_rxs0_axis] [get_bd_intf_pins ref_openflow_core_0/m_axis_s2mm_sts_0]
  connect_bd_intf_net -intf_net ref_openflow_core_0_m_axis_s2mm_sts_1 [get_bd_intf_pins eth2dma_intercon_0/s_rxs1_axis] [get_bd_intf_pins ref_openflow_core_0/m_axis_s2mm_sts_1]
  connect_bd_intf_net -intf_net ref_openflow_core_0_m_axis_s2mm_sts_2 [get_bd_intf_pins eth2dma_intercon_0/s_rxs2_axis] [get_bd_intf_pins ref_openflow_core_0/m_axis_s2mm_sts_2]
  connect_bd_intf_net -intf_net ref_openflow_core_0_m_axis_s2mm_sts_3 [get_bd_intf_pins eth2dma_intercon_0/s_rxs3_axis] [get_bd_intf_pins ref_openflow_core_0/m_axis_s2mm_sts_3]
  connect_bd_intf_net -intf_net ref_openflow_core_0_m_axis_txc_0 [get_bd_intf_pins axi_ethernet_0/s_axis_txc] [get_bd_intf_pins ref_openflow_core_0/m_axis_txc_0]
  connect_bd_intf_net -intf_net ref_openflow_core_0_m_axis_txd_0 [get_bd_intf_pins axi_ethernet_0/s_axis_txd] [get_bd_intf_pins ref_openflow_core_0/m_axis_txd_0]
  connect_bd_intf_net -intf_net ref_openflow_core_0_m_axis_txd_1 [get_bd_intf_pins axi_ethernet_1/s_axis_txd] [get_bd_intf_pins ref_openflow_core_0/m_axis_txd_1]
  connect_bd_intf_net -intf_net ref_openflow_core_0_m_axis_txd_2 [get_bd_intf_pins axi_ethernet_2/s_axis_txd] [get_bd_intf_pins ref_openflow_core_0/m_axis_txd_2]
  connect_bd_intf_net -intf_net ref_openflow_core_0_m_axis_txd_3 [get_bd_intf_pins axi_ethernet_3/s_axis_txd] [get_bd_intf_pins ref_openflow_core_0/m_axis_txd_3]
  connect_bd_intf_net -intf_net s_axis_txc_1 [get_bd_intf_pins axi_ethernet_1/s_axis_txc] [get_bd_intf_pins ref_openflow_core_0/m_axis_txc_1]
  connect_bd_intf_net -intf_net s_axis_txc_2 [get_bd_intf_pins axi_ethernet_2/s_axis_txc] [get_bd_intf_pins ref_openflow_core_0/m_axis_txc_2]
  connect_bd_intf_net -intf_net s_axis_txc_3 [get_bd_intf_pins axi_ethernet_3/s_axis_txc] [get_bd_intf_pins ref_openflow_core_0/m_axis_txc_3]

  # Create port connections
  connect_bd_net -net axi_dma_0_mm2s_introut [get_bd_pins axi_dma_0/mm2s_introut] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net axi_dma_0_s2mm_introut [get_bd_pins axi_dma_0/s2mm_introut] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net axi_ethernet_0_gtx_clk_out [get_bd_pins axi_ethernet_0/gtx_clk_out] [get_bd_pins axi_ethernet_1/gtx_clk] [get_bd_pins axi_ethernet_2/gtx_clk] [get_bd_pins axi_ethernet_3/gtx_clk]
  connect_bd_net -net axi_ethernet_0_interrupt [get_bd_pins axi_ethernet_0/interrupt] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net axi_ethernet_0_phy_rst_n [get_bd_ports phy_rst_n_0] [get_bd_pins axi_ethernet_0/phy_rst_n]
  connect_bd_net -net axi_ethernet_1_interrupt [get_bd_pins axi_ethernet_1/interrupt] [get_bd_pins xlconcat_0/In4]
  connect_bd_net -net axi_ethernet_1_phy_rst_n [get_bd_ports phy_rst_n_1] [get_bd_pins axi_ethernet_1/phy_rst_n]
  connect_bd_net -net axi_ethernet_2_interrupt [get_bd_pins axi_ethernet_2/interrupt] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net axi_ethernet_2_phy_rst_n [get_bd_ports phy_rst_n_2] [get_bd_pins axi_ethernet_2/phy_rst_n]
  connect_bd_net -net axi_ethernet_3_interrupt [get_bd_pins axi_ethernet_3/interrupt] [get_bd_pins xlconcat_0/In5]
  connect_bd_net -net axi_ethernet_3_phy_rst_n [get_bd_ports phy_rst_n_3] [get_bd_pins axi_ethernet_3/phy_rst_n]
  connect_bd_net -net const_gnd_const [get_bd_pins const_gnd/const] [get_bd_pins proc_sys_reset/mb_debug_sys_rst]
  connect_bd_net -net const_vcc_const [get_bd_pins const_vcc/const] [get_bd_pins proc_sys_reset/dcm_locked]
  connect_bd_net -net gtx_clk90_1 [get_bd_pins axi_ethernet_0/gtx_clk90_out] [get_bd_pins axi_ethernet_1/gtx_clk90] [get_bd_pins axi_ethernet_2/gtx_clk90] [get_bd_pins axi_ethernet_3/gtx_clk90]
  connect_bd_net -net proc_sys_reset_peripheral_aresetn [get_bd_pins axi_dma_0/axi_resetn] [get_bd_pins axi_ethernet_0/axi_rxd_arstn] [get_bd_pins axi_ethernet_0/axi_rxs_arstn] [get_bd_pins axi_ethernet_0/axi_txc_arstn] [get_bd_pins axi_ethernet_0/axi_txd_arstn] [get_bd_pins axi_ethernet_0/s_axi_lite_resetn] [get_bd_pins axi_ethernet_1/axi_rxd_arstn] [get_bd_pins axi_ethernet_1/axi_rxs_arstn] [get_bd_pins axi_ethernet_1/axi_txc_arstn] [get_bd_pins axi_ethernet_1/axi_txd_arstn] [get_bd_pins axi_ethernet_1/s_axi_lite_resetn] [get_bd_pins axi_ethernet_2/axi_rxd_arstn] [get_bd_pins axi_ethernet_2/axi_rxs_arstn] [get_bd_pins axi_ethernet_2/axi_txc_arstn] [get_bd_pins axi_ethernet_2/axi_txd_arstn] [get_bd_pins axi_ethernet_2/s_axi_lite_resetn] [get_bd_pins axi_ethernet_3/axi_rxd_arstn] [get_bd_pins axi_ethernet_3/axi_rxs_arstn] [get_bd_pins axi_ethernet_3/axi_txc_arstn] [get_bd_pins axi_ethernet_3/axi_txd_arstn] [get_bd_pins axi_ethernet_3/s_axi_lite_resetn] [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins axi_mem_intercon/S01_ARESETN] [get_bd_pins axi_mem_intercon/S02_ARESETN] [get_bd_pins dma2eth_intercon_0/aresetn] [get_bd_pins eth2dma_intercon_0/aresetn] [get_bd_pins proc_sys_reset/peripheral_aresetn] [get_bd_pins processing_system7_0_axi_periph/ARESETN] [get_bd_pins processing_system7_0_axi_periph/M00_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M01_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M02_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M03_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M04_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M05_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M06_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M07_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M08_ARESETN] [get_bd_pins processing_system7_0_axi_periph/S00_ARESETN] [get_bd_pins ref_openflow_core_0/s_axi_lite_aresetn] [get_bd_pins ref_openflow_core_0/s_axis_mm2s_aresetn] [get_bd_pins ref_openflow_core_0/s_axis_rxd_aresetn] [get_bd_pins ref_openflow_core_0/s_axis_s2mm_aresetn] [get_bd_pins ref_openflow_core_0/s_axis_txd_aresetn]
  connect_bd_net -net processing_system7_0_fclk_clk1 [get_bd_pins axi_dma_0/m_axi_mm2s_aclk] [get_bd_pins axi_dma_0/m_axi_s2mm_aclk] [get_bd_pins axi_dma_0/m_axi_sg_aclk] [get_bd_pins axi_dma_0/s_axi_lite_aclk] [get_bd_pins axi_ethernet_0/axis_clk] [get_bd_pins axi_ethernet_0/gtx_clk] [get_bd_pins axi_ethernet_0/s_axi_lite_clk] [get_bd_pins axi_ethernet_1/axis_clk] [get_bd_pins axi_ethernet_1/s_axi_lite_clk] [get_bd_pins axi_ethernet_2/axis_clk] [get_bd_pins axi_ethernet_2/s_axi_lite_clk] [get_bd_pins axi_ethernet_3/axis_clk] [get_bd_pins axi_ethernet_3/s_axi_lite_clk] [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins axi_mem_intercon/S01_ACLK] [get_bd_pins axi_mem_intercon/S02_ACLK] [get_bd_pins dma2eth_intercon_0/aclk] [get_bd_pins eth2dma_intercon_0/aclk] [get_bd_pins proc_sys_reset/slowest_sync_clk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins processing_system7_0_axi_periph/ACLK] [get_bd_pins processing_system7_0_axi_periph/M00_ACLK] [get_bd_pins processing_system7_0_axi_periph/M01_ACLK] [get_bd_pins processing_system7_0_axi_periph/M02_ACLK] [get_bd_pins processing_system7_0_axi_periph/M03_ACLK] [get_bd_pins processing_system7_0_axi_periph/M04_ACLK] [get_bd_pins processing_system7_0_axi_periph/M05_ACLK] [get_bd_pins processing_system7_0_axi_periph/M06_ACLK] [get_bd_pins processing_system7_0_axi_periph/M07_ACLK] [get_bd_pins processing_system7_0_axi_periph/M08_ACLK] [get_bd_pins processing_system7_0_axi_periph/S00_ACLK] [get_bd_pins ref_openflow_core_0/s_axi_lite_aclk] [get_bd_pins ref_openflow_core_0/s_axis_mm2s_aclk] [get_bd_pins ref_openflow_core_0/s_axis_rxd_aclk] [get_bd_pins ref_openflow_core_0/s_axis_s2mm_aclk] [get_bd_pins ref_openflow_core_0/s_axis_txd_aclk]
  connect_bd_net -net processing_system7_0_fclk_clk2 [get_bd_pins axi_ethernet_0/ref_clk] [get_bd_pins processing_system7_0/FCLK_CLK2]
  connect_bd_net -net processing_system7_0_fclk_reset0_n [get_bd_pins proc_sys_reset/aux_reset_in] [get_bd_pins processing_system7_0/FCLK_RESET0_N]
  connect_bd_net -net reset_rtl_1 [get_bd_ports ext_rst] [get_bd_pins proc_sys_reset/ext_reset_in]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins processing_system7_0/IRQ_F2P] [get_bd_pins xlconcat_0/dout]

  # Create address segments
  create_bd_addr_seg -range 0x20000000 -offset 0x0 [get_bd_addr_spaces axi_dma_0/Data_SG] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x20000000 -offset 0x0 [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x20000000 -offset 0x0 [get_bd_addr_spaces axi_dma_0/Data_S2MM] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x1000 -offset 0x0 [get_bd_addr_spaces axi_ethernet_0/eth_buf/S_AXI_2TEMAC] [get_bd_addr_segs axi_ethernet_0/eth_mac/s_axi/Reg] SEG_eth_mac_Reg
  create_bd_addr_seg -range 0x1000 -offset 0x0 [get_bd_addr_spaces axi_ethernet_1/eth_buf/S_AXI_2TEMAC] [get_bd_addr_segs axi_ethernet_1/eth_mac/s_axi/Reg] SEG_eth_mac_Reg
  create_bd_addr_seg -range 0x1000 -offset 0x0 [get_bd_addr_spaces axi_ethernet_2/eth_buf/S_AXI_2TEMAC] [get_bd_addr_segs axi_ethernet_2/eth_mac/s_axi/Reg] SEG_eth_mac_Reg
  create_bd_addr_seg -range 0x1000 -offset 0x0 [get_bd_addr_spaces axi_ethernet_3/eth_buf/S_AXI_2TEMAC] [get_bd_addr_segs axi_ethernet_3/eth_mac/s_axi/Reg] SEG_eth_mac_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40400000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_dma_0/S_AXI_LITE/Reg] SEG_axi_dma_0_Reg
  create_bd_addr_seg -range 0x40000 -offset 0x43C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_ethernet_0/eth_buf/S_AXI/REG] SEG_eth_buf_REG
  create_bd_addr_seg -range 0x40000 -offset 0x43C40000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_ethernet_1/eth_buf/S_AXI/REG] SEG_eth_buf_REG2
  create_bd_addr_seg -range 0x40000 -offset 0x43C80000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_ethernet_2/eth_buf/S_AXI/REG] SEG_eth_buf_REG4
  create_bd_addr_seg -range 0x40000 -offset 0x43CC0000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_ethernet_3/eth_buf/S_AXI/REG] SEG_eth_buf_REG6
  create_bd_addr_seg -range 0x8000000 -offset 0x48000000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs ref_openflow_core_0/s_axi_lite/reg0] SEG_ref_openflow_core_0_reg0
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


