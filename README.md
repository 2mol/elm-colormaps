# Elm Colormaps

`elm-colormaps` is a collection of high-quality colormaps that are intended for data visualization and scientific plotting.

For now it mainly provides a port of the four fantastic colormaps (magma, inferno, plasma, and viridis) that are included in matplotlib since version 1.5. They are perceptually uniform, colorblind friendly and can be printed out in grayscale with minimal loss of information.

![magma, inferno, plasma, and viridis](https://raw.githubusercontent.com/2mol/elm-colormaps/master/images/matplotlib.png)

This library simply provides these colormaps as functions of type `Float -> Color`, where the input is expected to be between 0 and 1.

To use, simply import `Color.Colormaps` and use the functions `magma`, `inferno`, `plasma`, and `viridis`.

## Custom colormaps

The library provides a function `fromData : List (Int, Int, Int)` that can be used to define custom colormaps from list of RGB tuples that range from 0 to 255 in value. An example for this can be found in the `examples` directory.

## Interop with elm-css

Since `elm-css` currently has a different Color type than the Base library, colors from `Colormap` have to be converted. To keep dependencies to a minimum, `elm-colormaps` does not ship with a conversion function. However, it can easily be written as follows:

```elm
colorCoreToCss : Color.Color -> Css.Color
colorCoreToCss c =
    let
        { red, green, blue, alpha } =
            Color.toRgb c
    in
        Css.rgba red green blue alpha
```

## Examples

The `examples` directory contains code illustrating all abovementioned functionality. Everything can be run at once by starting `elm-reactor` from within that directory and opening `Example.elm`.

## References

The original exposition on why and how the new Matplotlib colormaps were created. Highly recommended:

https://bids.github.io/colormap/

Some more information on the linearity of several colormaps, as well as some additional ones that might be interesting to port to Elm in the future:

https://matplotlib.org/users/colormaps.html

https://matplotlib.org/gallery/color/colormap_reference.html
