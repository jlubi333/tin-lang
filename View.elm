module View exposing (view)

import Model exposing (..)

import ModelHelpers

import Html exposing (Html)
import Html.Attributes as A
import Html.Events as E

-- Header

header : Html Msg
header =
  Html.h1
    [ A.id "header"
    ]
    [ Html.text "tin-lang"
    ]

-- Work Area

editor : Model -> Html Msg
editor model =
  Html.div
    [ A.id "editor"
    ]
    [ Html.div
        []
        [ Html.h2
            []
            [ Html.text "Input"
            ]
        , Html.div
            [ A.id "run-button"
            , E.onClick Run
            ]
            [ Html.text "Run ▸"
            ]
        ]
    , Html.textarea
        [ A.autofocus True
        , E.onInput UpdateCode
        ]
        []
    ]

output : Model -> Html Msg
output model =
  let
    dirtyFlag =
      if ModelHelpers.isDirty model then
        "dirty"
      else
        ""
  in
    Html.div
      [ A.id "output"
      , A.class dirtyFlag
      ]
      [ Html.h2
          []
          [ Html.text "Output"
          ]
      , Html.pre
          []
          [ Html.text model.output
          ]
      ]

workArea : Model -> Html Msg
workArea model =
  Html.div
    [ A.id "work-area"
    ]
    [ editor model
    , output model
    ]

-- View

view : Model -> Html Msg
view model =
  Html.div
    [ A.id "view"
    ]
    [ header
    , workArea model
    ]
