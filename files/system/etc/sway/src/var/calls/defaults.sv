include $SWAYDIR/src/var/calls/helper.sv

set {

    $DEFAULT_TERM   	exec footclient --app-id=Terminal --title=Terminal
	$DEFAULT_MENU  	    exec $__WMENU
    $DEFAULT_FILES  	exec Thunar
    $DEFAULT_RELOAD 	exec swaymsg reload
    $DEFAULT_WALLPAPER 	exec $__BGSELEC
}

set {
	$DEFAULT_VOLUME_RAISE exec bluectl volume-up 2
	$DEFAULT_VOLUME_LOWER exec bluectl volume-down 2
	$DEFAULT_VOLUME_MUTE exec bluectl volume-mute
}

set {
	$DEFAULT_LIGHT_RAISE  exec bluectl brightness-up 2
    $DEFAULT_LIGHT_LOWER  exec bluectl brightness-down 2
    }

set {
    $DEFAULT_POWER_OFF    exec $__POFF
    $DEFAULT_LOCKSCREEN   exec noctalia msg session lock
    $DEFAULT_PRINT_NORM   exec $__SCREENSHOT
    $DEFAULT_SCRATCH_GET  exec $__SCRATCH
   }
