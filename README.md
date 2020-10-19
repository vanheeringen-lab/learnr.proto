# learnr.proto

## Developing this tutorial

### Quick and dirty

The following steps download the learnr tutorial and allows you to work on them without version control.

1) optional: `cd` into a directory where you want to store these files.

2) Download this repo.

```
wget https://github.com/vanheeringen-lab/learnr.proto/archive/master.zip

unzip master.zip

rm -rf master.zip
```

2) Using conda, create a suitable environment. 

```
conda env create -n learnr -f learnr.proto-master/inst/conda/environment.yaml
```

3) Activate the conda environment, and start Rstudio

```
conda activate learnr

rstudio
```

4) In Rstudio, check that your conda environment is loaded and check that the environment is working by loading learnr

```
.libPaths()  # should return a path containing the environment name
library(learnr)
```

5) Open the tutorial file `learnr.proto-master/ins/tutorials/test/test.Rmd`

6) To visualize the tutorial, press "Run Document" (green arrow symbol, located in the top bar).

### Notes & Troubleshooting
- The settings menu (gear wheel symbol) can be used to change the display method of the tutorial. 

- To add a new tutorial to the repo, add a folder to `inst/tutorials` containing a Rmarkdown file with the same name (example: `inst/tutorials/test/test.Rmd).

- If there is no boxes to input code, close the tutorial. Next, in the top bar, click `Session`, then `Restart R`.

- If you pressed "Run document" and got an error methioning "file exists", run `rm("learnr.proto-master/ins/tutorials/test/test.html")` and try again.
