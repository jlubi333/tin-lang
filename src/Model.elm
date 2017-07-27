module Model exposing
  ( Msg(..)
  , Model
  , init
  )

type Msg
  = UpdateCode String
  | Run

type alias Model =
  { code : String
  , oldCode : String
  , output : String
  }

init : (Model, Cmd Msg)
init =
  ( { code =
        ""
    , oldCode =
        ""
    , output =
        ""
    }
  , Cmd.none
  )
