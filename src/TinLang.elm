module TinLang exposing
  ( Exp(..)
  )

type Exp
  = Number
      { val : Float
      }
  | Boolean
      { val : Bool
      }
