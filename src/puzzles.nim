
import puzzles/nim_puzzle
import puzzles/memory_puzzle

type
   PuzzleKind* = enum
      NimPuzzleKind,
      MemoryPuzzleKind

   PuzzleConfigObj* = object
      case puzzle_kind*: PuzzleKind
      of NimPuzzleKind:
         nim_puzzle_config*: NimPuzzleConfigObj
      of MemoryPuzzleKind:
         memory_puzzle_config*: MemoryPuzzleConfigObj

   PuzzleStateObj* = object
      case puzzle_kind*: PuzzleKind
      of NimPuzzleKind:
         nim_puzzle_state*: NimPuzzleStateObj
      of MemoryPuzzleKind:
         memory_puzzle_state*: MemoryPuzzleStateObj
