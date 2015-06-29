* process_data.do
* Processes .csv files into Stata datasets
* drops useless variables (all missing columns)
* renames variables to easier to interpret
* merges data into one file with labels for semester

set more off
clear
cd "~/GitHub/remind_experiment/data/temp"

local groups matt micah nicole rachel steve

foreach group of local groups {
	local semesters 1 2
	foreach i of local semesters {
		clear
        insheet using `group'`i'.csv
		tostring *, replace force
    	gen semester = `i'
    	drop v1
    	drop na*
    	rename x5 raw_section
    	drop grade3
    	rename x100 section
    	drop x1001 x1002 x200 x1003
    	rename x51 UT
    	rename grade4 final_grade
    	
    	rename bb3 bb3_final
    	rename bb4 bb4_final
    	
    	local vars bb1 bb2 mch total rank xile grade
    	foreach var of local vars {
    		rename `var' `var'_e1
    		rename `var'1 `var'_e2
    		rename `var'2 `var'_final
    	}
     	rename x500 total
      	rename rank3 rank
    	rename xile4 xile
		
		save `group'`i'.dta, replace
  	}
}

local files matt2.dta micah1.dta micah2.dta nicole1.dta nicole2.dta rachel1.dta rachel2.dta steve1.dta steve2.dta

clear
use matt1.dta
foreach filename of local files {
	append using `filename'
}

save "../master.dta", replace
