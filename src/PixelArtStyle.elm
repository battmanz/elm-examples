module PixelArtStyle exposing (..)

-- Note: I have just done the simple thing here and defined my styles as lists of tuples.
--       Checkout https://github.com/rtfeldman/elm-css for a more robust CSS library for Elm.


cellSize : number
cellSize =
    20


containerStyle : List ( String, String )
containerStyle =
    [ ( "width", "300px" ), ( "margin", "100px auto" ) ]


tableStyle : List ( String, String )
tableStyle =
    [ ( "borderCollapse", "collapse" ), ( "tableLayout", "fixed" ) ]


columnStyle : List ( String, String )
columnStyle =
    [ ( "width", (toString cellSize) ++ "px" ), ( "height", (toString cellSize) ++ "px" ) ]


cellStyle1 : List ( String, String )
cellStyle1 =
    [ ( "border", "solid 1px #333" ), ( "width", (toString cellSize) ++ "px" ), ( "height", (toString cellSize) ++ "px" ) ]


cellStyle2 : List ( String, String )
cellStyle2 =
    cellStyle1 ++ [ ( "backgroundColor", "black" ) ]



-- Helper Functions


determineCellStyle : { a | checked : Bool } -> List ( String, String )
determineCellStyle { checked } =
    if checked then
        cellStyle2
    else
        cellStyle1
