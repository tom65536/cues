
import model
import puzzles

type
   MessageKind* = enum
      MsgSelectPuzzle,
      MsgConfigPuzzle,
      MsgTimer

   Message* = ref MessageObj

   MessageObj* = object
      case message_kind*: MessageKind
      of MsgSelectPuzzle:
         select_puzzle_kind*: PuzzleKind
      of MsgConfigPuzzle:
         config_puzzle_kind*: PuzzleKind
      of MsgTimer:
         tick_count*: int


proc SelectPuzzle*(puzzle_kind: PuzzleKind) : Message =
   Message(message_kind: MsgSelectPuzzle, select_puzzle_kind: puzzle_kind)

proc ConfigPuzzle*(puzzle_kind: PuzzleKind) : Message =
   Message(message_kind: MsgConfigPuzzle, config_puzzle_kind: puzzle_kind)

proc update*(model: Model, msg: Message) =
   case msg.message_kind
   of MsgSelectPuzzle:
      model.app_state = AppPuzzleRun
      model.puzzle_state.puzzle_kind = msg.select_puzzle_kind
   of MsgConfigPuzzle:
      model.app_state = AppPuzzleConfig
      model.puzzle_config.puzzle_kind = msg.config_puzzle_kind
   of MsgTimer:
      discard 0 # Do nothing - not implemented yet
