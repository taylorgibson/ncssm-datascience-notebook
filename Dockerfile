FROM jupyter/datascience-notebook:1386e2046833

# First install some missing dependencies
# Note: there is no need to install the "jupyter" metapackage because all the needed
# pieces for nbgrader funtionality are already installed by the bootstraped image.
RUN conda install fuzzywuzzy --yes

# Then install UC Berkeley's datascience package.
RUN pip install --no-cache-dir datascience

# Then install UC Berkeley's otter-grader package for autograding.
RUN pip install otter-grader

# Then install nbgrader with --no-deps because all the neeeded deps are already present.
# Additionally, latest nbgrader release is pinging an old ipython version breaking stuff.
# Note: Eventually, when things get fixed upstream we can remove the previous installation
# of "fuzzywuzzy" and remove the --no-deps flag.
RUN pip install nbgitpuller
RUN jupyter serverextension enable nbgitpuller --sys-prefix

# Install nbresuse so users can see the server resources they are using.
RUN pip install nbresuse --no-cache-dir 

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    zip \
    unzip
