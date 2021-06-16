
import karax / [karax, karaxdsl, kbase, kdom, vdom]



type
  Model = ref object
    content : kstring

  Message = enum
    Change

proc init() : Model =
  Model(
    content: ""
  )

proc update(model : Model, msg : Message) =
  case msg
    of Change:
      model.content = "changed"

proc view(model : Model) : VNode =
  proc onChange(ev : Event, n : VNode) =
    update(model, Message.Change)

  buildHtml(tdiv):
    h1(text "Hello Karax")

    textarea(onkeyup = onChange)

    tdiv:
      span(text $model.content)

proc main() =
  var model = init()

  proc render() : VNode =
    view(model)

  setRenderer render

when isMainModule:
  main()
