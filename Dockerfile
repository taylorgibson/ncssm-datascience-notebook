FROM jupyter/datascience-notebook:1386e2046833

# First install some missing dependencies
# Note: there is no need to install the "jupyter" metapackage because all the needed
# pieces for nbgrader funtionality are already installed by the bootstraped image.
RUN conda install fuzzywuzzy --yes

# Then install UC Berkeley's datascience package.
RUN pip install --no-cache-dir datascience

# Then install nbgrader with --no-deps because all the neeeded deps are already present.
# Additionally, latest nbgrader release is pinging an old ipython version breaking stuff.
# Note: Eventually, when things get fixed upstream we can remove the previous installation
# of "fuzzywuzzy" and remove the --no-deps flag.
RUN conda install nbgrader --no-deps --yes

# Add RISE 5.4.1 to the mix as well so user can show live slideshows from their notebooks
# More info at https://rise.readthedocs.io
# Note: Installing RISE with --no-deps because all the neeeded deps are already present.
RUN conda install rise --no-deps --yes

# Lastly, install nbzip so users can download a folder in the tree view.
RUN pip install nbresuse --no-cache-dir 
