# this script specifies the necessary folders for the immgen preprocessing script.
# this assumes you've already run preprocess_setup.py which sets up the folder 
# structure for aroma
library(log4r)

logger <- create.logger()
logfile(logger) <- file.path('/ifs/scratch/c2b2/cw_lab/md2954/Logs/immgen_preprocess.log')
level(logger) <- log4r:::DEBUG

source('preprocess.r')

GEOid = "GSE15907"

root_folder = "/ifs/scratch/c2b2/cw_lab/md2954/immgen"
summary_file = paste(root_folder,"userData",GEOid,"gene_summary.data",sep="/")
symbol_file = paste(root_folder,"userData",GEOid,"probes2symbols.data",sep="/")
out_file = paste(root_folder,"userData",GEOid,"immgen.data",sep="/")

immgen.preprocess(root_folder,summary_file,GEOid=GEOid)
immgen.form_symbol_file(symbol_file)
immgen.form_expression_set(summary_file,symbol_file,out_file)
