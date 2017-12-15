module ExampleGradients exposing (viewColormap)

import Html exposing (Html, text, div, span)
import Html.Attributes exposing (style)
import Color exposing (toRgb)
import Color.Colormaps exposing (Colormap)


viewColormap : Colormap -> Html msg
viewColormap cm =
    List.range 0 255
        |> List.map toFloat
        |> List.map (\x -> x / 255)
        |> List.map (\x -> span [ colorspanStyle cm x ] [])
        |> div []


colorspanStyle : Colormap -> Float -> Html.Attribute msg
colorspanStyle cm x =
    let
        { red, green, blue } =
            cm x |> toRgb

        rgbString =
            [ red, green, blue ]
                |> List.map toString
                |> String.join ", "
    in
        style
            [ ( "backgroundColor", "rgb(" ++ rgbString ++ ")" )
            , ( "height", "32px" )
            , ( "width", "1px" )
            , ( "display", "inline-block" )
            ]
