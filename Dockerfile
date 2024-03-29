FROM jupyter/datascience-notebook:latest

# Set user as root to do system updates so everything is up-to-date
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    zip \
    unzip

# Set user as the notebook user to install packages
USER ${NB_UID}

# Install NodeJS so jupyterlab extensions can be built
RUN conda install --quiet --yes \
    'nodejs' \ 
    'plotly' && \
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Then install plotly and the jupyterlab extension for it
RUN jupyter labextension install jupyterlab-plotly
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager plotlywidget

# Install a spell checker for JupyterLab
RUN pip install --no-cache-dir jupyterlab-spellchecker

# Then install UC Berkeley's datascience package.
RUN pip install --no-cache-dir datascience

# Then install UC Berkeley's otter-grader package for autograding.
RUN pip install --no-cache-dir otter-grader

# Then install astropy for Computational Physics.
RUN pip install --no-cache-dir astropy

# Then install pymongo for MongoDB driver support.
RUN pip install --no-cache-dir pymongo[tls,srv]

#Then install and actiavate nbgitpuller so files can be pulled from github
RUN pip install nbgitpuller
RUN jupyter serverextension enable nbgitpuller --sys-prefix

# Install nbresuse so users can see the server resources they are using.
RUN pip install --no-cache-dir jupyter-resource-usage

USER root
