module TinParser exposing
  (parse)

import TinLang exposing (..)

import Parser as P exposing
  ( Parser
  , (|=)
  , (|.)
  )

--------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------

token : String -> a -> Parser a
token text val =
  P.map (\_ -> val) (P.keyword text)

whitespace : Parser ()
whitespace =
  let
    isWhitespace c =
      c == ' ' || c == '\t' || c == '\n'
  in
    P.ignore P.zeroOrMore isWhitespace

--------------------------------------------------------------------------------
-- Numbers
--------------------------------------------------------------------------------

number : Parser Exp
number =
  P.succeed (\x -> Number { val = x })
    |= P.float

--------------------------------------------------------------------------------
-- Booleans
--------------------------------------------------------------------------------

boolean : Parser Exp
boolean =
  P.oneOf
    [ token "true" <| Boolean { val = True }
    , token "false" <| Boolean { val = False }
    ]

--------------------------------------------------------------------------------
-- General
--------------------------------------------------------------------------------

exp : Parser Exp
exp =
  P.succeed identity
    |. whitespace
    |= P.oneOf
         [ number
         , boolean
         ]

program : Parser Exp
program =
  P.succeed identity
    |= exp
    |. whitespace
    |. P.end

--------------------------------------------------------------------------------
-- Exports
--------------------------------------------------------------------------------

parse : String -> Result P.Error Exp
parse =
  P.run program
