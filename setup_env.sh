#!/bin/bash

ENV_NAME="LDC_Test"
ENV_YML="environment.yml"
CONDA_BASE=$(conda info --base)
ENV_PATH="$CONDA_BASE/envs/$ENV_NAME"

# Check if the environment exists
if conda info --envs | grep -q "${ENV_NAME}"; then
    echo "Environment $ENV_NAME exists. Updating..."
    conda env update --name $ENV_NAME --file $ENV_YML
else
    echo "Environment $ENV_NAME does not exist. Creating..."
    conda env create -f $ENV_YML
fi

# Activate the environment using the path
source "$CONDA_BASE/bin/activate" "$ENV_PATH"

# Install ipykernel and create a new Jupyter kernel linked to this environment
pip install ipykernel
python -m ipykernel install --user --name LDC_Test --display-name "LDC_Test Kernel"
