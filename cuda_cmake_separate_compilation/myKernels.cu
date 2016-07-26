#include <iostream>
#include <numeric>
#include <stdlib.h>
#include "myKernels.h"

// extern "C" is required to make .cpp files recognize and use the kernel
extern "C" __global__ void reciprocalKernel(float *data, unsigned vectorSize) {
	unsigned idx = blockIdx.x*blockDim.x+threadIdx.x;
	if (idx < vectorSize)
		data[idx] = 1.0/data[idx];
}

float *gpuReciprocal(float *data, unsigned size)
{
	float *rc = new float[size];
	float *gpuData;


	cudaMalloc((void **)&gpuData, sizeof(float)*size);
	cudaMemcpy(gpuData, data, sizeof(float)*size, cudaMemcpyHostToDevice);

	static const int BLOCK_SIZE = 256;
	const int blockCount = (size+BLOCK_SIZE-1)/BLOCK_SIZE;
	reciprocalKernel<<<blockCount, BLOCK_SIZE>>> (gpuData, size);

	//CUDA_CHECK_RETURN(cudaMemcpy(rc, gpuData, sizeof(float)*size, cudaMemcpyDeviceToHost));
	//CUDA_CHECK_RETURN(cudaFree(gpuData));
	cudaMemcpy(rc, gpuData, sizeof(float)*size, cudaMemcpyDeviceToHost);
	cudaFree(gpuData);

	return rc;
}

float *cpuReciprocal(float *data, unsigned size)
{
	float *rc = new float[size];
	for (unsigned cnt = 0; cnt < size; ++cnt) rc[cnt] = 1.0/data[cnt];
	return rc;
}
void initialize(float *data, unsigned size)
{
	for (unsigned i = 0; i < size; ++i)
		data[i] = .5*(i+1);
}


