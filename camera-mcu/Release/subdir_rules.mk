################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
main.obj: ../main.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/bin/cl430" -vmspx --code_model=large --data_model=large --near_data=none -O2 --use_hw_mpy=F5 --include_path="/Users/cjoseph/Documents/research/backcam/camera-mcu/FatFs" --include_path="/Users/cjoseph/Documents/research/backcam/camera-mcu/HAL" --include_path="/Users/cjoseph/Documents/research/backcam/camera-mcu/SDCardLib" --include_path="/Applications/ti/ccsv7/ccs_base/msp430/include" --include_path="/Users/cjoseph/Documents/research/backcam/camera-mcu" --include_path="/Users/cjoseph/Documents/research/backcam/camera-mcu/driverlib/MSP430FR5xx_6xx" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include" --advice:power="all" --advice:hw_config="all" --define=__MSP430FR5994__ --printf_support=minimal --diag_warning=225 --diag_wrap=off --display_error_number --silicon_errata=CPU21 --silicon_errata=CPU22 --silicon_errata=CPU40 --preproc_with_compile --preproc_dependency="main.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '


