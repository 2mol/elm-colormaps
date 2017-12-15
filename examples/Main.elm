module Main exposing (main)

import Html exposing (Html, div, text, h3)
import Color.Colormaps as CM


-- example modules:

import ExampleGradients exposing (viewColormap)


gradients : Html msg
gradients =
    div [] <|
        List.map viewColormap
            [ CM.magma
            , CM.inferno
            , CM.plasma
            , CM.viridis
            ]


main : Html msg
main =
    div []
        [ h3 [] [ text "full gradients" ]
        , gradients
        , h3 [] [ text "svg" ]
        , h3 [] [ text "elm-css interop" ]
        , h3 [] [ text "custom colormap" ]
        ]
