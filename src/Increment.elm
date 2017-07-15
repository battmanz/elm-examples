module Main exposing (..)

import Html exposing (beginnerProgram, button, div, p, text)
import Html.Events exposing (onClick)


-- Model


type alias Model =
    Int


model : Model
model =
    42



-- Message


type Message
    = Increment
    | Decrement



-- Update


update : Message -> Model -> Model
update message model =
    case message of
        Increment ->
            model + 1

        Decrement ->
            model - 1



-- View


view : Model -> Html.Html Message
view model =
    div []
        [ p [] [ model |> toString |> text ]
        , button [ onClick Increment ] [ text "+1" ]
        , button [ onClick Decrement ] [ text "-1" ]
        ]


main : Program Never Model Message
main =
    beginnerProgram { model = model, update = update, view = view }
