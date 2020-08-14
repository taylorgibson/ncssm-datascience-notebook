FROM jupyter/datascience-notebook:latest

# Then install UC Berkeley's datascience package.
RUN pip install --no-cache-dir datascience

# Then install UC Berkeley's otter-grader package for autograding.
RUN pip install --no-cache-dir otter-grader==1.0.0.b10

# Then install astropy for Computational Physics.
RUN pip install --no-cache-dir astropy

#Then install and actiavate nbgitpuller so files can be pulled from github
RUN pip install nbgitpuller
RUN jupyter serverextension enable nbgitpuller --sys-prefix

# Install nbresuse so users can see the server resources they are using.
RUN pip install --no-cache-dir nbresuse

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    zip \
    unzip
