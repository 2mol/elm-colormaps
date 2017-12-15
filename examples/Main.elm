module Main exposing (main)

import Html exposing (Html, div)
import Color.Colormaps as CM


-- example modules:

import ExampleGradients exposing (viewColormap)


main : Html msg
main =
    div [] <|
        List.map viewColormap
            [ CM.magma
            , CM.inferno
            , CM.plasma
            , CM.viridis
            ]
