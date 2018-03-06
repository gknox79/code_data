



*****************
***** SETUP *****
*****************

* set local working directory (if run from within STATA)
* capture cd "c:\..enter path..\code"


set more off
clear all


use ../temp/auto, replace 


**********************
**** DROP OBS *******
**********************

drop if strpos(make, "Volvo")


**********************
***** CREATE VAR *****
**********************

* replace foreign dummy

encode foreign, gen(foreign_nb)
drop foreign
g foreign = foreign_nb-1


**********************
***** Take Logs of price *****
**********************

g ln_price = log(price)
label var ln_price "log price"

**********************
***** Inverse gear ratio *****
**********************


g gear_ratio_inv=1/gear_ratio
label var gear_ratio_inv "Inv. gear ratio"


save ../temp/preclean, replace
