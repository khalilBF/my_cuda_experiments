cmake_minimum_required (VERSION 2.6)

project (cudaSeperateCompilation)

#set executable name
set(EXECUTABLE reciprocal_gpu)

#find cuda
find_package(CUDA REQUIRED)

#Append options to nvcc
list(APPEND CUDA_NVCC_FLAGS -gencode arch=compute_20,code=sm_20)

#Define some cool variables
set(HEADERS myKernels.h)
set(SRC_KERNELS myKernels.cu)
set(SOURCES main.cpp)

#build directory
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build)

#create kernel wrapper's library
cuda_add_library(myGPUFunction ${SRC_KERNELS} SHARED)

#Create executable
add_executable(     ${EXECUTABLE}
		    ${SOURCES}
		    )
target_link_libraries(  ${EXECUTABLE}
			myGPUFunction
		        ${CUDA_LIBRARIES}
			)
