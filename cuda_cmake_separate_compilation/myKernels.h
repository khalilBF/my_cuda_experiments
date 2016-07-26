#ifndef MYKERNELS_H_
#define MYKERNELS_H_

// the kernel wrapper
float *gpuReciprocal(float *data, unsigned size);

// some cpu functions for validation
float *cpuReciprocal(float *data, unsigned size);
void initialize(float *data, unsigned size);
#endif /* MYKERNELS_H_ */
