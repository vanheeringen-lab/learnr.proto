prep_week2 <- function(){
  #' prepare the .Rdata for week2
  #' object is saved in inst/extdata, which is installed to any device that installs the package

  # generate all environmental variables to save
  txdb_annotation <- readRDS("inst/extdata/week2/prepared_rds/txdb_annotation_chr19_grangeslist.rds")

  load("inst/extdata/week2/prepared_rds/txdb_annotation_chr19_genes_tx_pr_tss_granges.RData") # loads genes, promoters_3k, promoters_def, transcripts

  encode_ccres <- readRDS("inst/extdata/week2/prepared_rds/encode_ccres_chr19.rds")
  encode_ccres_list <- split(encode_ccres, encode_ccres$ucsc_label)

  entrezid_symbols <- readRDS("inst/extdata/week2/prepared_rds/gene_entrezids_genesymbols_df.rds")

  monocytes_h3k4me3 <- rtracklayer::import("inst/extdata/week2/blueprint/bed/C000S5H2.ERX547984.H3K4me3.bwa.GRCh38.20150527.chr19.bed", format = "narrowPeak")

  # create the .Rdata object
  save(txdb_annotation, genes, promoters_3k, promoters_def, transcripts, encode_ccres, encode_ccres_list, entrezid_symbols, monocytes_h3k4me3, file =  "inst/extdata/week2.Rdata")

  # install the package
  dev_path = "/home/siebrenf/git/edu/learnr.proto"
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
