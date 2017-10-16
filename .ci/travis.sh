#!/bin/bash -x

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh;

bash miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"
hash -r
conda config --set always_yes yes --set changeps1 no
conda update -q conda
conda info -a

# Python problems
conda create --yes -n test python=$PYTHON_VERSION numpy scipy matplotlib
source activate test
pip install corner

# Set up tectonic
conda install -c conda-forge -c pkgw-forge tectonic

# Build the paper
tectonic --help
cd problems
make
cd ..
tectonic ms.tex
