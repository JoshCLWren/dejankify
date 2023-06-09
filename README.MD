DEJANKIFY -- remove the jank from your code

This is a tool that helps you maintain your python environment by removing unnecessary dependencies.
By default, it will remove all packages that are not explicitly imported in your code.
It will also remove any import statements that are for packages that are not referenced in your code.
It also creates a requirements.txt file that contains all the packages that are explicitly imported in your code
and are not part of the standard library and are pip installable.

This is meant to enhance workflows that are using virtual environments and pip to manage dependencies.

Dejankify works best with pyenv, virtualenv, black, isort, and pylint.

Usage:
  dejankify [options] <path>

To install run:
```bash
pip install dejankify
```

A sample script before dejankify:
```python
import os
import sys
import re
import json
import requests
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from sklearn import linear_model
from sklearn.metrics import mean_squared_error, r2_score

name = input("What is your name? ")
first, last = re.match(r"(\w+)\s(\w+)", name).groups()
print(f"Hello {first} {last}!")
```

The above script would imply the following external dependencies:
* numpy
* pandas
* matplotlib
* sklearn

Before running dejankify, you would need to install the above packages in your virtual environment and when your code
runs it would import the above packages, which would be unnecessary if you are not using them and would slow down your
code in addition to increasing the size of your virtual environment.

Now, let's run dejankify:
```bash
dejankify
```

After running dejankify, the script would look like this:
```python
import re

name = input("What is your name? ")
first, last = re.match(r"(\w+)\s(\w+)", name).groups()
print(f"Hello {first} {last}!")
```

The above script would have no external dependencies and would run faster. 

Dejankify will also create several files after it runs that you may delete or version control:
* requirements.txt - contains all the packages that are explicitly imported in your code and are not part of the standard library and are pip installable.
* temp_requirements.txt - Your original requirements.txt file will be renamed to this file.
* invalid_requirements.json - contains a list of packages that are explicitly imported in your code but are not pip installable.
* valid_requirements.json - contains a list of packages that are explicitly imported in your code and are pip installable.
* builtins.json - contains a list of all the built-in modules in your version of python.
