include $SWAYDIR/src/var/helpers.sv

set {

    $DEFAULT_TERM   	exec footclient --app-id=Terminal --title=Terminal
    $DEFAULT_FILES  	exec Thunar
    $DEFAULT_BROWSER    exec librewolf

    $DEFAULT_RELOAD 	exec swaymsg reload
	$DEFAULT_MENU  	    exec noctalia msg panel-open launcher
    $DEFAULT_WALLPAPER 	exec noctalia msg panel-open wallpaper
}

set {
	$DEFAULT_VOLUME_RAISE exec noctalia msg volume-up 2
	$DEFAULT_VOLUME_LOWER exec noctalia msg volume-down 2
	$DEFAULT_VOLUME_MUTE exec noctalia msg volume-mute
}

set {
	$DEFAULT_LIGHT_RAISE  exec noctalia msg brightness-up 2
    $DEFAULT_LIGHT_LOWER  exec noctalia msg brightness-down 2
}

set {
	$DEFAULT_POWER_OFF    exec noctalia msg panel-open session
    $DEFAULT_LOCKSCREEN   exec noctalia msg session lock
    $DEFAULT_PRINT_NORM   exec noctalia msg screenshot-fullscreen
    $DEFAULT_PRINT_REGION exec noctalia msg screenshot-region
}

include $HOME/.config/sway/calls/system.kb
