module Example exposing (main)

import Color.Colormaps as CM
import Color.Convert exposing (colorToHex)
import ExampleCustom exposing (customColormaps)
import ExampleElmCss exposing (cssElements)
import Html exposing (Html, div, text)
import Html.Attributes exposing (style)


main : Html msg
main =
    let
        colormaps =
            [ ( "magma", CM.magma )
            , ( "inferno", CM.inferno )
            , ( "plasma", CM.plasma )
            , ( "viridis", CM.viridis )
            , ( "cividis", CM.cividis )
            ]
    in
    div [ style [ ( "padding-left", "10px" ) ] ]
        [ Html.h1 [] [ text "Examples" ]
        , Html.h2 [] [ text "Provided Colormaps" ]
        , div [] <| List.map fullColormap colormaps
        , Html.h2 [] [ text "Using elm-css" ]
        , div [] cssElements
        , Html.h2 [] [ text "Custom Colormaps" ]
        , div [] <| List.map fullColormap customColormaps
        ]


fullColormap : ( String, CM.Colormap ) -> Html msg
fullColormap ( name, colorMap ) =
    List.range 0 255
        |> List.map toFloat
        |> List.map (\x -> Html.span [ colorSlice colorMap (x / 255) ] [])
        |> wrapNicely name


colorSlice : CM.Colormap -> Float -> Html.Attribute msg
colorSlice colorMap x =
    style
        [ ( "backgroundColor", colorToHex <| colorMap x )
        , ( "height", colormapHeight )
        , ( "width", "2px" )
        , ( "display", "inline-block" )
        ]


wrapNicely : String -> List (Html msg) -> Html msg
wrapNicely name content =
    let
        nice =
            style
                [ ( "border-style", "solid" )
                , ( "border-color", "#aaa" )
                , ( "height", colormapHeight )
                , ( "padding", "3px" )
                , ( "margin", "3px" )
                , ( "border-width", "1px" )
                , ( "display", "inline-block" )
                , ( "text-align", "right" )
                ]

        labelStyle =
            style
                [ ( "position", "absolute" )
                , ( "top", "50%" )
                , ( "transform", "translateY(-50%)" )
                , ( "width", "50px" )
                , ( "overflow", "none" )
                ]

        label =
            Html.span [ labelStyle ] [ text name ]

        spacer =
            Html.span [ style [ ( "minWidth", "60px" ), ( "display", "inline-block" ) ] ] [ text "" ]
    in
    div
        [ style [ ( "position", "relative" ) ] ]
        (label :: spacer :: [ Html.span [ nice ] content ])


colormapHeight =
    "32px"
