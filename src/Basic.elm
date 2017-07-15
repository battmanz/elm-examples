module Main exposing (..)

import Html exposing (div, h1, p, text)


main : Html.Html msg
main =
    div []
        [ h1 [] [ text "Hello World" ]
        , p [] [ text "Elm is Awesome" ]
        ]
