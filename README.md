# Measuring the floating point performance of your machine
Like many people, I've had access to a bunch of machines over the years and I wanted to keep a record of their performance.  Think of this as a personal diary of the performance of some machine I've played with.

## Matrix-Matrix multiplication

[Matrix-Matrix multiplication](https://en.wikipedia.org/wiki/Matrix_multiplication) is often used to benchmark machines because the mathematics is such that it is one of the few operations where one can obtain close to theoretical peak performance in pratice.

The number of floating point operations(Flops) in a Matrix-Matrix multiplication of two $N$ x $N$ matrices is given by $2N^3-N^2$ (See http://www2.hawaii.edu/~norbert/CompPhys/compphysicsch10.html for details of how this was determined).

For this benchmark, we construct two random $N$ x $N$ matrices and time how long it takes to multiply them together, $t$. We then compute the number of Gigaflops/s exhibited by that operation via $\frac{2N^3-N^2}{t*10^9}$. We do this several times for any given $N$ and record the average and the best (peak) results obtained.  $N$ is then varied from, for example, 250 to 10,000 in steps of 250 to see how performance varies with matrix size.  I used to think that the best performance would be exhibited by the largest matrices -- the computation saturating the hardware somehow -- but that's not always what I've actually seen.  On hardware such as laptops, thermal throttling may play a part for example. 

For highest performance, you should use a version of numpy that has been linked against a high performance BLAS library such as [OpenBLAS](http://www.openblas.net/) or the Intel MKL(https://software.intel.com/en-us/intel-mkl). The [Anaconda Python](https://www.continuum.io/downloads) distribution includes the Intel MKL by default on Windows and Linux (Mac includes its own high performance BLAS library).

# Results

If you look at individual results notebooks you'll notice that the notebooks have evolved a little over time.  The core computation is always the same though.

## Cloud 

* Amazon c5x18xlarge, November 2017, Max size 10000x10000, 1366 Gflops
* [Azure Notebook](Azure/AzureNotebook.ipynb), May 2017, Max size 1000x1000, 263 Gflops - This was a free service offered by Microsoft.  Discussed at https://walkingrandomly.com/?p=6351
* Amazon c4x4xlarge, September 2017, Max size 10000x10000, 333 Gflops

## Laptops

* [2018 Macbook Pro](results/laptops/i9-MacbookPro-2018.ipynb), Dec 2018, Max Size 15000 x 15000, 291 Gflops
* [Mid 2014 Macbook Pro](results/laptops/MacBookPro2014.ipynb), May 2017, Max Size 10000 x 10000, 169 Gflops
* [Dell XPS9560](results/laptops/Dell_XPS9560.ipynb), Intel Kaby Lake, May 2017, Max size 10000 x 10000, 141 Gflops
* [Microsoft Surface Book 2](results/laptops/SurfaceBook2.ipynb) August 2020, Max Size 10000 x 10000, 120 Gflops

## HPC Clusters

Results from various traditional HPC Clusters.

* [Sharc-32](https://github.com/mikecroucher/Jupyter-Matrix-Matrix/blob/master/results/hpc/Sheffield_sharc_32cores.ipynb) - 802 Gflops: 32 core Broadwell Nodes (2 sockets) that were added to ShARC thanks to a grant I won. [CPUs were released in Q1 2016](https://ark.intel.com/content/www/us/en/ark/products/91766/intel-xeon-processor-e5-2683-v4-40m-cache-2-10-ghz.html)
* [Sharc-16](https://github.com/mikecroucher/Jupyter-Matrix-Matrix/blob/master/results/hpc/Sheffield_sharc_16cores.ipynb) - 458 Gflops: 16 core Haswell Nodes (2 sockets) that formed the basis of Sharc: Sheffield' successor to Iceberg.  [CPUs were released in Q3 2014](https://ark.intel.com/content/www/us/en/ark/products/83356/intel-xeon-processor-e5-2630-v3-20m-cache-2-40-ghz.html)
* [Iceberg-16](https://github.com/mikecroucher/Jupyter-Matrix-Matrix/blob/master/results/hpc/Sheffield_iceberg_16cores.ipynb) - 333 Gflops: 16 core Ivy Bridge nodes (2 sockets) that were added to Iceberg after a few years of operation.  [CPUs were released in Q3 2013](https://ark.intel.com/content/www/us/en/ark/products/75269/intel-xeon-processor-e5-2650-v2-20m-cache-2-60-ghz.html)
* [Iceberg-12](results/hpc/Sheffield_iceberg_12cores.ipynb), 120 Gflops: 12 Core Intel Westmere nodes (2 sockets)  from University of Sheffield's 'Iceberg' Cluster.  They were old when I ran the benchmark: The [CPUs were released in 2010](https://ark.intel.com/content/www/us/en/ark/products/47922/intel-xeon-processor-x5650-12m-cache-2-66-ghz-6-40-gt-s-intel-qpi.html)



