
import karax / [karax, karaxdsl, kbase, kdom, vdom]

import model
import message

import pages / [main_menu]


proc view(model: Model): VNode =
   case model.app_state
   of AppMainMenu:
      view_main_menu(model)

   of AppPuzzleConfig:
      buildHtml(tdiv):
         h1(text "config puzzle")
   of AppPuzzleRun:
      buildHtml(tdiv):
         h1(text "run puzzle")

proc main() =
   var model = init()

   proc render(): VNode =
      view(model)

   setRenderer render

when isMainModule:
   main()
