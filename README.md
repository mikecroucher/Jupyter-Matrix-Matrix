# Measuring the floating point performance of your machine

[Matrix-Matrix multiplication](https://en.wikipedia.org/wiki/Matrix_multiplication) is often used to benchmark machines because the mathematics is such that it is one of the few operations where one can obtain close to theoretical peak performance in pratice.

The number of floating point operations(Flops) in a Matrix-Matrix multiplication of two $N$ x $N$ matrices is given by $2N^3-N^2$ (See http://www2.hawaii.edu/~norbert/CompPhys/compphysicsch10.html for details of how this was determined).

For this benchmark, we construct two random $N$ x $N$ matrices and time how long it takes to multiply them together, $t$. We then compute the number of Gigaflops/s exhibited by that operation via $\frac{2N^3-N^2}{t*10^9}$. We do this several times for any given $N$ and record the average and the best (peak) results obtained.  $N$ is then varied from 250 to 10,000 in steps of 250 to see how performance varies with matrix size.  Usually, the highest performance is obtained by multiplying large matrices together.

For highest performance, you should use a version of numpy that has been linked against a high performance BLAS library such as [OpenBLAS](http://www.openblas.net/) or the Intel MKL(https://software.intel.com/en-us/intel-mkl). The [Anaconda Python](https://www.continuum.io/downloads) distribution includes the Intel MKL by default on Windows and Linux (Mac includes its own high performance BLAS library).

# Results

If you look at individual results notebooks you'll notice that the notebooks have evolved a little over time.  The core computation is always the same though.

## Cloud 

* Azure Notebook, May 2017, Max size 1000x1000, 263 Gflops
* Amazon c4x4xlarge, September 2017, Max size 10000x10000, 333 Gflops
* Amazon c5x18xlarge, November 2017, Max size 10000x10000, 1366 Gflops

## Laptops

* Mid 2014 Macbook Pro, May 2017, Max Size 10000x10000, 169 Gflops
* [Dell XPS9560](results/laptops/Dell_XPS9560.ipynb), May 2017, Max size 10000x10000, 141 Gflops

## HPC Clusters

Results from various traditional HPC Clusters.



