############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
############################################################
set project_folder_name "test_fast_v2"
open_project ${project_folder_name}
set_top fast_accel

set XF_PROJ_ROOT "/home/zhao/work_fast/hls/${project_folder_name}" 
set OPENCV_INCLUDE "/usr/local/include/opencv4" 
set OPENCV_LIB "/usr/local/lib" 
set OPENCV_LIB_REF   "-lopencv_imgcodecs -lopencv_imgproc -lopencv_core -lopencv_highgui -lopencv_flann -lopencv_features2d"
set OPENCV_INC_FLAGS "-I$OPENCV_INCLUDE"
set OPENCV_LIB_FLAGS "-L$OPENCV_LIB"

add_files ${project_folder_name}/xf_fast_accel.cpp -cflags "-I../libs/Vitis_Libraries/vision/L1/include" -csimflags "-I../libs/Vitis_Libraries/vision/L1/include  -std=c++0x"
add_files -tb ${project_folder_name}/xf_fast_tb.cpp -cflags "-I../libs/Vitis_Libraries/vision/L1/include ${OPENCV_INC_FLAGS} -std=c++0x" -csimflags "-I../libs/Vitis_Libraries/vision/L1/include ${OPENCV_INC_FLAGS} -std=c++0x "

open_solution "solution1" -flow_target vivado
# set_part {xazu2eg-sfvc784-1-i}
set_part {xczu15eg-ffvb1156-2-i}
create_clock -period 10 -name default

config_interface -m_axi_max_widen_bitwidth=128
# config_interface -m_axi_latency=64

# config_rtl -register_reset_num=3
# config_interface -default_slave_interface=s_axilite -m_axi_latency=64  -m_axi_alignment_byte_size=64 -m_axi_max_widen_bitwidth=128 -m_axi_offset=slave 

# config_rtl -reset state
# csim_design -clean -ldflags  "-L ${OPENCV_LIB} ${OPENCV_LIB_REF}" 
csynth_design
# cosim_design -ldflags "-L ${OPENCV_LIB} ${OPENCV_LIB_REF} -D __SYNTHESIS__"  -tool xsim -wave_debug -enable_dataflow_profiling -enable_fifo_sizing -rtl verilog -trace_level all
# export_design -format ip_catalog
# export_design -flow impl -format xo
