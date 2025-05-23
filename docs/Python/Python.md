# Getting started with Python and Matplotlib

This guide helps beginners quickly set up Python, Jupyter Notebook, and Matplotlib for simple data visualization tasks.

## Install Python and an environment


Download and Install Python: https://www.python.org/downloads/

While installing Python, don't forget to install pip as well. Pip is the tool to download and install python libraries. You will need it.

To check that everything went right, open a terminal and type:

```
python --version 
```

If the install was successful, this should print the version of python you just installed.

You can now install Jupyter, a python notebook that will allow you to quickly work with your data.

```
pip install jupyterlab
```

You should also install Matplotlib and Pandas (two libraries we'll be using).

```
pip install pandas matplotlib
```

To start Jupyter, simply run:

```
jupyter lab
```

This command will give you a link to your local instance of jupyter. (This should look like a url starting with 'https://localhost'.)


## Loading your data

Check [this notebook as an example](../../code/CSV_Temp_Geo.ipynb).
