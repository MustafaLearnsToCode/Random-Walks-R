# Random Walks in R

A computational exploration of **random walks and stochastic processes** using R.

This project simulates random movement in one and two dimensions and visualizes how a path develops step by step. I built it while exploring probability and stochastic processes, using code to connect mathematical ideas with observable behavior.

## What this repository contains

### 1D random walk
`1D_Random_Walk.R` starts at 0 and repeatedly samples a step of either **-1 or +1**.

The script records the position after every step, visualizes position versus step number, plots the walk on a number line, marks the starting and ending positions, and animates the trajectory.

### 2D random walk
`2D_Random_Walk.R` starts at `(0, 0)` and samples one of four unit moves at each step: right, up, left, or down.

The resulting path is plotted on a two-dimensional grid and animated to show how the walk evolves over time.

## Tools
- **R**
- **tidyverse / ggplot2** — data handling and visualization
- **gganimate** — animation
- **gifski** — GIF rendering

## Run it

Install the required packages:

```r
install.packages(c("tidyverse", "gganimate", "gifski"))
```

Then run either script in R or RStudio. The number of steps is controlled by `n`, so it is easy to experiment with longer trajectories and compare different random realizations.

## Why random walks?

Random walks are simple models with surprisingly rich behavior. They are an accessible entry point into ideas that appear throughout probability, stochastic processes, statistical physics, economics, and quantitative modeling.

This repository is exploratory: the emphasis is on **simulation, visualization, and mathematical intuition**, rather than presenting a formal theoretical treatment.

## Questions to explore next
- How does displacement change as the number of steps increases?
- What does the distribution of final positions look like across repeated simulations?
- How often does a walk return to its origin?
- How does introducing directional bias change the behavior?
- What changes in higher-dimensional or constrained walks?
