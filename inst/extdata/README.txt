Data files can be stored in this directory.

Once the package is installed, the data path can be aquired with
`system.file("extdata", "week2.Rdata", package = "learnr.proto")`

source: https://bookdown.org/rdpeng/RProgDA/data-within-a-package.html

# # THIS DOES NOT WORK. NO IDEA WHY.
#
# The files are made accessible by loading the package with `library(learnr.proto)`
#
# Accepted formats:
#   - plain R code (.R or .r),
# - tables (.tab, .txt, or .csv),
# - save() images (.RData or .rda)
#
# Tables (.tab, .txt, or .csv files) can be compressed by gzip, bzip2 or xz.
#
# source: https://cran.r-project.org/doc/manuals/r-release/R-exts.html#Data-in-packages
# further reading:
