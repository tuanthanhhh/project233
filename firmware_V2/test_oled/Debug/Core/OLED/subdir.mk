################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/OLED/fonts.c \
../Core/OLED/ssd1306.c 

OBJS += \
./Core/OLED/fonts.o \
./Core/OLED/ssd1306.o 

C_DEPS += \
./Core/OLED/fonts.d \
./Core/OLED/ssd1306.d 


# Each subdirectory must supply rules for building sources it contributes
Core/OLED/%.o Core/OLED/%.su Core/OLED/%.cyclo: ../Core/OLED/%.c Core/OLED/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/LE TUAN THANH/Desktop/New folder/test_v2/project233/firmware_V2/test_oled/Core/OLED" -I"C:/Users/LE TUAN THANH/Desktop/New folder/test_v2/project233/firmware_V2/test_oled/Core/MAX30102" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-OLED

clean-Core-2f-OLED:
	-$(RM) ./Core/OLED/fonts.cyclo ./Core/OLED/fonts.d ./Core/OLED/fonts.o ./Core/OLED/fonts.su ./Core/OLED/ssd1306.cyclo ./Core/OLED/ssd1306.d ./Core/OLED/ssd1306.o ./Core/OLED/ssd1306.su

.PHONY: clean-Core-2f-OLED

