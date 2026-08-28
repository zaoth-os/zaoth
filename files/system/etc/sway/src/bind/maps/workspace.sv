include $SWAYDIR/src/var/cmds.sv

set {
        # Go to N workspace.
        $WS_1  $_ws 1
        $WS_2  $_ws 2
        $WS_3  $_ws 3
        $WS_4  $_ws 4
        $WS_5  $_ws 5
        $WS_6  $_ws 6
        $WS_7  $_ws 7
        $WS_8  $_ws 8
        $WS_9  $_ws 9
        $WS_10 $_ws 10

        # Move focused window to N workspace.
        $MOVE_WIN_TO_1     exec $sway $_mv $_wn to $_ws 1
        $MOVE_WIN_TO_2     exec $sway $_mv $_wn to $_ws 2
        $MOVE_WIN_TO_3     exec $sway $_mv $_wn to $_ws 3
        $MOVE_WIN_TO_4     exec $sway $_mv $_wn to $_ws 4
        $MOVE_WIN_TO_5     exec $sway $_mv $_wn to $_ws 5
        $MOVE_WIN_TO_6     exec $sway $_mv $_wn to $_ws 6
        $MOVE_WIN_TO_7     exec $sway $_mv $_wn to $_ws 7
        $MOVE_WIN_TO_8     exec $sway $_mv $_wn to $_ws 8
        $MOVE_WIN_TO_9     exec $sway $_mv $_wn to $_ws 9
        $MOVE_WIN_TO_10    exec $sway $_mv $_wn to $_ws 10

        # Move focused window and go to N workspace.
        $MOVE_AND_FOCUS_TO_1   exec $sway $_mv $_wn to $_ws 1 && $sway $_ws 1
        $MOVE_AND_FOCUS_TO_2   exec $sway $_mv $_wn to $_ws 2 && $sway $_ws 2
        $MOVE_AND_FOCUS_TO_3   exec $sway $_mv $_wn to $_ws 3 && $sway $_ws 3
        $MOVE_AND_FOCUS_TO_4   exec $sway $_mv $_wn to $_ws 4 && $sway $_ws 4
        $MOVE_AND_FOCUS_TO_5   exec $sway $_mv $_wn to $_ws 5 && $sway $_ws 5
        $MOVE_AND_FOCUS_TO_6   exec $sway $_mv $_wn to $_ws 6 && $sway $_ws 6
        $MOVE_AND_FOCUS_TO_7   exec $sway $_mv $_wn to $_ws 7 && $sway $_ws 7
        $MOVE_AND_FOCUS_TO_8   exec $sway $_mv $_wn to $_ws 8 && $sway $_ws 8
        $MOVE_AND_FOCUS_TO_9   exec $sway $_mv $_wn to $_ws 9 && $sway $_ws 9
        $MOVE_AND_FOCUS_TO_10  exec $sway $_mv $_wn to $_ws 10 && $sway $_ws 10
}

include $HOME/.config/sway/calls/workspace.kb
