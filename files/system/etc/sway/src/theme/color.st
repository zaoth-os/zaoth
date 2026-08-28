# SET DEFAULT COLORS BEFORE TO AVOID ERRORS OF NON-FILE OR INVALID VAR
set {
     $primary            #67b7e4
     $on_primary         #182025
     $secondary          #5c6cd6
     $tertiary           #8b66cc
     $error              #fd4663
     $surface            #11222c
     $on_surface         #f2f2f3
     $on_surface_variant #afb4b6
     $outline            #616c71
}

include $HOME/.config/sway/theme/*.color

set {
    $destructive_color           $error
    $destructive_bg_color        $error
    $destructive_fg_color        $on_surface

    $theme_selected_bg_color     $primary
    $theme_selected_fg_color     $on_primary

    $theme_unfocused_bg_color    $surface
    $theme_unfocused_fg_color    $on_surface
    $theme_unfocused_base_color  $surface

    $accent_color                $secondary
    $accent_bg_color             $secondary
    $accent_fg_color             $on_primary
}

# main colors to sway using imported colors from noctalia or gtk
set {
    $focused_inative_border             $destructive_color
    $focused_inative_background         $destructive_bg_color
    $focused_inative_text               $destructive_fg_color
    $focused_inative_indicator          $destructive_color
    $focused_inative_child_border       $destructive_color

    $focused_border                     $theme_selected_bg_color
    $focused_background                 $theme_selected_bg_color
    $focused_text                       $theme_selected_fg_color
    $focused_indicator                  $theme_selected_bg_color
    $focused_child_border               $theme_selected_bg_color

    $unfocused_border                   $theme_unfocused_bg_color
    $unfocused_background               $theme_unfocused_bg_color
    $unfocused_text                     $theme_unfocused_fg_color
    $unfocused_indicator                $theme_unfocused_base_color
    $unfocused_child_border             $theme_unfocused_base_color

    $urgent_border                      $accent_color
    $urgent_background                  $accent_bg_color
    $urgent_text                        $accent_fg_color
    $urgent_indicator                   $accent_color
    $urgent_child_border                $accent_color
}

# here config the colors to swaybar
set  {
	$bar_background						$focused_text
	$bar_statusline						$focused_background
	$bar_separator						$focused_border

	$bar_wsf_border 					$focused_border
	$bar_wsf_background					$focused_background
	$bar_wsf_text	 					$focused_text

	$bar_wsi_border 					$unfocused_border
	$bar_wsi_background					$unfocused_background
	$bar_wsi_text	 					$focused_border

	$bar_wsa_border 					$focused_border
	$bar_wsa_background					$focused_background
	$bar_wsa_text	 					$focused_border

	$bar_wsu_border 					$urgent_border
	$bar_wsu_background					$urgent_background
	$bar_wsu_text	 					$urgent_text
}

# this colors to use with wmenu applications..
set {
	$wmenu_bg $bar_wsi_background
	$wmenu_fg $bar_wsi_text
	$wmenu_BG $bar_wsf_background
	$mwenu_FG $bar_wsf_text
}



# INCLUDE CUSTOM COLOR FOR LAST IF EXIST, THAN THIS CAN OVERRIDE THIS ENTIRE CONFIG IF WANTED
include $HOME/.custom_theme_color
