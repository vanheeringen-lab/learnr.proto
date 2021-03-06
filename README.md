# learnr.proto
Learnr tutorials for the Functional Genomics course.

## Run

To run these tutorials as a student (a user on the server where the tutorials are [deployed](#deployment)), run:

```{r}
.libPaths("/path/to/learnr.proto/renv/library/R-3.6/x86_64-pc-linux-gnu");
learnr.dashboard::start_tutorial("fg1");  # available tutorials: fg1, fg2, fg3
```

The tutorials can also be started as a background process (not occupying Rstudio).
To start background tutorials, run:

```{r}
learnr.dashboard::start_background_tutorial("fg1")
```

If the tutorials are missing exercises, images or behave oddly, try restarting R with `.rs.restartR()`

## Run on rstudio.science.ru.nl

1. If you are working remotely, log into the science.ru.nl network with a VPN ([eduVPN](https://www.ru.nl/ict-uk/staff/working-off-campus/vpn-virtual-private-network/) or [vpnsec](https://wiki.cncz.science.ru.nl/Vpn#VPNSec))

2. Go to [rstudio.science.ru.nl](https://rstudio.science.ru.nl)

3. Log in with your science account

4. run:
```{r}
.libPaths("/scratch/learnr/learnr.proto/renv/library/R-3.6/x86_64-pc-linux-gnu");
learnr.dashboard::start_background_tutorial("fg1");  # available tutorials: fg1, fg2, fg3
```

## Development install

1. Install R 3.6.3.
    <details>
      <summary>Conda example</summary>

      ```{bash}
      conda create -c conda-forge -n R_3.6 conda-forge::r-base=3.6.3 r-renv r-curl \
      r-boot r-class r-cluster r-codetools r-foreign r-KernSmooth r-lattice r-MASS \
      r-Matrix r-mgcv r-nlme r-nnet r-rpart r-spatial r-survival --yes;

      conda activate R_3.6;
      ```
    </details>

2. Install Rstudio (Server).

3. In Rstudio, create a "New Project..." > select "Version Control" > "Git" > Repository URL: https://github.com/vanheeringen-lab/learnr.proto

4. Install all packages with `renv::restore()`. On Windows you will need to [install Rtool35](https://cran.r-project.org/bin/windows/Rtools/Rtools35.exe).

## Deployment

Deployment makes the tutorials, including the required libraries, available to all users on a machine.

1. Perform the [development install](#development-install) to create the renv library.

2. Install the tutorials in this library, and make the library accessible to all users with `learnr.dashboard:::deploy_learnr_pkg()`

3. Update the `.libPaths()` command in the [Run](#run) section with the location of the renv library.

## Development notes & troubleshooting

- The `learnr.dashboard` package has manual pages for each function. In the R console, type `?learnr.dashboard:::` and use autocomplete to browse all functions (including the reserved ones).

- Tutorials may not work on rstudio.science.ru.nl in markdown mode (because the host adress is not localhost).

- To run a tutorial as Markdown (quick, but may differ from tutorials), open the .Rmd file and press "Run document"

- The settings menu (gear wheel symbol) can be used to change the display method of the tutorial. 

- To add a new tutorial to the repo, copy the `template` folder in `inst/tutorial` and rename both the folder and .Rmd file (example: `inst/tutorials/fg4/fg4.Rmd`). Keep the name simple and short, as they must be typed to start the tutorial.

- If there are no boxes to input code, try restarting R with `.rs.restartR()`.

- If the tutorial did not update after a change, remove the .html file and try again.

- If you pressed "Run document" and got an error mentioning "file exists", remove the .html file and try again.
