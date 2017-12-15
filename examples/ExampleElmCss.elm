module ExampleElmCss exposing (colorCoreToCss)

import Css
import Color
import Color.Colormaps as CM
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Css exposing (..)


colorCoreToCss : Color.Color -> Css.Color
colorCoreToCss c =
    let
        { red, green, blue, alpha } =
            Color.toRgb c
    in
        Css.rgba red green blue alpha


percentage : Float -> Attribute msg
percentage n =
    css
        [ marginLeft (px 1)
        , paddingTop (px 4)
        , paddingBottom (px 1)
        , display inlineBlock
        , textAlign center
        , whiteSpace noWrap
        , width (px 46)
        , color (Css.rgb 1 1 1)
        , backgroundColor (colorCoreToCss <| CM.viridis n)
        ]
