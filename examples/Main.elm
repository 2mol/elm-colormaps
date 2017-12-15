module Main exposing (main)

import Html exposing (Html, div, text, h3)
import Html.Attributes exposing (style)


-- example modules:

import ExampleGradients exposing (fullColormaps)
import ExampleSvg exposing (drawing)
import ExampleElmCss exposing (elements)


main : Html msg
main =
    div [ style [ ( "padding-left", "10px" ) ] ]
        [ h3 [] [ text "full colormaps" ]
        , div [] fullColormaps
        , h3 [] [ text "svg" ]
        , div [] [ drawing ]
        , h3 [] [ text "elm-css interop" ]
        , div [] elements
        , h3 [] [ text "custom colormap" ]
        , div [] []
        ]
