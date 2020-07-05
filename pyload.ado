*===============================================================================
* Program: pyload.ado 
* Purpose: Import data into Python
* Version: 0.1
* Date: July 2020
* Author: Michael Droste
*===============================================================================

program define pyload
version 16.0
syntax [varlist] [if] [in],


*-------------------------------------------------------------------------------
* Exception handling
*-------------------------------------------------------------------------------

* xx todo

*-------------------------------------------------------------------------------
* Main
*-------------------------------------------------------------------------------

* Preserve and subset based on if/in
preserve
marksample touse, strok novarlist
qui drop if `touse'==0

* Count vars in varlist
local num_vars = 0
foreach v of varlist `varlist' {
    local num_vars = `num_vars' + 1
}

* Count obs
qui count
local samplesize=r(N)

* Call Python to load data
python: load_vars("`varlist'","`dfname'")

* Restore dataset
restore

* Display output
display "pyload: loaded `num_vars' variables and `samplesize' observations as a Pandas dataframe, stored as object __main__.df"


end


*-------------------------------------------------------------------------------
* Python code
*-------------------------------------------------------------------------------

version 16.0
python:


def load_vars(vars,name):

	# Load relevant libraries
	from pandas import DataFrame
	from sfi import Data,Matrix,Scalar
	import __main__
	
	# Use SFI DataFrame to pull specified vars into dataset
	__main__.df = DataFrame(Data.get(vars))
	
	# Store column names
	colnames = []
	for var in vars.split():
		 colnames.append(var)
	__main__.df.columns = colnames
	
end
