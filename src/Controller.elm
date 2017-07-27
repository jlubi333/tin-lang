module Controller exposing (update)

import Model exposing (..)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    UpdateCode newCode ->
      ( { model | code = newCode }
      , Cmd.none
      )
    Run ->
      let
        oldCode =
          model.code
        newOutput =
          model.code
      in
        ( { model
              | oldCode =
                  oldCode
              , output =
                  newOutput
          }
        , Cmd.none
        )
