#!/bin/bash

#Install miniconda if it isn't there already
if [ ! -d ./miniconda/ ]; then
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ./miniconda.sh
bash ./miniconda.sh -b -p $PWD/miniconda
fi
#Add miniconda to the path
export PATH="$PWD/miniconda/bin:$PATH"
source $PWD/miniconda/bin/activate

#Create conda environment if it doesn't already exist
environment_name=testing123
if conda env list | grep -q $environment_name; then
  #The environment already exists
  :
else
  #The environment doesn't exist so we create it
  conda create -n $environment_name -y python=3.6 mkl numpy jupyter matplotlib
fi

#activate the Python environment
source activate $environment_name

source_notebook=./MatrixMatrixBenchmark.ipynb
result_notebook=$PWD/result.ipynb

jupyter nbconvert --ExecutePreprocessor.timeout=360000 --to notebook --execute $source_notebook --output $result_notebook

