/*
 * myKernels.h
 *
 *  Created on: 2016-07-22
 *      Author: khalil
 */

#ifndef MYKERNELS_H_
#define MYKERNELS_H_
float *gpuReciprocal(float *data, unsigned size);

float *cpuReciprocal(float *data, unsigned size);
void initialize(float *data, unsigned size);
#endif /* MYKERNELS_H_ */


