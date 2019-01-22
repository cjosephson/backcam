quietly set ACTELLIBNAME IGLOO
quietly set PROJECT_DIR "C:/Users/pyzhang/Desktop/working/backscatter-fpga"

if {[file exists postsynth/_info]} {
   echo "INFO: Simulation library postsynth already exists"
} else {
   file delete -force postsynth 
   vlib postsynth
}
vmap postsynth postsynth
vmap igloo "C:/Microsemi/Libero_SoC_v11.8/Designer/lib/modelsim/precompiled/vlog/igloo"

vlog -vlog01compat -work postsynth "${PROJECT_DIR}/synthesis/top.v"
vlog "+incdir+${PROJECT_DIR}/stimulus" -vlog01compat -work postsynth "${PROJECT_DIR}/stimulus/top_tb.v"

vsim -L igloo -L postsynth  -t 1ps postsynth.top_tb
add wave /top_tb/*
add log -r /*
run 10us
