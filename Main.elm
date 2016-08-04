module Main exposing (..)

import Html


add a b =
    a + b


result =
    1 `add` 2


(~+) a b =
    a + b + 0.1


isEven =
    add 6 2 |> \a -> a % 2 == 0


main =
    Html.text (toString result)
