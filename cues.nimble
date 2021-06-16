# Package

version       = "0.1.0"
author        = "Thomas Reiter"
description   = "Puzzle Collection"
license       = "GPL-3.0-or-later"
srcDir        = "src"
bin           = @["cues"]
backend       = "js"

task webapp, "Updates the files in the webapp folder":
  exec "nim js -d:release --out: webapp/app.js src/cues.nim"

# Dependencies

requires "nim >= 1.4.8"
requires "karax >= 1.2.1"
