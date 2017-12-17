# Elm Colormaps

`elm-colormaps` is a collection of high-quality colormaps that are intended for data visualization and scientific plotting.

For now it mainly provides a port of the four fantastic colormaps (magma, inferno, plasma, and viridis) that are included in matplotlib since version 1.5. They are perceptually uniform, colorblind friendly and can be printed out in grayscale with minimal loss of information.

![magma, inferno, plasma, and viridis](images/matplotlib.png "magma, inferno, plasma, and viridis")

This library simply provides these colormaps as functions of type `Float -> Color`, where the floating point number should lie between 0 and 1.

To use, simply import `Color.Colormaps` and use the functions `magma`, `inferno`, `plasma`, and `viridis`.

## Custom colormaps

The library provides a function `fromData : List (Int, Int, Int)` that can be used to define custom colormaps from list of RGB tuples that range from 0 to 255 in value. An example for this can be found in the `examples/` directory.

## Interop with elm-css

Since `elm-css` currently has a different Color Type than the Base library, colors have to be converted if used for the former. This library does't provide that out of the box, in order to avoid a dependency that is not necessary for every user. Conversion can be achieven with the following function:

```elm
colorCoreToCss : Color.Color -> Css.Color
colorCoreToCss c =
    let
        { red, green, blue, alpha } =
            Color.toRgb c
    in
        Css.rgba red green blue alpha
```

## Examples:

The `examples` directory contains code illustrating all abovementioned functionality. Everything can be run at once by starting `elm-repl` from within that directory. It has some additional dependencies to the library itself.


## What are Colormaps

A colormap represents an interval of real numbers as a gradient of colors so that plots can intuitively communicate the magnitudes of a dense set of data.

--x map example

These mappings to a colorspace should ideally preserve the linear relationship between those numbers, such that large numbers are clearly distinguishable from smaller ones independant of the context. The canonical bad example for this is rainbow colormaps that try to use the largest spectrum of available colors, but fail to give a good sense of distance between two numbers.

## References:

The original exposition on why and how the new Matplotlib colormaps were created. Highly recommended:

https://bids.github.io/colormap/

Some more information on the "linearity" of several colormaps, as well as some additional ones that might be interesting to port in the future:

https://matplotlib.org/users/colormaps.html
