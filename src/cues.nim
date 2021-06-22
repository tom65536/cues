
import karax / [karax, karaxdsl, kbase, kdom, vdom]

import model
import message


proc init(): Model =
   Model(
     app_state: AppMainMenu,
     main_menu_model: MainMenuModelObj(selected_entry_kind: MainMenuInfoEntry)
   )

proc update(model: Model, msg: Message) =
   discard 0

proc view(model: Model): VNode =
   proc onChange(ev: Event, n: VNode) =
      update(model, Message(message_kind: MessageKind.MsgChange))

   buildHtml(tdiv):
      h1(text "Hello Karax")

      textarea(onkeyup = onChange)

proc main() =
   var model = init()

   proc render(): VNode =
      view(model)

   setRenderer render

when isMainModule:
   main()
