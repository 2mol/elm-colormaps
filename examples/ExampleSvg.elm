module ExampleSvg exposing (drawing)

import Svg exposing (svg, circle)
import Svg.Attributes exposing (cx, cy, r)


drawing =
    svg [] [ circle [ cx "50", cy "50", r "50" ] [] ]
