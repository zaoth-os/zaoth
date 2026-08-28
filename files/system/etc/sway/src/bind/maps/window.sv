set {
    $DEFAULT_SHOW_SCRATCH   exec scratchpad
    $DEFAULT_TO_SCRATCH     move scratchpad
    $DEFAULT_TO_KILL        kill
    $DEFAULT_TO_FULLSCREEN  fullscreen

    $DEFAULT_TOGGLE_FLOAT   floating toggle
    $DEFAULT_TOGGLE_MODE    layout toggle all
    $DEFAULT_TOGGLE_SPLIT   split toggle
}

set {

    $DEFAULT_FOCUS_LEFT    focus left
    $DEFAULT_FOCUS_RIGHT   focus right
    $DEFAULT_FOCUS_UP      focus up
    $DEFAULT_FOCUS_DOWN    focus down

    $DEFAULT_MOVE_LEFT    move left
    $DEFAULT_MOVE_RIGHT   move right
    $DEFAULT_MOVE_UP      move up
    $DEFAULT_MOVE_DOWN    move down

    $DEFAULT_GROW_WIDTH     resize grow width
    $DEFAULT_GROW_HEIGHT    resize grow height
    $DEFAULT_SHRINK_WIDTH   resize shrink width
    $DEFAULT_SHRINK_HEIGHT  resize shrink height

}

include $HOME/.config/sway/calls/window.kb
