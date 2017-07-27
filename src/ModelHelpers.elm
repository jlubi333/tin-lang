module ModelHelpers exposing
  (isDirty)

import Model exposing (..)

isDirty : Model -> Bool
isDirty model =
  model.code /= model.oldCode
