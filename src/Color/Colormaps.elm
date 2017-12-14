module Color.Colormaps
    exposing
        ( Colormap
        , fromData
        , magma
        , inferno
        , plasma
        , viridis
        )

{-|


# Colormap

@docs Colormap


# fromData

@docs fromData


# Magma

@docs magma


# Inferno

@docs inferno


# Plasma

@docs plasma


# Viridis

@docs viridis

-}

import Dict exposing (Dict)
import Color exposing (Color, rgb)
import Color.Colormaps.Matplotlib as MPL


{-| -}
type alias Colormap =
    Float -> Color


{-| -}
fromData : Dict Int ( Int, Int, Int ) -> Colormap
fromData colorData t =
    let
        keys =
            colorData |> Dict.keys

        mminKey =
            keys |> List.minimum

        mmaxKey =
            keys |> List.maximum

        mminColor =
            mminKey |> Maybe.andThen (\k -> Dict.get k colorData)

        mmaxColor =
            mmaxKey |> Maybe.andThen (\k -> Dict.get k colorData)

        mtScaled =
            mmaxKey
                |> Maybe.map toFloat
                |> Maybe.map2 (*) (Just t)
                |> Maybe.map round

        mcolorValue =
            mtScaled |> Maybe.andThen (\k -> Dict.get k colorData)
    in
        case ( mcolorValue, mminColor, mmaxColor ) of
            ( Just ( r, g, b ), _, _ ) ->
                rgb r g b

            ( Nothing, Just ( rMin, gMin, bMin ), Just ( rMax, gMax, bMax ) ) ->
                if t < 0 then
                    rgb rMin gMin bMin
                else if t > 1 then
                    rgb rMax gMax bMax
                else
                    rgb 1 0 1

            _ ->
                rgb 1 0 1


{-| -}
magma : Colormap
magma =
    fromData MPL.magmaData


{-| -}
inferno : Colormap
inferno =
    fromData MPL.infernoData


{-| -}
plasma : Colormap
plasma =
    fromData MPL.plasmaData


{-| -}
viridis : Colormap
viridis =
    fromData MPL.viridisData
