websockets
----

Websockets wrapper for the [nim](https://nim-lang.org) JavaScript backend.

```nim
import websockets

var
  socket = newWebSocket("ws://echo.websocket.org/")

socket.onOpen = proc (e:Event) =
  echo("sent: test")
  socket.send("test")
socket.onMessage = proc (e:MessageEvent) =
  echo("received: ",e.data)
  socket.close(StatusCode(1000),"received msg")
socket.onClose = proc (e:CloseEvent) =
  echo("closing: ",e.reason)
```

