new_project \
    -name {top} \
    -location {Z:\fpga_vision\test_tmp\designer\impl1\top_fp} \
    -mode {single}
set_programming_file -file {Z:\fpga_vision\test_tmp\designer\impl1\top.pdb}
set_programming_action -action {PROGRAM}
catch {run_selected_actions} return_val
save_project
close_project
if { $return_val != 0 } {
  exit 1 }
