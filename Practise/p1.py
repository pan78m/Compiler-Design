# This Python 3 environment comes with many helpful analytics libraries installed
# It is defined by the kaggle/python Docker image: https://github.com/kaggle/docker-python
# For example, here's several helpful packages to load

import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)

# Input data files are available in the read-only "../input/" directory
# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory

import os
for dirname, _, filenames in os.walk('/kaggle/input'):
    for filename in filenames:
        print(os.path.join(dirname, filename))

# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using "Save & Run All" 
# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session
def calculate_first(symbol):
    if symbol.islower() or symbol == 'ε':
        return {symbol}
    else:
        first_set = set()
        for production in example_input[symbol]:
            for p_symbol in production:
                first = calculate_first(p_symbol)
                first_set.update(first)
                
                if 'ε' not in first:
                    break
        return first_set
  
  result = {non_terminal: set() for non_terminal in example_input.keys()}
print(result)
for non_terminal in example_input.keys():
    result[non_terminal]=calculate_first(non_terminal)
print(result)

example_input = {
    'A': [['a','B'],['B','b']],
    'B': [['c','D']],
    'D': [['ε']]
    
}