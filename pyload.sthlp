{smcl}
{* *! version 0.5  5jul2020}{...}
{viewerjumpto "Syntax" "pyload##syntax"}{...}
{viewerjumpto "Description" "pyload##description"}{...}
{viewerjumpto "Author" "pyloadt##author"}{...}
{title:Title}
 
{p2colset 5 14 21 2}{...}
{p2col :{hi:pyload} {hline 2} Load Stata datasets directly into Pandas}{p_end}
{p2colreset}{...}
 
 
{marker syntax}{title:Syntax}
 
{p 4 15 2}
{cmd:pyload} [varlist] [if] [in]
                               
 
{marker description}{...}
{title:Description}
 
{pstd}
{opt pyload} takes any combination of variables in your current dataset, and optionally any observations specified with if/in conditions, and saves them to a Pandas dataframe in the Python interpreter associated with Stata.

{pstd}
Datasets loaded into Pandas are saved in the Python namespace as __main__.df. See examples below for usage. 

{pstd}
This function requires Stata 16.0, which introduced built-in integration with Python, and the Pandas library.

 
{marker author}{...}
{title:Author}
 
{pstd}Michael Droste{p_end}
{pstd}mdroste@fas.harvard.edu{p_end}
