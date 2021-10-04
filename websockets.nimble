# Package
version       = "0.1.4"
author        = "stisa & tandy1000"
description   = "Websockets for the JS backend"
license       = "MIT"

srcDir = "src"
skipDirs = @["templates"]
# Deps
requires "nim >= 0.16.0"

import os

task docs, "Build docs":
  mkdir "docs"
  exec "nim doc --backend:js --verbosity:0 --hints:off -o:docs src/websockets.nim"
  exec "rm docs.out nimdoc.out.css"

task examples, "Build examples":
  mkdir "docs/examples"
  withdir "examples":
    for file in listfiles("."):
      if splitfile(file).ext == ".nim":
        exec "nim js -d:test --verbosity:0 --hints:off -o:../docs/examples"/ file.changefileext("js") & " " & file
