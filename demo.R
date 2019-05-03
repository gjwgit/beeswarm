########################################################################
# Introduce the concept of scatter plots using bee swarm through ML Hub
#
# Copyright 2018 Graham.Williams@togaware.com

library(mlhub)

mlcat("Introducing Bee Swarm Plots",
      "The beeswarm package provides jittered scatter plots that avoid
the typical overplotting of traditional scatter plots.

The demonstration here is motivated by the examples published on
github: https://github.com/eclarke/ggbeeswarm/blob/master/README.md")

#-----------------------------------------------------------------------
# Load required packages from local library into the R session.
#-----------------------------------------------------------------------

suppressMessages(
{
  library(magrittr)     # Data pipelines: %>% %<>% %T>% equals().
  library(rattle)       # Support: normVarNames(), weatherAUS. 
  library(ggbeeswarm)   # 
  library(ggplot2)      # Visualise data.
  library(dplyr)        # Wrangling: sample_n()
  library(randomForest) # Missing data: na.roughfix().
})

#-----------------------------------------------------------------------
# Identify the data source and refence using template variables.
#-----------------------------------------------------------------------

dsname    <- "weatherAUS"
ds        <- get(dsname) %>% sample_n(1000)
names(ds) %<>% normVarNames()

xv <- "rain_tomorrow"
yv <- "humidity_3pm"

vars <- c(xv, yv)

ds[vars] %<>% na.roughfix() # Removing missing values.

#-----------------------------------------------------------------------
# Start with a basic scatter plot.
#-----------------------------------------------------------------------

mlask()
mlcat("Basic Scatter Plot",
    "A basic scatter plot displays points on the plot without regard for
over-plotting of the points. Consequently if there are multiple observations
with the same x and y values only one will be visible. A scatter plot adds a
points geomtery to the canvas.

  ds %>%
    ggplot(aes(x=rain_tomorrow, y=humidity_3pm)) +
    geom_point()")

# Plot a basic jitter plot.

fname <- "plot_scatter.pdf"
pdf(file=fname, width=8)
ds %>%
  ggplot(aes_string(x=xv, y=yv)) +
  geom_point()
invisible(dev.off())
mlask()
mlpreview(fname)
mlask()

#-----------------------------------------------------------------------
# Compare that to a basic jitter plot
#-----------------------------------------------------------------------

mlcat("Jitter the Points",
      "The jitter geometry can be used in place of points to jitter the
over-plotted points.")
mlask()

# Plot a basic jitter plot.

fname <- "plot_jitter.pdf"
pdf(file=fname, width=8)
ds %>%
  ggplot(aes_string(x=xv, y=yv)) +
  geom_jitter()
invisible(dev.off())
mlask()
mlpreview(fname)
mlask()

#-----------------------------------------------------------------------
# Compare it to a quasirandom layout
#-----------------------------------------------------------------------

mlcat("Quasi Random Points",
      "Compare the jittered plot to the more informative geom_quasirandom()")

fname <- "plot_jitter_quasirandom.pdf"
pdf(file=fname, width=8)
ds %>%
  ggplot(aes_string(x=xv, y=yv)) +
  geom_quasirandom()
invisible(dev.off())
mlask()
mlpreview(fname)
mlask()

#-----------------------------------------------------------------------
# Compare it to a deeswarm layout
#-----------------------------------------------------------------------

mlcat("Bee SwarmTITLE",
      "Use geom_beeswarm()")

fname <- "plot_jitter_beeswarm.pdf"
pdf(file=fname, width=8)
ds %>%
  ggplot(aes_string(x=xv, y=yv)) +
  geom_beeswarm()
invisible(dev.off())
mlask()
mlpreview(fname)
mlask()

#-----------------------------------------------------------------------
# A tukey plot.
#-----------------------------------------------------------------------

mlcat("Tukey Jitters",
      "Use Tukey's method for jittering.")

fname <- "plot_quasirandom_tukey.pdf"
pdf(file=fname, width=8)
ds %>%
  ggplot(aes_string(x=xv, y=yv)) +
  geom_quasirandom(method="tukey")
invisible(dev.off())
mlask()
mlpreview(fname)
mlask()

#-----------------------------------------------------------------------
# A smiley plot.
#-----------------------------------------------------------------------

mlcat("Smiley",
      "How about a smiley plot?")

fname <- "plot_quasirandom_smiley.pdf"
pdf(file=fname, width=8)
ds %>%
  ggplot(aes_string(x=xv, y=yv)) +
  geom_quasirandom(method="smiley")
invisible(dev.off())
mlask()
mlpreview(fname)
mlask()
