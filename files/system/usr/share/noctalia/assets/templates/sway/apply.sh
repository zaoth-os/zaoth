set -euo pipefail

config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
config_file="$config_dir/sway/theme/font"
font_name="set \$font_name $(gsettings get org.gnome.desktop.interface font-name)"

mkdir -p "$(dirname "$config_file")"

if [ ! -f "$config_file" ]; then
    printf '%s\n' "$font_name" >"$config_file"
    exit 0
fi

if ! grep -q '^include .*noctalia' "$config_file"; then
    printf '\n%s\n' "$font_name" >>"$config_file"
fi
