

*****************
***** SETUP *****
*****************

* set local working directory (if run from within STATA)

* capture cd "c:\..enter path..\code"


set more off
clear all


*****************************************
* import csv file and convert it to dta *
*****************************************

import delimited ../external/auto.csv, clear

save ../temp/auto, replace
