import asynchttpserver, asyncdispatch, asyncnet, parseopt, strformat

var
  server = newAsyncHttpServer()
  message = "Hello World"

proc writeHelp() =
  echo """
http_echo [options]

 -t:<message>, --text:<message>    - Set message text to echo
 -h, --help                        - This help message
"""
  quit(QuitFailure)

proc render(req: Request): string =
  result = &"""
<h2>Request Details</h2>
<table>
  <thead>
  </thead>
  <tbody>
    <tr><th>protocol</th><td>{req.protocol}</td></tr>
    <tr><th>method</th><td>{req.reqMethod}</td></tr>
    <tr><th>hostname</th><td>{req.hostname}</td></tr>
    <tr><th>url</th><td>{req.url}</td></tr>
    <tr><th>is SSL?</th><td>{isSsl(req.client)}</td></tr>
    <tr><th>headers</th><td>{req.headers}</td></tr>
    <tr><th>client</th><td>{getPeerAddr(req.client)}</td></tr>
    <tr><th>body</th><td>{req.body}</td></tr>
  </tbody>
</table>
  """

proc cb(req: Request) {.async, gcsafe.} =
  let msg = &"""
<h1>http-echo</h1>
<p>The message was ... {message}</p>
<hr/>
{render(req)}
  """
  let headers = newHttpHeaders([("Content-Type", "text/html")])
  await req.respond(Http200, msg, headers)

when isMainModule:
  var p = initOptParser()
  for kind, key, val in p.getopt():
    case kind
    of cmdLongOption, cmdShortOption:
      case key
      of "text", "t":
        echo "text was set to ", val
        message = val
      of "help", "h": writeHelp()
    of cmdArgument:
      assert(false)
    of cmdEnd:
      assert(false)

  waitFor server.serve(Port(8080), cb)
