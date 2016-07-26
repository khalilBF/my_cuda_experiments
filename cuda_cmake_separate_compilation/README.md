#CUDA seperate compilation example

The project tackles the task of compiling CUDA kernels seperately from main file and using them in a .cpp file instead of a .cu one. In addition to that, we want to use default cmake function (add_executable) to generate the executable instead of find_cuda function (cuda_add_executable).

The traditional fashion for doing this is to declare functions in header and source files and call them from main. Functions will be compiled into a library and linked to the generated executable. 

With CUDA, this task isn't obvious. Several changes must be taken into account.
  - A kernel wrapper must be prepared to bake all gpu functions into a cpu-callable function 
  - The kernel must be undecleared in .h file
  - In the source file (.cu), extern "C" must preceed the kernel to make it visible to main.cpp
  - In CMakeLists.txt, the functions can be compiled into a library, and then linked to the target in a classic way
  
This project is useful for anyone who wants to create superfast gpu functions, precompile them into libraries for further use, and link them in a classic fashion to any other c++ project.

Enjoy !
