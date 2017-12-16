module Main exposing (main)

import Html exposing (Html, div, text, h3)
import Html.Attributes exposing (style)
import Color.Colormaps as CM


-- example modules:

import ExampleGradients exposing (fullColormap)
import ExampleElmCss exposing (cssElements)
import ExampleCustom exposing (customColormaps)


main : Html msg
main =
    div [ style [ ( "padding-left", "10px" ) ] ]
        [ h3 [] [ text "full colormaps" ]
        , div [] <| List.map fullColormap [ CM.magma, CM.inferno, CM.plasma, CM.viridis ]
        , h3 [] [ text "elm-css interop" ]
        , div [] cssElements
        , h3 [] [ text "custom colormaps" ]
        , div [] <| List.map fullColormap customColormaps
        ]
