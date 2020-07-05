
pyload
=================================

[Overview](#overview)
| [Installation](#installation)
| [Usage](#usage)
| [Acknowledgements](#acknowledgments)
| [License](#license)

Loads Stata datasets directly into a Pandas dataframe

`version 0.5 5jul2020`


Overview
---------------------------------

pyload allows Stata users to import Stata datasets directly into the Python interpreter associated with Stata, using the built-in Python integration introduced with Stata 16.


Prequisites
---------------------------------

pyload requires Stata 16.0 or higher, since it uses Stata's built-in Python integration. It also requires the [Pandas](https://pandas.pydata.org/) Python library, which also comes standard with (for instance) the Anaconda distribution of Python.

Installation
---------------------------------

Installing pyload is very simple.

1. First, make sure Python is installed on your computer so that Stata can interface with it. If Stata cannot find your Python installation, [this installation guide](https://raw.githubusercontent.com/mdroste/stata-pyforest/master/docs/install.md) that I wrote for another program might be useful.

2. Next, install the Stata code and documentation. You can run the following Stata command to install directly from this GitHub repository:

```stata
net install pyload, from(https://raw.githubusercontent.com/mdroste/stata-pyload/master/) replace
```

Usage
---------------------------------

Using pyload is very simple. You can optionally specify a set of variables to import - if none are specified, then all variables will be imported. You can also use if/in conditions (as with many other Stata programs) to specify a set of observations from your dataset to export.

Here is an example loading a Stata dataset, sending it to Python, and then loading the Python interpreter to check the contents:
```stata
sysuse auto
pyload price mpg trunk foreign if foreign==0
python
from __main__ import df
df.head()
end
```


Acknowledgements
---------------------------------

This program was written by [Michael Droste](https://github.com/mdroste).

License
---------------------------------

gzimport is [MIT-licensed](https://github.com/mdroste/stata-gzimport/blob/master/LICENSE).
