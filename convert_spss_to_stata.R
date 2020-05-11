# Load SPSS file and save it as stata
# Just run it and select the file you want to convert
if (!"foreign" %in% rownames(installed.packages())) install.packages(foreign)
library(foreign)

path_to_spss_file <- file.choose()
# Or put it manually: path_to_spss_file <- file.path("C:\\PathToFile\\", "MyDataFile.sav")

dataset = read.spss(path_to_spss_file, to.data.frame=TRUE)

file_name <- gsub("\\..*$", ".dta", basename(path_to_spss_file)) # replace suffix by .dta
output_file <- file.path(dirname(path_to_spss_file), file_name)

write.dta(dataset, output_file)
