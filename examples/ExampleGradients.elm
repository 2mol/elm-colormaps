module ExampleGradients exposing (fullColormap)

import Html exposing (Html, div, span)
import Html.Attributes exposing (style)
import Color.Convert exposing (colorToHex)
import Color.Colormaps as CM


fullColormap : CM.Colormap -> Html msg
fullColormap colorMap =
    List.range 0 255
        |> List.map toFloat
        |> List.map (\x -> span [ colorSlice colorMap (x / 255) ] [])
        |> div []


colorSlice : CM.Colormap -> Float -> Html.Attribute msg
colorSlice colorMap x =
    style
        [ ( "backgroundColor", colorToHex <| colorMap x )
        , ( "height", "32px" )
        , ( "width", "2px" )
        , ( "display", "inline-block" )
        ]
