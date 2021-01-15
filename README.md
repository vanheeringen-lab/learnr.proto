# learnr.proto
Learnr tutorials for the Functional Genomics course.

## Run

To run these tutorials as a student (a user on the machine where the tutorials are [deployed](#deployment)), run:

```
.libPaths("/path/to/learnr.proto/renv/library/R-3.6/x86_64-pc-linux-gnu")
learnr.dashboard::start_tutorial("fg1")  # available tutorials: fg1, fg2, fg3, fg4 and test
```

The tutorials can also be started as a background process (not occupying Rstudio).
To start and end background tutorials, run:

```
learnr.dashboard::start_background_tutorial("fg1")
learnr.dashboard::end_background_tutorial()
```

If the tutorials are missing exercises, images or behave oddly, try restarting R with `.rs.restartR()`

## Development install

Install R 3.6.3, for instance with conda:
```
conda create -n R_3.6 -c conda-forge conda-forge::r-base=3.6.3 r-boot r-class r-cluster r-codetools r-foreign r-KernSmooth r-lattice r-MASS r-Matrix r-mgcv r-nlme r-nnet r-rpart r-spatial r-survival --yes;

conda activate R_3.6;
```
Install Rstudio.

In Rstudio, create a "New Project..." > select "Version Control" > "Git" > Repository URL: https://github.com/vanheeringen-lab/learnr.proto

Install all packages with `renv::restore()`. On windows you will need to install Rtool35 from https://cran.r-project.org/bin/windows/Rtools/Rtools35.exe

### Development notes & troubleshooting

- To run a tutorial as Markdown (quick, but may differ from tutorials), open the .Rmd file and press "Run document"

- The settings menu (gear wheel symbol) can be used to change the display method of the tutorial. 

- To add a new tutorial to the repo, add a folder to `inst/tutorials` containing a Rmarkdown file with the same name (example: `inst/tutorials/test/test.Rmd`).

- If there are no boxes to input code, close the tutorial. Next, in the top bar, click `Session`, then `Restart R`.

- If you pressed "Run document" and got an error mentioning "file exists", run `rm("learnr.proto-master/ins/tutorials/test/test.html")` and try again.

## Deployment

To make this tutorial available to all users on a machine, perform the following steps after the [development install](#development-install).

Make the renv library, and renv cache available. Something like:
$ chmod -R 755 ~/.local/share/renv/cache
$ chmod -R 755 ~/git/edu/learnr.proto/renv/library/R-3.6/x86_64-pc-linux-gnu

Run each tutorial once (learnr.dashboard::start_tutorial('fg1')) to generate the .html files (only the owner of the renv library can)
