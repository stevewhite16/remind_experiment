* observational_study.do
* Conducts observational study of factors associated with doing UTs

set more off
clear
cd "~/GitHub/remind_experiment/"
use "data/master.dta"

destring UT total rank xile_final, replace
encode leader, gen(sl_code)

gen remind = (sl_code == 25) & (semester == 2)

* What is the associated between the reminders and taking the UT?
reg UT remind
reg UT remind i.semester
areg UT remind i.semester, absorb(id) cluster(id)
areg UT remind i.semester, absorb(sl_code)
areg UT remind i.sl_code i.semester, absorb(id) cluster(id)
areg UT remind xile_final i.sl_code i.semester, absorb(id) cluster(id)

areg UT remind i.sl_code i.semester, absorb(id) cluster(id)
predict ut_twiddle, resid
areg remind i.sl_code i.semester, absorb(id) cluster(id)
predict remind_twiddle, resid

outsheet ut_twiddle remind_twiddle UT remind sl_code semester id using "data/temp/twiddle.csv", comma replace

* most of the results show a robust increase in UT, despite lots of controls
* its hard to do power analysis because its hard to estimate all the variances

* focus on comparing the change for Steve's semester 1 students vs control
keep UT leader sec id semester
duplicates drop id semester, force
reshape wide UT leader sec, i(id) j(semester)
gen remind = (sec2 == "27" | sec2 == "28")
reg UT2 UT1 remind, r
* this is the most robust evidence that remind.com reminders matter
* t = 1.99 and effect is 0.5 more tests passed
