# Elm Colormaps

`elm-colormaps` is a collection of high-quality colormaps that are intended for data visualization and scientific plotting.

For now it mainly provides a port of the four fantastic colormaps (`magma`, `inferno`, `plasma`, and `viridis`) are included in matplotlib since version 1.5. They are "perceptually uniform", which means that to the human eye, the difference between 0.1 and 0.3 should appear the same as the difference between 0.6 and 0.8. They are colorblind friendly and can be printed out in grayscale with very little loss of information.

--x the 4 colormaps

This library provides these colormaps as functions of type `Float -> Color`, where the floating point number should lie between 0 and 1.

Interoperability with the `elm-css` Color type can be achieved easily and the examples directory contains code for anything from ui elements to svg.

There are helper functions that let you define your own colormaps, and more colormaps will be included in the future.

## todo, examples directory:

-- short tutorial

-- generate css blocks 0% to 100 % as example

-- generate all 4 gradients, full [0, 1] range

-- interop with elm-css

-- how to define your own Colormaps and use fromdata

-- one last more complicated example (3d -> 2d map projection with svg).


## What are Colormaps

A colormap represents an interval of real numbers as a gradient of colors so that plots can intuitively communicate the magnitudes of a dense set of data.

--x map example

These mappings to a colorspace should ideally preserve the linear relationship between those numbers, such that large numbers are clearly distinguishable from smaller ones independant of the context. The canonical bad exampple for this is rainbow colormaps that try to use the largest spectrum of available colors, but fail to give a good sense of distance between two numbers.

--x rainbow colormap

## references:

https://bids.github.io/colormap/

https://matplotlib.org/examples/color/colormaps_reference.html

https://matplotlib.org/tutorials/colors/colormaps.html
