module PixelArtFinished exposing (..)

import PixelArtStyle exposing (..)
import Html exposing (beginnerProgram, button, div, Html, p, table, tbody, text, tr, td)
import Html.Attributes exposing (height, style, width)
import Html.Events exposing (onClick)
import List
import Matrix exposing (get, loc, Location, mapWithLocation, Matrix, set, square, toList)
import Maybe exposing (Maybe(..))


-- Constants


gridSize : number
gridSize =
    15



-- Model


type alias Data =
    { location : Location, checked : Bool }


type alias Model =
    Matrix Data


model : Model
model =
    square gridSize (\location -> Data location False)



-- Message


type Message
    = Toggle Location
    | Clear
    | Fill



-- Update


update : Message -> Model -> Model
update message grid =
    case message of
        Toggle location ->
            case get location grid of
                Nothing ->
                    grid

                Just data ->
                    set location { data | checked = data |> .checked |> not } grid

        Clear ->
            Matrix.map (\data -> { data | checked = False }) grid

        Fill ->
            Matrix.map (\data -> { data | checked = True }) grid



-- View


createCells : List Data -> List (Html Message)
createCells row =
    List.map (\data -> td [ style (determineCellStyle data), onClick (Toggle (.location data)) ] []) row


view : Model -> Html Message
view model =
    div [ style containerStyle ]
        [ table [ style tableStyle ]
            [ tbody [] (model |> toList |> List.map (\r -> tr [] (createCells r)))
            ]
        , p []
            [ button [ onClick Clear ] [ text "Clear" ]
            , button [ onClick Fill ] [ text "Fill" ]
            ]
        ]



-- Main


main : Program Never Model Message
main =
    beginnerProgram { model = model, update = update, view = view }
