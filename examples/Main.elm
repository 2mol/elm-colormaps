module Main exposing (main)

import Html exposing (Html, div, text, h3)
import Color.Colormaps as CM


-- example modules:

import ExampleGradients exposing (gradients)


main : Html msg
main =
    div []
        [ h3 [] [ text "full gradients" ]
        , div [] gradients
        , h3 [] [ text "svg" ]
        , h3 [] [ text "elm-css interop" ]
        , h3 [] [ text "custom colormap" ]
        ]
