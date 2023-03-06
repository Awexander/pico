set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

#set(TOOLCHAIN_PATH "C:/\"Program Files (x86)\"/\"Arm GNU Toolchain arm-none-eabi\"/\"12.2 rel1\"/bin")
set(TOOLCHAIN_PATH "C:/Program Files (x86)/Arm GNU Toolchain arm-none-eabi/12.2 rel1/bin/")

# specify the cross compiler
set(CMAKE_C_COMPILER ${TOOLCHAIN_PATH}arm-none-eabi-gcc.exe)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PATH}arm-none-eabi-g++.exe)
set(CMAKE_ASM_COMPILER ${TOOLCHAIN_PATH}arm-none-eabi-gcc.exe)
set(CMAKE_OBJCOPY ${TOOLCHAIN_PATH}arm-none-eabi-objcopy.exe)
set(CMAKE_OBJDUMP ${TOOLCHAIN_PATH}arm-none-eabi-objdump.exe)

# set the linker
set(CMAKE_LINKER ${TOOLCHAIN_PATH}arm-none-eabi-ld.exe)

# set the path to the libraries and include directories
set(CMAKE_FIND_ROOT_PATH ${TOOLCHAIN_PATH})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
