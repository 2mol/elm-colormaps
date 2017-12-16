module ExampleCustom exposing (customColormaps)

import Dict exposing (Dict, fromList)
import Color exposing (Color, hsl)
import Color.Colormaps exposing (Colormap, fromData)


customColormaps : List Colormap
customColormaps =
    [ customColormap0, customColormap1, customColormap2, customColormap3 ]


customColormap0 : Float -> Color
customColormap0 x =
    hsl 0 0 (1 - x)


customColormap1 : Float -> Color
customColormap1 =
    fromData custom1


customColormap2 : Float -> Color
customColormap2 x =
    hsl (x * 2 * pi) 0.95 0.65


customColormap3 : Float -> Color
customColormap3 x =
    hsl 5.8 1 (1 - x)


custom1 : Dict Int ( Int, Int, Int )
custom1 =
    fromList <|
        List.indexedMap (,) <|
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
            , ( 173, 184, 160 )
            , ( 144, 181, 88 )
            , ( 22, 236, 120 )
            , ( 171, 240, 101 )
            , ( 60, 40, 92 )
            , ( 235, 120, 249 )
            , ( 140, 62, 179 )
            , ( 191, 77, 246 )
            , ( 102, 198, 161 )
            , ( 210, 34, 178 )
            , ( 151, 86, 33 )
            , ( 87, 178, 47 )
            , ( 246, 117, 28 )
            , ( 28, 181, 231 )
            , ( 119, 85, 90 )
            , ( 77, 208, 68 )
            , ( 73, 105, 92 )
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
