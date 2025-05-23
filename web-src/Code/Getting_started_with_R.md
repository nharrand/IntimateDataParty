# Getting started with R

This guide helps beginners quickly set up R, Rstudio Notebook, and tydiverse for simple data visualization tasks.


## R and Rstudio

Download and install R: https://cran.rstudio.com/

Download and install Rstudio: https://posit.co/download/rstudio-desktop/
 
Install tidyverse (A collection of libraries for data analysis): 
 - In Rstudio: 'Tools' > 'Install packages'
 - Type "tidyverse"
 - Click "install"


## Create a Notebook

In the rest of this tutorial, we are going to develop a very simple example to illustrate how to work with a simple dataset. You can find this toy dataset <a href="samples/temperature_readings.csv" download>here</a>.

This csv file contains temperature recordings with date and location data.

First create a code block that import the libraries you want to work with:

```{r}
library(tidyverse)
```

Then create a code block that loads your data. (You need to change the path to correspond to your csv file's path.)

```{r}
data <- read_csv("../samples/temperature_readings.csv")
```

To check your dataframe, you can simply create the following block:

```{r}
head(data)
```

## Plotting temperature over time

To plot the evolution of temperature over time, you can run the following code block:

```{r}
data %>%
  mutate(date = as.Date(date)) %>%  # Convert date column to date type
  ggplot(aes(x = date, y = temperature)) +
  geom_line(color = "blue") +
  labs(title = "Temperature Over Time",
       x = "Date",
       y = "Temperature") +
  theme_minimal()
```

## Plotting locations

To display your datapoints on a map you can run the following:

```{r}
install.packages("mapview")
install.packages("sf")
```


```{r}
library(sf)
library(mapview)
```


```{r}
mapview(data, xcol = "longitude", ycol = "latitude", crs = 4269, grid = FALSE)
```



You can download the full notebook <a href="code/CSV_Temp_Geo.Rmb" download>here</a>.

You'll find many more examples of plots in [Ggplot2's documentation](https://r4ds.had.co.nz/data-visualisation.html).
