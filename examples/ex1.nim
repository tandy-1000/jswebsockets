import ../websockets

var ws = openws("ws://echo.websocket.org/")
var outputid = "output" # nicer syntax for appending

ws.onopen = proc(e:Event) =
  outputid.append("sent: test")
  ws.send("test")
ws.onmessage = proc(e:MessageEvent) =
  outputid.append("received: ",e.data)
  ws.close(1000,"received msg")
ws.onclose = proc(e:CloseEvent) =
  outputid.append("closing: ",e.reason)

