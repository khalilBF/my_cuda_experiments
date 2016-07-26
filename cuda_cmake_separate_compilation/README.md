#CUDA seperate compilation example

##Main goal
The project tackles the task of compiling CUDA kernels **separately** from main file and using them in a **.cpp** file instead of a .cu one. In addition to that, we want to use default CMAKE function (**_add_executable_**) to generate the executable instead of cuda function (*cuda_add_executable*).

##The adopted approach
The traditional fashion for doing separate compilation is to declare functions in header and source files and call them from main. Functions will be compiled into a library and linked to the generated executable. 

##Practical steps
With CUDA, seperate compilation task isn't obvious. Several changes must be taken into account.
  - A kernel wrapper must be prepared to bake all GPU functions into a CPU-callable function 
  - The kernel must be undeclared in .h file
  - In the source file (.cu), extern "C" must precede the kernel to make it visible to main.cpp
  - In CMakeLists.txt, the functions can be compiled into a library, and then linked to the target in a classic way
  
##Usefulness of the example
This project is useful for anyone who wants to create superfast GPU functions, precompile them into libraries for further use, and link them in a classic fashion to any other c++ project.

Enjoy !
