-- &@@@@@@@@@@@@@@@&@@@@@@@@@@@@@%%%%%%%%%%%%%%%%%%%%%%############################
-- &@@@@@@@&@@@@@@@&@@@@@@@&@@%%%%%%%%%%%%%%%%%%%%%%###############################
-- &@@@@@@@@@@@@@@@&@@@@@@@@%%%%%%%%%%%%%%%%%%%%%%#################################
-- &@@@&@@@&@@@&@@@&@@@&@@%%%%%%%%%%%%%%%%%%%%%%%################################%%
-- &@@@@@@@@@@@@@@@&@@@@%%%%%%%%%%%%%%%%%%%%%%%%############################%%%%%%%
-- &@@@@@@@&@@@@@@@&@@&%%%%%%%%%%%%%%%%%%%%%%%%%%#####################%%%%%%%%%%%%%
-- &@@@@@@@@@@@@@@@&@&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- &@&@&@&@&@&@&@&@&&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- &@@@@@@@@@@@@@@@&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- &@@@@@@@&@@@@@@@&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- &@@@@@@@@@@@@@@@&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- &@@@&@@@&@@@&@@@&@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&@@@
-- &@@@@@@@@@@@@@@@&@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&@@@@@@@@@
-- &@@@@@@@&@@@@@@@&@@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&@@@@@@@&@@@@@@@
-- &@@@@@@@@@@@@@@@&@@@@@@@@@&%%%%%%%%%%%%%%%%%%%%%%%%%%%&&@@@@@@@@&@@@@@@@@@@@@@@@
-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
-- &@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@
-- &@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@ @@@@@@@
-- &@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@&@@@@@@@ @@@@@@@
-- &@@@&@@@&  @&@@, @@  *    @.   .&@@@%     &@&@, /    @@@#     @@&@&      @@@&@@@
-- &@@@@@@@@@@  . @&@@  @@@@  @@@@  @@ &@@@@@( @@, &@@@% @@@@@@@ &@& .@@@@@ @@@@@@@
-- &@@@@@@@&@@    @&@@  @@@&  @@@@  @@ &@@@&@# @@, &@@@% @@. @@@ &@& .@@@@@ @@@@@@@
-- &@@@@@@@@  @@@@, &@  @@@@  @@@@  @@@(     &@@@, &@@@% @@. ..    &@&      @@@@@@@
-- &@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@
-- &@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@
-- &@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@
-- &@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@
-- &@@@&@@@&@@@&@@@&@@@&@@@&@@@&@@@&@@@&@@@&@@@&@@@&@@@&@@@&@@@&@@@&@@@&@@@&@@@&@@@
-- &@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@
-- &@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@&@@@@@@@
-- &@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@


-----------------------------------------------------------------------------------
----- IMPORTS ---------------------------------------------------------------------
-----------------------------------------------------------------------------------

-- Base
import XMonad
import Data.Monoid
import System.Exit
import qualified XMonad.StackSet                                               as W

-- Actions
import XMonad.Actions.CopyWindow (killAllOtherCopies)
import qualified XMonad.Actions.TreeSelect                                    as TS
import XMonad.Actions.Submap
import XMonad.Actions.WithAll (killAll)

-- Hooks
import XMonad.Hooks.ManageDocks

-- Layouts
import XMonad.Layout.MultiColumns
import XMonad.Layout.Spacing
import XMonad.Layout.Spiral
import XMonad.Layout.ThreeColumns

-- Util
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Util.NamedScratchpad

-- Data
import qualified Data.Map                                                      as M
import Data.Tree

-----------------------------------------------------------------------------------
----- VARIABLES -------------------------------------------------------------------
-----------------------------------------------------------------------------------

myTerminal = "urxvt"                                            -- Set my terminal.

-- Focus
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True                            -- Set focus to follow mouse. 
myClickJustFocuses :: Bool
myClickJustFocuses = False                   -- Set unfocused windows to clickable.

myBorderWidth   = 1                                            -- Set border width.

myModMask       = mod4Mask                             -- Set mod key to super key. 

-- Colors
myNormalBorderColor  = "#dddddd"                         -- Unfocused border color. 
myFocusedBorderColor = "#ff0000"                           -- Focused border color. 

myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]     -- Numbered workspaces.


-----------------------------------------------------------------------------------
----- KEY BINDINGS ----------------------------------------------------------------
-----------------------------------------------------------------------------------

myKeys :: [(String, X ())]
myKeys =
    [ (("M-S-<Return>")    -- launch a terminal
                           , spawn (myTerminal))
    , (("M-p")             -- launch dmenu
                           , spawn "dmenu_run")
    , (("M-S-p")           -- launch gmrun
                           , spawn "gmrun")
    , (("M-c <Return>")    -- close focused window
                           , kill)
    , (("M-c a")           -- close all windows in workspace
                           , killAll)
    , (("M-c o")           -- close all other similar windows.
                           , killAllOtherCopies)
--    , (("M-S-t")           -- terminal scratchpad
--                           , namedScratchpadAction myScratchPads "terminal")
    , (("M-<Space>")       -- rotate through layouts
                           , sendMessage NextLayout)
    , (("M-n")             -- auto-resize windows
                           , refresh)
    , (("M-d")             -- toggle dunst notifications
                           , spawn "dunstify 'Notifications toggled'; sleep 1; dunstctl set-paused toggle")
    , (("M-<Print>")       -- screenshot entire display
                           , spawn "scrot screen_%Y-%m-%d-%H-%M-%S.png -d 1 -e 'mv $f /home/benfedoruk/Screenshots; ffplay -f lavfi -i \"sine=frequency=1000:duration=0.1\" -autoexit -nodisp'")
    , (("M-S-<Print>")     -- screenshot focused window
                           , spawn "scrot window_%Y-%m-%d-%h-%M-%S.png -d 1 -u -e 'mv $f /home/benfedoruk/Screenshots; ffplay -f lavfi -i \"sine=frequency=1000:duration=0.1\" -autoexit -nodisp'")
    , (("M-C-<Print>")     -- screenshot selection
                           , spawn "sleep 0.2; scrot selection_%Y-%m-%d-%h-%M-%S.png -d 1 -s -e 'mv $f /home/benfedoruk/Screenshots; ffplay -f lavfi -i \"sine=frequency=1000:duration=0.1\" -autoexit -nodisp'")
    , (("M-j")             -- focus next window
                           , windows W.focusDown)
    , (("M-k")             -- focus previous window
                           , windows W.focusUp  )
    , (("M-m")             -- focus master window
                           , windows W.focusMaster  )
    , (("M-<Return>")      -- swap focused and master window
                           , windows W.swapMaster)
    , (("M-S-j")           -- swap focused and next window
                           , windows W.swapDown  )
    , (("M-S-k")           -- swap focused and previous window
                           , windows W.swapUp    )
    , (("M-h")             -- shrink master
                           , sendMessage Shrink)
    , (("M-l")             -- expand master
                           , sendMessage Expand)
    , (("M-t")             -- force tiling
                           , withFocused $ windows . W.sink)
    , (("M-,")             -- increment # windows in master area
                           , sendMessage (IncMasterN 1))
    , (("M-.")             -- decrement # windows in master area
                           , sendMessage (IncMasterN (-1)))
    , (("M-S-t")           -- show actions treeselect
                           , treeselectAction tsDefaultConfig)
    , (("M-S-q")           -- quit to login screen
                           , io (exitWith ExitSuccess))
    , (("M-q")             -- restart xmonad
                           , spawn "xmonad --recompile; xmonad --restart")
    , (("M-S-/")           -- show help menu
                           , spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
    ]
    -- ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    -- [((m .|. modm, k), windows $ f i)
    --    | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
    --    , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    -- ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    -- [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
    --    | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
    --    , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


-----------------------------------------------------------------------------------
----- MOUSE BINDINGS --------------------------------------------------------------
-----------------------------------------------------------------------------------

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]


-----------------------------------------------------------------------------------
----- LAYOUTS ---------------------------------------------------------------------
-----------------------------------------------------------------------------------

mySpacing = spacingRaw True (Border 0 10 10 10) True (Border 10 10 10 10) True

myLayout = avoidStruts (   mySpacing $
                           Tall 1 (3/100) (1/2)                             -- tall
                       ||| Full                                             -- full
                       ||| spiral 0.856                                   -- spiral
                       ||| ThreeCol 1 (3/100) (1/2)                     -- 3 column
                       ||| ThreeColMid 1 (3/100) (1/2)           -- 3 column middle
                       ) 


-----------------------------------------------------------------------------------
----- MANAGE HOOK -----------------------------------------------------------------
-----------------------------------------------------------------------------------

myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]


-----------------------------------------------------------------------------------
----- EVENT HANDLING --------------------------------------------------------------
-----------------------------------------------------------------------------------

myEventHook = mempty


-----------------------------------------------------------------------------------
----- LOG HOOK --------------------------------------------------------------------
-----------------------------------------------------------------------------------

myLogHook = return ()


-----------------------------------------------------------------------------------
----- STARTUP ---------------------------------------------------------------------
 -----------------------------------------------------------------------------------

myStartupHook = do
	spawnOnce "nitrogen --restore &"
	spawnOnce "compton &"
	spawnOnce "dunst &"
	spawnOnce "exec /usr/bin/trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --alpha 0  --tint 0x000000 --height 19 &"
	spawnOnce "sh ~/.screenlayout/tri-monitor-layout.sh"


-----------------------------------------------------------------------------------
----- SCRATCHPADS -----------------------------------------------------------------
-----------------------------------------------------------------------------------

myScratchPads :: [NamedScratchpad]
myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm	    
		]

    where
    spawnTerm = myTerminal ++ " -t scratchpad"
    findTerm = resource =? "scratchpad"
    manageTerm = customFloating $ W.RationalRect l t w h
        where
        h = 0.9
        w = 0.9
        t = 0.95 - h
        l = 0.95 - w


-----------------------------------------------------------------------------------
----- TREESELECT ------------------------------------------------------------------
-----------------------------------------------------------------------------------

treeselectAction :: TS.TSConfig (X ()) -> X ()
treeselectAction a = TS.treeselectAction a
    [ Node (TS.TSNode "hello" "displays hello" (spawn "xmessage hello!")) []
    , Node (TS.TSNode "shutdown" "poweroff the system" (spawn "shutdown")) []
    , Node (TS.TSNode "brightness" "sets screen brightness" (return ()))
        [ Node (TS.TSNode "bright" "100% brightness" (spawn "xbacklight -set 100")) []
        , Node (TS.TSNode "normal" "50% brightness" (spawn "xbacklight -set 50")) []
        , Node (TS.TSNode "dim" "10% brightness" (spawn "xbacklight -set 10")) []
        ]
    ]

myTreeNavigation = M.fromList
    [ ((0, xK_Escape), TS.cancel         )
    , ((0, xK_Return), TS.select         )
    , ((0, xK_Up    ), TS.movePrev       )
    , ((0, xK_Down  ), TS.moveNext       )
    , ((0, xK_Left  ), TS.moveParent     )
    , ((0, xK_Right ), TS.moveChild      )
    , ((0, xK_o     ), TS.moveHistBack   )
    , ((0, xK_i     ), TS.moveHistForward)
    ]

tsDefaultConfig :: TS.TSConfig a
tsDefaultConfig = TS.TSConfig { TS.ts_hidechildren = True
			      , TS.ts_background   = 0xbb000000
			      , TS.ts_font         = "xft:Ubuntu Mono:size=12"
			      , TS.ts_node         = (0xffeeeeee, 0xff222222)
			      , TS.ts_nodealt      = (0xffeeeeee, 0xff222222)
			      , TS.ts_highlight    = (0xffffffff, 0xffff0000)
			      , TS.ts_extra        = 0xffeeeeee
			      , TS.ts_node_width   = 200
			      , TS.ts_node_height  = 20
			      , TS.ts_originX      = 0
			      , TS.ts_originY      = 0
			      , TS.ts_indent       = 80
			      , TS.ts_navigate     = myTreeNavigation
			      }


-----------------------------------------------------------------------------------
----- MAIN ------------------------------------------------------------------------
-----------------------------------------------------------------------------------

main = do
	xmproc <- spawnPipe "xmobar -x 0 /home/benfedoruk/.config/xmobar/xmobarrc"
	xmonad $ docks defaults

	
-----------------------------------------------------------------------------------
----- DEFAULTS --------------------------------------------------------------------
-----------------------------------------------------------------------------------

defaults = def {
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
        mouseBindings      = myMouseBindings,
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    } `additionalKeysP` myKeys


-----------------------------------------------------------------------------------
----- HELP TEXT -------------------------------------------------------------------
-----------------------------------------------------------------------------------

help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Shift-Enter  Launch xterminal",
    "mod-p            Launch dmenu",
    "mod-Shift-p      Launch gmrun",
    "mod-Shift-c      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Return   Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-comma  (mod-,)   Increment the number of windows in the master area",
    "mod-period (mod-.)   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-q  Quit xmonad",
    "mod-q        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging"]


-----------------------------------------------------------------------------------
----- EXTRA COMMENTS --------------------------------------------------------------
-----------------------------------------------------------------------------------

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
---- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)


