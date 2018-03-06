
* install packages

capture ssc inst estout
capture ssc inst coefplot


* set local working directory (if run from within STATA)

*capture cd "D:\UvT_comp\ART\data_code_example"

* use ../temp/streamagg_panel, clear
use ../temp/preclean, clear

* estimate models

eststo m1: regress ln_price mpg trunk length turn gear_ratio_inv if foreign==1
estadd local nationality "Foreign"

eststo m2: regress ln_price mpg trunk length turn gear_ratio_inv if foreign==0
estadd local nationality "Domestic"

* output tables

esttab m* using ../output/tables.rtf, replace stats(nationality r2 N)

* output plot

coefplot (m2, label(Domestic Cars)) (m1, label(Foreign Cars)), drop(˙cons) xline(0)
gr export ../output/coeff_foreign_domestic.png, replace width(1600)


