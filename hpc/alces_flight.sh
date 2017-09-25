#!/bin/bash -l
#SBATCH --job-name=myjob --output=output.%j
#SBATCH -n 16
#SBATCH --nodes=1

jupyter nbconvert --ExecutePreprocessor.timeout=6000 --to notebook --execute MatrixMatrixBenchmark.ipynb
