module ExampleCustom exposing (customColormaps)

import Color exposing (Color, hsl)
import Color.Colormaps exposing (Colormap, fromData)


customColormaps : List ( String, Colormap )
customColormaps =
    [ ( "gray", customGrey )
    , ( "pink", customPink )
    , ( "rainbow", customRainbow )
    , ( "random", customRandomData )
    ]


customGrey : Float -> Color
customGrey x =
    hsl 0 0 (1 - x)


customRainbow : Float -> Color
customRainbow x =
    hsl (x * 2 * pi) 0.95 0.65


customPink : Float -> Color
customPink x =
    hsl 5.8 1 x


customRandomData : Float -> Color
customRandomData =
    fromData randomData


randomData : List ( Int, Int, Int )
randomData =
    [ ( 128, 75, 102 )
    , ( 219, 39, 90 )
    , ( 103, 145, 73 )
    , ( 162, 103, 66 )
    , ( 94, 62, 89 )
    , ( 73, 220, 241 )
    , ( 220, 75, 184 )
    , ( 78, 164, 53 )
    , ( 45, 24, 1 )
    , ( 169, 131, 165 )
    , ( 135, 115, 228 )
    , ( 110, 151, 120 )
    , ( 207, 71, 173 )
    , ( 149, 127, 217 )
    , ( 82, 63, 221 )
    , ( 30, 53, 150 )
    , ( 59, 10, 123 )
    , ( 154, 75, 79 )
    , ( 86, 120, 91 )
    , ( 34, 107, 54 )
    , ( 91, 202, 87 )
    , ( 130, 187, 17 )
    , ( 210, 140, 224 )
    , ( 124, 18, 221 )
    , ( 94, 20, 130 )
    , ( 215, 67, 237 )
    , ( 34, 206, 178 )
    , ( 165, 78, 144 )
    , ( 131, 160, 166 )
    , ( 222, 220, 239 )
    , ( 81, 237, 90 )
    , ( 16, 52, 108 )
    , ( 72, 108, 29 )
    ]
