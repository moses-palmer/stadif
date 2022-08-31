# A simple dockerised wrapper for `stable-diffusion`

This repository contains a Docker wrapper to simplify using `stable-diffusion`.

The version of `stable-diffusion` in the submodule has a software fallback, so
no special hardware is required.


## Prerequirements

To use this wrapper, please ensure that you have access to the following:

*  A *Docker* installation.
*  The *model data*. Please see the `stable-diffusion`
   [README](fs/stable-diffusion/README.md) for information on how to get it.

Place the model in `$HOME/.local/lib/stable-diffusion/models/model.ckpt`.


## Building the Docker image

To build the Docker image, run the following command in this directory:

    docker build . --tag stadif:latest

The tag is used by the `stable-diffusion` script also found in this repository.


## The wrapper script

The wrapper script `stable-diffusion` simplifies running the Docker image. Its
first argument is the name, without extension, of one of the `stable-diffusion`
scripts found under `fs/opt/stable-diffusion/scripts`, and all other arguments
are passed to the selected script.

If the first argument is on the form `--outdir=<OUTDIR>`, `OUTDIR` is mounted
inside the container and output files are written under this directory.

The script automatically mounts the model file and certain cache directories as
well to speed up execution.
