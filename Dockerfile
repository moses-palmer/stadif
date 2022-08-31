FROM continuumio/miniconda3:latest

##
# Add file system.
COPY fs/opt /opt


##
# Run as a specific user.
RUN adduser \
    --system \
    --home "/opt/stadif" \
    stadif
RUN chown --recursive stadif /opt/stable-diffusion
USER stadif


##
# Initialise conda.
RUN true \
    && conda init bash \
    && conda env create -f /opt/stable-diffusion/environment.yaml


##
# Copy the entrypoint script separately to allow quick iteration.
COPY fs/entrypoint /
