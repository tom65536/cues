
import puzzles

type
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


   Model* = ref ModelObj

   ModelObj* = object
      case app_state*: AppState
      of AppMainMenu:
         main_menu_model*: MainMenuModelObj
      of AppPuzzleConfig:
         puzzle_config*: PuzzleConfigObj
      of AppPuzzleRun:
         puzzle_state*: PuzzleStateObj

proc init*(): Model =
   Model(
     app_state: AppMainMenu,
     main_menu_model: MainMenuModelObj(selected_entry_kind: MainMenuInfoEntry)
   )
