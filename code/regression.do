
* install packages

capture ssc inst estout, replace
capture ssc inst coefplot, replace
capture ssc install scheme_tufte, replace


* set local working directory (if run from within STATA)

* capture cd "c:\..enter path..\code"

use ../temp/preclean, clear

* estimate models

eststo m1: regress ln_price mpg trunk length turn gear_ratio_inv if foreign==1
estadd local nationality "Foreign"

eststo m2: regress ln_price mpg trunk length turn gear_ratio_inv if foreign==0
estadd local nationality "Domestic"

* output tables

esttab m* using ../output/tables.rtf, label replace stats(nationality r2 N) ///
addnote("Volvo dropped from analysis.") title("{\b Table 1} {\i Comparing coefficients foreign vs. domestic}")

* output plot

coefplot (m2, label(Domestic Cars)) (m1, label(Foreign Cars)), xtitle("coefficients") ///
	drop(_cons) xline(0) scheme(tufte) note("Volvo observation dropped")

gr export ../output/coeff_foreign_domestic.png, replace width(1600) 


