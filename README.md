 Measuring the floating point performance of your machine

Matrix-Matrix multiplication is often used to benchmark machines because the mathematics is such that it is one of the few operations where one can obtain close to theoretical peak performance in pratice.

The number of floating point operations(Flops) in a Matrix-Matrix multiplication of two $N$ x $N$ matrices is given by $2N^3-N^2$ (See http://www2.hawaii.edu/~norbert/CompPhys/compphysicsch10.html for details of how this was determined).

For this benchmark, we construct two random $N$ x $N$ matrices and time how long it takes to multiply them together, $t$. We then compute the number of Gigaflops/s exhibited by that operation via $\frac{2N^3-N^2}{t*10^9}$. We do this several times for any given $N$ and record the average and the best (peak) results obtained.  $N$ is then varied from 250 to 10,000 in steps of 250 to see how performance varies with matrix size.  Usually, the highest performance is obtained by multiplying large matrices together.

For highest performance, you should use a version of numpy that has been linked against a high performance BLAS library such as [OpenBLAS](http://www.openblas.net/) or the Intel MKL(https://software.intel.com/en-us/intel-mkl). The [Anaconda Python](https://www.continuum.io/downloads) distribution includes the Intel MKL by default on Windows and Linux (Mac includes its own high performance BLAS library).
