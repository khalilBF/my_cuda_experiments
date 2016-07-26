#include <iostream>
#include <numeric>
#include <stdlib.h>
#include "myKernels.h"


int main(void)
{
	static const int WORK_SIZE = 65530;
	float *data = new float[WORK_SIZE];

	initialize (data, WORK_SIZE);

	float *recCpu = cpuReciprocal(data, WORK_SIZE);
	float *recGpu = gpuReciprocal(data, WORK_SIZE);
	float cpuSum = std::accumulate (recCpu, recCpu+WORK_SIZE, 0.0);
	float gpuSum = std::accumulate (recGpu, recGpu+WORK_SIZE, 0.0);

	/* Verify the results */
	std::cout<<"gpuSum = "<<gpuSum<< " cpuSum = " <<cpuSum<<std::endl;

	/* Free memory */
	delete[] data;
	delete[] recCpu;
	delete[] recGpu;

	return 0;
}


