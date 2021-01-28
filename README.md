# learnr.proto
Learnr tutorials for the Functional Genomics course.

## Run

To run these tutorials as a student (a user on the machine where the tutorials are [deployed](#deployment)), run:

```{r}
.libPaths("/path/to/learnr.proto/renv/library/R-3.6/x86_64-pc-linux-gnu")
learnr.dashboard::start_tutorial("fg1")  # available tutorials: fg1, fg2, fg3, fg4 and test
```

The tutorials can also be started as a background process (not occupying Rstudio).
To start background tutorials, run:

```{r}
learnr.dashboard::start_background_tutorial("fg1")
```

If the tutorials are missing exercises, images or behave oddly, try restarting R with `.rs.restartR()`

## Run on rstudio.science.ru.nl

1. Log into the network via VPN or on location

2. Go to [rstudio.science.ru.nl](https://rstudio.science.ru.nl)

3. Log in with your science account

4. run:
```{r}
.libPaths("/scratch/learnr/learnr.proto/renv/library/R-3.6/x86_64-pc-linux-gnu")
learnr.dashboard::start_tutorial("fg1")  # available tutorials: fg1, fg2, fg3, fg4 and test
```

## Development install

1. Install R 3.6.3, for instance with conda:
```{bash}
conda create -c conda-forge -n R_3.6 conda-forge::r-base=3.6.3 r-renv r-curl \
r-boot r-class r-cluster r-codetools r-foreign r-KernSmooth r-lattice r-MASS \
r-Matrix r-mgcv r-nlme r-nnet r-rpart r-spatial r-survival --yes;

conda activate R_3.6;
```

2. Install Rstudio.

3. In Rstudio, create a "New Project..." > select "Version Control" > "Git" > Repository URL: https://github.com/vanheeringen-lab/learnr.proto

4. Install all packages with `renv::restore()`. On windows you will need to [install Rtool35](https://cran.r-project.org/bin/windows/Rtools/Rtools35.exe).

### Development notes & troubleshooting

- To run a tutorial as Markdown (quick, but may differ from tutorials), open the .Rmd file and press "Run document"

- The settings menu (gear wheel symbol) can be used to change the display method of the tutorial. 

- To add a new tutorial to the repo, add a folder to `inst/tutorials` containing a Rmarkdown file with the same name (example: `inst/tutorials/fg1/fg1.Rmd`). Keep these names simple and short.

- If there are no boxes to input code, try restarting R with `.rs.restartR()`, or remove the old HTML file (see next note).

- If you pressed "Run document" and got an error mentioning "file exists", run `rm("learnr.proto-master/ins/tutorials/test/test.html")` and try again.

## Deployment

To make this tutorial available to all users on a machine, perform the following steps after the [development install](#development-install).

1. Regenerate the .html files for each tutorial (as only the owner of the renv library can). 

    1a. Delete old .html files in the renv library tutorial folders 

    1b. Run each, for instance by running (`learnr.dashboard::start_tutorial('fg1')`). 

2. Make the renv library and, if applicable, the system libraries available. Something like:
```{bash}
$ chmod -R 755 /path/to/learnr.proto/renv/library/R-3.6/x86_64-pc-linux-gnu
```
