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

You should also install Matplotlib, Pandas and Folium (three libraries we'll be using).

```
pip install pandas matplotlib folium
```

To start Jupyter, simply run:

```
jupyter lab
```

This command will give you a link to your local instance of Jupyter. (This should look like a url starting with 'https://localhost'.)


## Loading your data

In the rest of this tutorial, we are going to develop a very simple example to illustrate how to work with a simple dataset. You can find this toy dataset <a href="https://raw.githubusercontent.com/nharrand/IntimateDataParty/refs/heads/main/samples/temperature_readings.csv" download>here</a>.

This csv file contains temperature recordings with date and location data.

First create a code block that import the libraries you want to work with:

```
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.cm as cm
import matplotlib.colors as mcolors
import folium
from folium.plugins import HeatMap
from datetime import datetime
```

Then create a code block that loads your data. (You need to change the path to correspond to your csv file's path.)

```
# Load CSV into a dataframe df
df = pd.read_csv('data/temperature_readings.csv', parse_dates=['date'])
```

To check your dataframe, you can simply create the following block:

```
df
```

If you run all your block, Jupyter should print a table containing your data.


## Plotting temperature over time

To plot the evolution of temperature over time, you can run the following code block:

```
# Normalize temperature for colormap
norm = mcolors.Normalize(vmin=df['temperature'].min(), vmax=df['temperature'].max())
cmap = plt.get_cmap('coolwarm')

# Function to convert normalized color to hex
def temperature_to_hex(temp):
    rgba = cmap(norm(temp))
    return mcolors.to_hex(rgba)

# Plot 1: Temperature over time
plt.figure(figsize=(12, 5))
colors = [temperature_to_hex(t) for t in df['temperature']]
plt.scatter(df['date'], df['temperature'], color=colors)
plt.plot(df['date'], df['temperature'], color='gray', alpha=0.3)
plt.title('Temperature Over Time')
plt.xlabel('Date')
plt.ylabel('Temperature (°C)')
plt.grid(True)
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
```

## Plotting locations

To display your datapoints on a map you can run the following:

```
# Plot 2: Map with temperature-colored points
m = folium.Map(location=[50, 10], zoom_start=4)

# Add points
for _, row in df.iterrows():
    folium.CircleMarker(
        location=[row['latitude'], row['longitude']],
        radius=7,
        color=None,
        fill=True,
        fill_opacity=0.7,
        fill_color=temperature_to_hex(row['temperature']),
        tooltip=f"{row['date'].date()} - {row['temperature']}°C"
    ).add_to(m)

# Display map
m
```



You can download the full notebook <a href="https://raw.githubusercontent.com/nharrand/IntimateDataParty/refs/heads/main/code/CSV_Temp_Geo.ipynb" download>here</a>.

You'll find many more examples of plots in [Matplotlib's documentation](https://matplotlib.org/stable/plot_types/index).
