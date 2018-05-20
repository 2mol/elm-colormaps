module Color.Colormaps
    exposing
        ( Colormap
        , cividis
        , fromData
        , fromFloatData
        , fromFloatListData
        , fromIntData
        , fromIntListData
        , inferno
        , magma
        , plasma
        , viridis
        )

{-|


# Colormap

@docs Colormap


# fromData

@docs fromData


# fromIntData

@docs fromIntData


# fromIntListData

@docs fromIntListData


# fromFloatData

@docs fromFloatData


# fromFloatListData

@docs fromFloatListData


# Magma

@docs magma


# Inferno

@docs inferno


# Plasma

@docs plasma


# Viridis

@docs viridis


# Cividis

@docs cividis

-}

import Color.Internal as Internal
import Color.Internal.Matplotlib as MPL


{-| `Colormap` is an alias for `Float -> Color`, so it is simply a function that takes a floating point number between 0 and 1 and returns a Color.
-}
type alias Colormap =
    Internal.Colormap


{-| Gives a `Colormap` for a list of integer 3-tuples, where each element corresponds to an RGB value between (0, 0, 0) and (255, 255, 255).

The colors will not get interpolated, so the resulting colormap is as coarse or fine-grained as the datapoints that are provided.

-}
fromData : List ( Int, Int, Int ) -> Colormap
fromData =
    Internal.fromIntData


{-| The unambiguous name for `fromData`.
-}
fromIntData : List ( Int, Int, Int ) -> Colormap
fromIntData =
    Internal.fromIntData


{-| Similar to `fromIntData`, for cases where the RGB values are provided as a list of lists. In this case the sublists are expected to contain 3 values, corresponding to the red, green and blue color channels.
-}
fromIntListData : List (List Int) -> Colormap
fromIntListData =
    Internal.fromIntListData


{-| Similar to `fromIntData`, for cases where the RGB values are given as tuples of floating point numbers between 0 and 1.
-}
fromFloatData : List ( Float, Float, Float ) -> Colormap
fromFloatData =
    Internal.fromFloatData


{-| The same functionality as `fromIntListData` where the RGB values floating point numbers between 0 and 1.
-}
fromFloatListData : List (List Float) -> Colormap
fromFloatListData =
    Internal.fromFloatListData


{-| -}
magma : Colormap
magma =
    MPL.magma


{-| -}
inferno : Colormap
inferno =
    MPL.inferno


{-| -}
plasma : Colormap
plasma =
    MPL.plasma


{-| -}
viridis : Colormap
viridis =
    MPL.viridis


{-| -}
cividis : Colormap
cividis =
    MPL.cividis
