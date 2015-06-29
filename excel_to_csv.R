# excel_to_csv.R - gets data from the original Excel files into csv format

setwd("~/GitHub/remind_experiment/data/raw")
library(xlsx)

# files to read:
in_files <- c("BenFinalALB.xls",
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

cols <- 1:48
rows <- list(8:111, 8:127, 8:115, 8:132, 8:124, 8:114, 8:100, 8:111, 8:134, 8:101, 8:133, 8:113)

out_files <- c("../temp/ben2.csv","../temp/ben1.csv","../temp/matt2.csv","../temp/matt1.csv","../temp/micah1.csv","../temp/micah2.csv","../temp/nicole2.csv","../temp/nicole1.csv","../temp/rachel1.csv","../temp/rachel2.csv","../temp/steve1.csv","../temp/steve2.csv")

# Syntax to read .xlsx:
# read.xlsx(file, sheetIndex=1, rowIndex=c(1,2,3), colIndex=c(1,4,7), as.data.frame=TRUE, header=TRUE)
for (i in 1:12) {
    temp_file <- read.xlsx(files[i], sheetIndex=1, rowIndex=rows[[i]], colIndex=cols)
    write.csv(temp_file, out_files[i])
}


