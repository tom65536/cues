
type
   PuzzleKind* = enum
      NimPuzzleKind,
      MemoryPuzzleKind

   AppState* = enum
      AppMainMenu,
      AppPuzzleConfig,
      AppPuzzleRun

   MainMenuEntryKind* = enum
      MainMenuPuzzleEntry,
      MainMenuConfigEntry,
      MainMenuInfoEntry

   MainMenuModelObj* = object
      case selected_entry_kind*: MainMenuEntryKind
      of MainMenuPuzzleEntry:
         selected_puzzle* : PuzzleKind
      of MainMenuConfigEntry:
         nothing_config : int
      of MainMenuInfoEntry:
         nothing_info : int

   NimPuzzleConfigObj* = object
      size: int

   MemoryPuzzleConfigObj* = object
      rows, cols: int

   PuzzleConfigObj* = object
      case puzzle_kind*: PuzzleKind
      of NimPuzzleKind:
         nim_puzzle_config*: NimPuzzleConfigObj
      of MemoryPuzzleKind:
         memory_puzzle_config*: MemoryPuzzleConfigObj

   NimPuzzleStateObj* = distinct int
   MemoryPuzzleStateObj* = distinct int

   PuzzleStateObj* = object
      case puzzle_kind*: PuzzleKind
      of NimPuzzleKind:
         nim_puzzle_state*: NimPuzzleStateObj
      of MemoryPuzzleKind:
         memory_puzzle_state*: MemoryPuzzleStateObj

   Model* = ref ModelObj

   ModelObj* = object
      case app_state*: AppState
      of AppMainMenu:
         main_menu_model*: MainMenuModelObj
      of AppPuzzleConfig:
         puzzle_config*: PuzzleConfigObj
      of AppPuzzleRun:
         puzzle_state*: PuzzleStateObj
