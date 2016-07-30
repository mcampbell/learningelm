module Main exposing (..)

import Html


add a b =
    a + b


result =
    -- add 1 2
    add 1 2 |> add 3


isEven =
    add 6 2 |> \a -> a % 2 == 0


main =
    Html.text (toString isEven)
