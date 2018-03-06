



*****************
***** SETUP *****
*****************

* set local working directory (if run from within STATA)
set more off
clear all


sysuse auto.dta, replace


**********************
***** REMOVE  VOLVO *****
**********************

drop if strpos(make, "Volvo")




**********************
***** Take Logs of price *****
**********************

g ln_price = log(price)
label var ln_price "log price"

**********************
***** Inverse gear ratio *****
**********************


g gear_ratio_inv=1/gear_ratio



save ../temp/preclean, replace
