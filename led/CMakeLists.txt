# Generated Cmake Pico project file

cmake_minimum_required(VERSION 3.13)

if(NOT CMAKE_GENERATOR)
  set(CMAKE_GENERATOR "Unix Makefiles" CACHE INTERNAL "" FORCE)
endif()

# Pull in toolchain
include(${CMAKE_CURRENT_SOURCE_DIR}/toolchain.cmake)
set(CMAKE_C_STANDARD 11)

set(CMAKE_CXX_STANDARD 17)
# Initialise pico_sdk from installed location
# (note this can come from environment, CMake cache etc)
set(PICO_SDK_PATH "C:/pico-sdk")
set(PICO_BOARD pico CACHE STRING "Board type")

# Pull in Raspberry Pi Pico SDK (must be before project)
include(pico_sdk_import.cmake)

if (PICO_SDK_VERSION_STRING VERSION_LESS "1.4.0")
  message(FATAL_ERROR "Raspberry Pi Pico SDK version 1.4.0 (or later) required. Your version is ${PICO_SDK_VERSION_STRING}")
endif()

project(led C CXX ASM)

# Initialise the Raspberry Pi Pico SDK
pico_sdk_init()

# Add executable. Default name is the project name, version 0.1

add_executable(led led.cpp )

pico_set_program_name(led "led")
pico_set_program_version(led "0.1")

# no_flash means the target is to run from RAM
pico_set_binary_type(led no_flash)

pico_enable_stdio_uart(led 1)
pico_enable_stdio_usb(led 0)

# Add the standard library to the build
target_link_libraries(led
        pico_stdlib)

# Add the standard include files to the build
target_include_directories(led PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}
  ${CMAKE_CURRENT_LIST_DIR}/.. # for our common lwipopts or any other standard includes, if required
)

# Add any user requested libraries
target_link_libraries(led
        hardware_clocks
        )

add_compile_options(
  -Wall
  -Wno-format          # int != int32_t as far as the compiler is concerned because gcc has int32_t as long int
  -Wno-unused-function # we have some for the docs that aren't called
  -Wno-maybe-uninitialized
  )
        
pico_add_extra_outputs(led)

