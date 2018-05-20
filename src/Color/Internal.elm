module Color.Internal
    exposing
        ( Colormap
        , fromFloatData
        , fromFloatListData
        , fromIntData
        , fromIntListData
        )

import Color exposing (Color, rgb)
import Dict exposing (Dict)


type alias Colormap =
    Float -> Color



-- conversion functions:


fromFloatListData : List (List Float) -> Colormap
fromFloatListData =
    convertListList >> List.map scaleto256 >> fromIntData


fromFloatData : List ( Float, Float, Float ) -> Colormap
fromFloatData =
    List.map scaleto256 >> fromIntData


fromIntListData : List (List Int) -> Colormap
fromIntListData =
    convertListList >> fromIntData


fromIntData : List ( Int, Int, Int ) -> Colormap
fromIntData colorDataList t =
    let
        colorDataDict =
            dataToDict colorDataList

        keys =
            colorDataDict |> Dict.keys

        mminKey =
            keys |> List.minimum

        mmaxKey =
            keys |> List.maximum

        mminColor =
            mminKey |> Maybe.andThen (\k -> Dict.get k colorDataDict)

        mmaxColor =
            mmaxKey |> Maybe.andThen (\k -> Dict.get k colorDataDict)

        mtScaled =
            mmaxKey
                |> Maybe.map toFloat
                |> Maybe.map2 (*) (Just t)
                |> Maybe.map round

        mcolorValue =
            mtScaled |> Maybe.andThen (\k -> Dict.get k colorDataDict)
    in
    case ( mcolorValue, mminColor, mmaxColor ) of
        ( Just ( r, g, b ), _, _ ) ->
            rgb r g b

        ( Nothing, Just ( rMin, gMin, bMin ), Just ( rMax, gMax, bMax ) ) ->
            if t < 0 then
                rgb rMin gMin bMin
            else if t > 1 then
                rgb rMax gMax bMax
            else
                rgb 1 0 1

        _ ->
            rgb 1 0 1



-- not exported, internal helpers only:


convertListList : List (List a) -> List ( a, a, a )
convertListList list =
    case list of
        [] ->
            []

        (x1 :: x2 :: x3 :: _) :: xs ->
            ( x1, x2, x3 ) :: convertListList xs

        _ :: xs ->
            convertListList xs


scaleto256 : ( Float, Float, Float ) -> ( Int, Int, Int )
scaleto256 ( a, b, c ) =
    let
        scale x =
            round (x * 255)
    in
    ( scale a, scale b, scale c )


dataToDict : List ( Int, Int, Int ) -> Dict Int ( Int, Int, Int )
dataToDict tupleList =
    tupleList
        |> List.indexedMap (,)
        |> Dict.fromList
