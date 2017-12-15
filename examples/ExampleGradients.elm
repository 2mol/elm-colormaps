module ExampleGradients exposing (fullColormaps)

import Html exposing (Html, div, span)
import Html.Attributes exposing (style)
import Color exposing (toRgb)
import Color.Colormaps as CM


fullColormaps : List (Html msg)
fullColormaps =
    List.map fullColormap
        [ CM.magma
        , CM.inferno
        , CM.plasma
        , CM.viridis
        ]


fullColormap : CM.Colormap -> Html msg
fullColormap colorMap =
    List.range 0 255
        |> List.map toFloat
        |> List.map (\x -> x / 255)
        |> List.map (\x -> span [ colorSlice colorMap x ] [])
        |> div []


colorSlice : CM.Colormap -> Float -> Html.Attribute msg
colorSlice colorMap x =
    let
        { red, green, blue } =
            colorMap x |> toRgb

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
