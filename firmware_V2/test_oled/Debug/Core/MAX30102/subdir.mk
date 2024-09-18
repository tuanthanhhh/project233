################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/MAX30102/max30102.c 

OBJS += \
./Core/MAX30102/max30102.o 

C_DEPS += \
./Core/MAX30102/max30102.d 


# Each subdirectory must supply rules for building sources it contributes
Core/MAX30102/%.o Core/MAX30102/%.su Core/MAX30102/%.cyclo: ../Core/MAX30102/%.c Core/MAX30102/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/LE TUAN THANH/Desktop/New folder/test_v2/project233/firmware_V2/test_oled/Core/OLED" -I"C:/Users/LE TUAN THANH/Desktop/New folder/test_v2/project233/firmware_V2/test_oled/Core/MAX30102" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-MAX30102

clean-Core-2f-MAX30102:
	-$(RM) ./Core/MAX30102/max30102.cyclo ./Core/MAX30102/max30102.d ./Core/MAX30102/max30102.o ./Core/MAX30102/max30102.su

.PHONY: clean-Core-2f-MAX30102

