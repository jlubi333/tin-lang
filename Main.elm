module Main exposing (main)

import Model exposing (..)

import Controller
import Subscriptions
import View

import Html

main :  Program Never Model Msg
main =
  Html.program
    { init =
        Model.init
    , view =
        View.view
    , update =
        Controller.update
    , subscriptions =
        Subscriptions.subscriptions
    }
