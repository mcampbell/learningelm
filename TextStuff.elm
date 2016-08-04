module Main exposing (..)

import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import String exposing (..)


main =
    App.beginnerProgram
        { model = model
        , view = view
        , update = update
        }



-- MODEL


type alias Model =
    { name : String
    , password : String
    , passwordAgain : String
    , submit : Bool
    }


model : Model
model =
    Model "" "" "" False



-- UPDATE


type Msg
    = Name String
    | Password String
    | PasswordAgain String
    | Submit


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name, submit = False }

        Password password ->
            { model | password = password, submit = False }

        PasswordAgain password ->
            { model | passwordAgain = password, submit = False }

        Submit ->
            { model | submit = True }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input [ type' "text", placeholder "Name", onInput Name ] []
        , input [ type' "password", placeholder "Password", onInput Password ] []
        , input [ type' "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
        , button [ type' "button", onClick Submit ] [ text "Submit" ]
        , viewValidation model
        , p [] [ text (toString model) ]
        ]


viewValidation : Model -> Html Msg
viewValidation model =
    let
        ( color, message ) =
            if model.submit then
                if String.length model.password == 0 then
                    ( "red", "" )
                else if String.length model.password < 8 then
                    ( "red", "Password too short!" )
                else if model.password == model.passwordAgain then
                    ( "green", "OK" )
                else
                    ( "red", "Passwords do not match!" )
            else
                ( "red", "" )
    in
        div [ style [ ( "color", color ) ] ] [ text message ]
