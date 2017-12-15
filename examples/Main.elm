module Main exposing (main)

import Html exposing (Html, div, text, h3)


-- example modules:

import ExampleGradients exposing (fullColormaps)
import ExampleElmCss exposing (cssElements)


main : Html msg
main =
    div []
        [ h3 [] [ text "full colormaps" ]
        , div [] fullColormaps
        , h3 [] [ text "svg" ]
        , div [] []
        , h3 [] [ text "elm-css interop" ]
        , div [] cssElements
        , h3 [] [ text "custom colormap" ]
        , div [] []
        ]
