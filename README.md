# Elm Colormaps

`elm-colormaps` is a collection of high-quality colormaps that are intended for data visualization and scientific plotting.

For now it mainly provides a port of the five sequential colormaps (magma, inferno, plasma, viridis, and cividis) that are included in newer versions of matplotlib. These are perceptually uniform, colorblind friendly and can be printed out in grayscale with minimal loss of information.

![magma, inferno, plasma, viridis, and cividis](https://raw.githubusercontent.com/2mol/elm-colormaps/master/images/matplotlib.png)

This library provides these colormaps as functions of type `Float -> Color`, where the input is expected to be between 0 and 1.

To use, just import `Color.Colormaps` and use the functions `magma`, `inferno`, `plasma`, `viridis`, and `cividis`.

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

## Examples and custom colormaps

The `examples` directory contains code illustrating all abovementioned functionality. Run the code locally with `elm-reactor` and open `Example.elm`. Alternatively, take a look at the results at [https://2mol.github.io/elm-colormaps/](https://2mol.github.io/elm-colormaps/).

There are also examples included about how to use the various helper functions that can be used to define custom colormaps from lists of RGB tuples.

## References

The original exposition on why and how the new Matplotlib colormaps were created. Highly recommended:

https://bids.github.io/colormap/

Some more information on the linearity of several colormaps, as well as some additional ones that might be interesting to port to Elm in the future:

https://matplotlib.org/users/colormaps.html

https://matplotlib.org/gallery/color/colormap_reference.html
