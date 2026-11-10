cmake_minimum_required(VERSION 3.31)
project(hello-world LANGUAGES CXX)

# ==============================================================================
# CXX standard and compiler flag configurations
# ==============================================================================
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF) 

# Define standard build type if not set and save into CMakeCache 
if(NOT CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE Debug CACHE STRING "Define CMAKE_BUILD_TYPE: Debug|Release" FORCE)
endif()

# Set compiler flags for specific toolchains
if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    add_compile_options(-pedantic -Wall -Wextra)
elseif(MSVC)
    add_compile_options(/W4)
endif()

# ==============================================================================
# Executable target, sources and compile directives
# ==============================================================================

set(INCLUDE_DIR
	"${PROJECT_SOURCE_DIR}/include"
)

set(INCLUDE_FILES
	"${INCLUDE_DIR}/logging.h"
)

set(SOURCE_DIR 
	"${PROJECT_SOURCE_DIR}/src"
)

set(SOURCE_FILES
	"${SOURCE_DIR}/main.cpp"
)

add_executable(exec "${SOURCE_FILES}" "${INCLUDE_FILES}")

target_include_directories(exec PRIVATE "${INCLUDE_DIR}")

target_compile_definitions(exec PRIVATE
    VERSAO_APP=\"V.1.0\"
    $<$<CONFIG:Debug>:YDEBUG>   
    $<$<CONFIG:Release>:NDEBUG> 
)

# ==============================================================================
# Library target, sources and dependencies
# ==============================================================================

#set(LIB_SOURCE_DIR 
#	"${PROJECT_SOURCE_DIR}/lib/src"
#)

#set(LIB_SOURCES
#	"${LIB_SOURCE_DIR}/minhalib.cpp"
#)

#set(LIB_INCLUDE_DIR 
#	"${PROJECT_SOURCE_DIR}/lib/include"
#)

#set(LIB_INCLUDES
#	"${LIB_INCLUDE_DIR}/minhalib.h"
#)

#build my own library
#add_library(minhalib STATIC "${LIB_SOURCES}" "${LIB_INCLUDES}")

#target_include_directories(minhalib PUBLIC "${LIB_INCLUDE_DIR}")

#find 3rd party libraries
#find_package(Threads REQUIRED)

#add header-only libraries
#add_library(lib_json INTERFACE) 

#target_include_directories(lib_json INTERFACE "${LIB_INCLUDE_DIR}")

# ==============================================================================
# Final linkage and output generation
# ==============================================================================
target_link_libraries(exec 
	#PRIVATE minhalib 
	#Threads::Threads 
	#lib_json
)
