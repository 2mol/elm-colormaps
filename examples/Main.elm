module Main exposing (main)

import Html exposing (Html, div, text, h3)
import Html.Attributes exposing (style)


-- example modules:

import ExampleGradients exposing (fullColormaps)
import ExampleElmCss exposing (cssElements)
import ExampleCustom exposing (customColormap)


main : Html msg
main =
    div [ style [ ( "padding-left", "10px" ) ] ]
        [ h3 [] [ text "full colormaps" ]
        , div [] fullColormaps
        , h3 [] [ text "elm-css interop" ]
        , div [] cssElements
        , h3 [] [ text "custom colormap" ]
        , div [] []
        ]
