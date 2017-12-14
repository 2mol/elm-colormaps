module Main exposing (main)

import Html exposing (Html, text, div, span)
import Html.Attributes as HtmlA
import Color exposing (Color, toRgb)
import Color.Colormaps as CM


main : Html msg
main =
    div [] (viewColormap CM.viridis)



--[ Html.text "Hello World" ]


viewColormap : CM.Colormap -> List (Html msg)
viewColormap cm =
    List.range 0 255
        |> List.map toFloat
        |> List.map (\x -> x / 255)
        |> List.map (\x -> span [ colorspanStyle cm x ] [])


colorspanStyle cm x =
    let
        { red, green, blue } =
            cm x |> toRgb

        rgbString =
            [ red, green, blue ]
                |> List.map toString
                |> String.join ", "
    in
        HtmlA.style
            [ ( "backgroundColor", "rgb(" ++ rgbString ++ ")" )
            , ( "height", "32px" )
            , ( "width", "1px" )
            , ( "float", "left" )
            ]
