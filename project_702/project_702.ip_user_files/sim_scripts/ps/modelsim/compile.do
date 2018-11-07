vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/smartconnect_v1_0
vlib modelsim_lib/msim/axi_protocol_checker_v2_0_3
vlib modelsim_lib/msim/axi_vip_v1_1_3
vlib modelsim_lib/msim/processing_system7_vip_v1_0_5
vlib modelsim_lib/msim/xil_defaultlib

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap smartconnect_v1_0 modelsim_lib/msim/smartconnect_v1_0
vmap axi_protocol_checker_v2_0_3 modelsim_lib/msim/axi_protocol_checker_v2_0_3
vmap axi_vip_v1_1_3 modelsim_lib/msim/axi_vip_v1_1_3
vmap processing_system7_vip_v1_0_5 modelsim_lib/msim/processing_system7_vip_v1_0_5
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xilinx_vip -64 -incr -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/ec67/hdl" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/5bb9/hdl/verilog" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/70fd/hdl" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/ec67/hdl" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/5bb9/hdl/verilog" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/70fd/hdl" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/ec67/hdl" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/5bb9/hdl/verilog" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/70fd/hdl" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../project_702.srcs/sources_1/bd/ps/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/ec67/hdl" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/5bb9/hdl/verilog" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/70fd/hdl" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/ec67/hdl" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/5bb9/hdl/verilog" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/70fd/hdl" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../project_702.srcs/sources_1/bd/ps/ipshared/5bb9/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v2_0_3 -64 -incr -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/ec67/hdl" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/5bb9/hdl/verilog" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/70fd/hdl" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/ec67/hdl" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/5bb9/hdl/verilog" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/70fd/hdl" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../project_702.srcs/sources_1/bd/ps/ipshared/03a9/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \

vlog -work axi_vip_v1_1_3 -64 -incr -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/ec67/hdl" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/5bb9/hdl/verilog" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/70fd/hdl" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/ec67/hdl" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/5bb9/hdl/verilog" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/70fd/hdl" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../project_702.srcs/sources_1/bd/ps/ipshared/b9a8/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_5 -64 -incr -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/ec67/hdl" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/5bb9/hdl/verilog" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/70fd/hdl" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/ec67/hdl" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/5bb9/hdl/verilog" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/70fd/hdl" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../project_702.srcs/sources_1/bd/ps/ipshared/70fd/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/ec67/hdl" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/5bb9/hdl/verilog" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/70fd/hdl" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/ec67/hdl" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/5bb9/hdl/verilog" "+incdir+../../../../project_702.srcs/sources_1/bd/ps/ipshared/70fd/hdl" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/ps/ip/ps_processing_system7_0_0/sim/ps_processing_system7_0_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/ps/sim/ps.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

