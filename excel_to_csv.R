# excel_to_csv.R - gets data from the original Excel files into csv format

setwd("~/GitHub/remind_experiment/data/raw")
library(xlsx)

# files to read:
files <- c("BenFinalALB.xls",
"BenNovExamCompleteDWJ_section_MC_BBA_B_C_D and UT credits.xls",
"MattMayFinalCompleteDWJ.xls",
"MattNovExamComplete with section grades BB A B C and D and MC and UT credits.xls",
"MicahDecCompleteDWJ.xls",
"MicahMayFinalCompleteDWJ.xls",
"NicoleMayFinalCompleteDWJ.xls",
"NicoleNovExamCompleteDWJ_bluebooks_Section Grades_MC and UT credits.xls",
"RachelFinalCompleteCorrectDWJ.xls",
"RachelMayFinalCompleteALB.xls",
"Steve Final Exam Template with Section MC BBA BBC BBD and UT credits.xlsx",
"SteveMayFinalCompleteALB.xls")


# Syntax to read .xlsx:
# read.xlsx(file, sheetIndex=1, rowIndex=c(1,2,3), colIndex=c(1,4,7), as.data.frame=TRUE, header=TRUE)

ben_may_rows <- 8:111
ben_may_cols <- 1:48
ben_may <- read.xlsx(files[1], sheetIndex=1, rowIndex=ben_may_rows, colIndex=ben_may_cols)
write.csv(ben_may, "../ben_may.csv")

ben_dec_rows <- 
ben_dec_cols <- 
ben_dec <- read.xlsx(files[1], sheetIndex=1, rowIndex=ben_dec_rows, colIndex=ben_dec_cols)
write.csv(ben_dec, "../ben_dec.csv")

