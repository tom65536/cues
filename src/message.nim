
type
   MessageKind* = enum
      MsgChange

   Message* = ref MessageObj

   MessageObj* = object
      case message_kind*: MessageKind
      of MsgChange:
         amount: int
