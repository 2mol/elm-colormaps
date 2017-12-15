module Main exposing (main)

import Html exposing (Html, div, text, h3)


-- example modules:

import ExampleGradients exposing (fullColormaps)


main : Html msg
main =
    div []
        [ h3 [] [ text "full colormaps" ]
        , div [] fullColormaps
        , h3 [] [ text "svg" ]
        , h3 [] [ text "elm-css interop" ]
        , h3 [] [ text "custom colormap" ]
        ]
