prep_week2 <- function(){
  #' prepare the .Rdata for week2
  #' object is saved in inst/extdata, which is installed to any device that installs the package

  # generate all variables that can/need to be accessible for every excersize
  monocytes_h3k4me3 <- rtracklayer::import("inst/extdata/week2/blueprint/bed/C000S5H2.ERX547984.H3K4me3.bwa.GRCh38.20150527.chr19.bed", format = "narrowPeak")
  monocytes_h3k4me1 <- rtracklayer::import("inst/extdata/week2/blueprint/bed/C000S5H2.ERX547981.H3K4me1.bwa.GRCh38.broad.20150527.chr19.bed", format = "broadPeak")
  monocytes_h3k9me3 <- rtracklayer::import("inst/extdata/week2/blueprint/bed/C000S5H2.ERX547982.H3K9me3.bwa.GRCh38.broad.20150527.chr19.bed", format = "broadPeak")
  monocytes_h3k27ac <- rtracklayer::import("inst/extdata/week2/blueprint/bed/C000S5H2.ERX547980.H3K27ac.bwa.GRCh38.20150527.chr19.bed", format = "narrowPeak")
  monocytes_h3k27me3 <- rtracklayer::import("inst/extdata/week2/blueprint/bed/C000S5H2.ERX547983.H3K27me3.bwa.GRCh38.broad.20150527.chr19.bed", format = "broadPeak")
  monocytes_h3k36me3 <- rtracklayer::import("inst/extdata/week2/blueprint/bed/C000S5H2.ERX547979.H3K36me3.bwa.GRCh38.broad.20150527.chr19.bed", format = "broadPeak")

  # make a list of named GRanges objects
  monocytes_list  <- GRangesList(monocytes_h3k4me1, monocytes_h3k4me3, monocytes_h3k9me3, monocytes_h3k27ac, monocytes_h3k27me3, monocytes_h3k36me3)
  names(monocytes_list) <- c("h3k4me1", "h3k4me3", "h3k9me3", "h3k27ac", "h3k27me3", "h3k36me3")

  # store the variables in an .Rdata object
  save(
    monocytes_h3k4me3, monocytes_h3k4me1, monocytes_h3k9me3, monocytes_h3k27ac, monocytes_h3k27me3, monocytes_h3k36me3, monocytes_list,
    file =  "inst/extdata/week2.Rdata"
  )

  # install the package
  dev_path = "."  # tools::file_path_as_absolute(".") should be something like "/home/siebrenf/git/edu/learnr.proto"
  devtools::install(
    pkg=dev_path,
    dependencies=F
  )

  # reload the package
  detach("package:learnr.proto", unload = TRUE)
  rm(list = ls())
  library(learnr.proto)

  # test
  rdata = system.file("extdata", "week2.Rdata", package = "learnr.proto")
  load(rdata)
}

# # for single objects (saved in data/)
# usethis::use_data(
#   week2,
#   version=3  # for R version 3.5 and higher
# )

# datadir <- "/home/siebrenf/git/edu/learnr.proto/inst/tutorials/FuncGenWeek2/"
# datadir <- "/Users/christatoenhake/GitHub/learnr.proto-master/inst/tutorials/FunctGenWeek2_v2/"

# https://ctoen.github.io/FunctGen/prepdata.html
# https://bookdown.org/rdpeng/RProgDA/data-within-a-package.html
# https://kbroman.org/pkg_primer/pages/data.html
