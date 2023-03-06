cmake_minimum_required(VERSION 3.12)

SET(CMAKE_EXE_LINKER_FLAGS_DEBUG "-Wl,--print-memory-usage")
SET(CMAKE_EXE_LINKER_FLAGS_RELEASE "-Wl,--print-memory-usage")
# Set policy CMP0126 to OLD to suppress warning in pico_sdk_init.cmake
if(POLICY CMP0126)
  cmake_policy(SET CMP0126 OLD)
endif()

set(PICO_PLATFORM "rp2040")
# Pull in SDK (must be before project)
include(toolchain.cmake)
include(pico_sdk_import.cmake)

project(main C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

if (PICO_SDK_VERSION_STRING VERSION_LESS "1.3.0")
    message(FATAL_ERROR "Raspberry Pi Pico SDK version 1.3.0 (or later) required. Your version is ${PICO_SDK_VERSION_STRING}")
endif()

# Initialize the SDK
pico_sdk_init()

add_compile_options(-Wall
        -Wno-format          # int != int32_t as far as the compiler is concerned because gcc has int32_t as long int
        -Wno-unused-function # we have some for the docs that aren't called
        -Wno-maybe-uninitialized
        )

add_executable(main
    src/main.cpp
    src/led.cpp
)

target_link_libraries(main
  pico_stdlib
  hardware_gpio
  hardware_adc
  pico_time 
)

target_include_directories(main PRIVATE
  include
)

# create map/bin/hex file etc.
pico_add_extra_outputs(main)