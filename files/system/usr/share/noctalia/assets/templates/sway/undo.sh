set -euo pipefail

config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/sway"
config_file="$config_dir/theme/noctalia.color"
font_file="$config_dir/theme/font"

rm -f "$font_file" "$config_file"
