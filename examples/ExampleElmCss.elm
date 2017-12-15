module ExampleElmCss exposing (elements)

import Css
import Color
import Color.Colormaps as CM
import Html as CoreHtml
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Css exposing (..)


elements : List (CoreHtml.Html msg)
elements =
    List.map toUnstyled cssElements


cssElements : List (Html msg)
cssElements =
    List.range 0 10
        |> List.map (\x -> x * 10)
        |> List.map drawPercentageBox


colorCoreToCss : Color.Color -> Css.Color
colorCoreToCss c =
    let
        { red, green, blue, alpha } =
            Color.toRgb c
    in
        Css.rgba red green blue alpha


percentageStyle : Css.Color -> Attribute msg
percentageStyle cssColor =
    css
        [ backgroundColor cssColor
        , color (Css.rgb 255 255 255)
        , paddingTop (px 2)
        , display inlineBlock
        , textAlign center
        , width (px 48)
        ]


drawPercentageBox : Int -> Html msg
drawPercentageBox n =
    let
        cssColor =
            n
                |> toFloat
                |> (\x -> x / 100)
                |> CM.viridis
                |> colorCoreToCss
    in
        span [ percentageStyle cssColor ] [ text <| toString n ++ "%" ]
