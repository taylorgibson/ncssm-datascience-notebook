# ncssm-datascience-notebook

**ncssm-datascience-notebook** is an education-focused Jupyter Docker Stack image
maintained by the community.

## What is ncssm-datascience-notebook

The `ncssm-datascience-notebook` image adds nbzip, datascience, RISE and nbgrader packages to the official Jupyter docker stacks' 
[`datascience-notebook`](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-datascience-notebook) image.

The `education-notebook` contains Python, R, and Julia as well as frequently
used data science libraries.

## How to build

`docker build -t taylorgibson/ncssm-datascience-notebook:<tag> .`

`docker push taylorgibson/ncssm-datascience-notebook:<tag>`
