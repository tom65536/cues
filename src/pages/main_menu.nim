
import karax / [karax, karaxdsl, kbase, kdom, vdom]


import ../model
import ../puzzles
import ../message

proc makePuzzleTile(model: Model, puzzle_kind: PuzzleKind, title: kstring): VNode =

   proc onPlayButton(event: Event, node: VNode) =
      update(model, SelectPuzzle(puzzle_kind))

   proc onConfigButton(event: Event, node: VNode) =
      update(model, ConfigPuzzle(puzzle_kind))

   buildHtml(tdiv(class = "card")):
      tdiv(class = "container"):
         text(title)
         button(onClick = onPlayButton):
            text("Play")
         button(onClick = onConfigButton):
            text("Config")

proc makeSettingsTile(model: Model): VNode =
   buildHtml(tdiv(class = "card")):
      tdiv(class = "container"):
         text("Settings")

proc makeInfoTile(model: Model): VNode =
   buildHtml(tdiv(class = "card")):
      tdiv(class = "container"):
         text("Info")

proc view_main_menu*(model : Model) : VNode =
   buildHtml(tdiv):
      for puzzle_kind in  PuzzleKind:
         case puzzle_kind
         of NimPuzzleKind:
            makePuzzleTile(model, puzzle_kind, "Nim")
         of MemoryPuzzleKind:
            makePuzzleTile(model, puzzle_kind, "Find Pairs")
         else:
            buildHtml(tdiv()):
               text("unimplemented " & $puzzle_kind)
      makeSettingsTile(model)
      makeInfoTile(model)

