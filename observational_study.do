* observational_study.do
* Conducts observational study of factors associated with doing UTs

set more off
clear
cd "~/GitHub/remind_experiment/"
use "data/master.dta"

destring UT total rank xile, replace
encode leader, gen(sl_code)

gen remind = (sl_code == 20) & (semester == 2)

reg UT total xile i.sl_code i.semester
