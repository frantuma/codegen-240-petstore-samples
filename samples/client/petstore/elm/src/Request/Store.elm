{-
   Swagger Petstore
   This is a sample server Petstore server.  You can find out more about Swagger at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/).  For this sample, you can use the api key `special-key` to test the authorization filters.

   OpenAPI spec version: 1.0.0
   Contact: apiteam@swagger.io

   NOTE: This file is auto generated by the swagger code generator program.
   https://github.com/swagger-api/swagger-codegen.git
   Do not edit this file manually.
-}


module Request.Store exposing (deleteOrder, getInventory, getOrderById, placeOrder)

import Data.Order exposing (Order, orderDecoder, orderEncoder)
import Data.Int exposing (Int, intDecoder)
import Http
import Json.Decode as Decode


basePath : String
basePath =
    "https://petstore.swagger.io/v2"


{-
   For valid response try integer IDs with positive integer value. Negative or non-integer values will generate API errors
-}
deleteOrder : Int -> Http.Request ()
deleteOrder orderId =
    { method = "DELETE"
    , url = basePath ++ "/store/order/" ++ toString orderId
    , headers = []
    , body = Http.emptyBody
    , expect = Http.expectStringResponse (\_ -> Ok ())
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


{-
   Returns a map of status codes to quantities
-}
getInventory : Http.Request Int
getInventory =
    { method = "GET"
    , url = basePath ++ "/store/inventory"
    , headers = []
    , body = Http.emptyBody
    , expect = Http.expectJson intDecoder
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


{-
   For valid response try integer IDs with value &gt;&#x3D; 1 and &lt;&#x3D; 10. Other values will generated exceptions
-}
getOrderById : Int -> Http.Request Order
getOrderById orderId =
    { method = "GET"
    , url = basePath ++ "/store/order/" ++ toString orderId
    , headers = []
    , body = Http.emptyBody
    , expect = Http.expectJson orderDecoder
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


{-
   
-}
placeOrder : Order -> Http.Request Order
placeOrder model =
    { method = "POST"
    , url = basePath ++ "/store/order"
    , headers = []
    , body = Http.jsonBody <| orderEncoder model
    , expect = Http.expectJson orderDecoder
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


