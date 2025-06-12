#!/bin/bash
set -e  # Arrêter à la première erreur

# Vérifie si exécuté avec sudo
if [[ $EUID -ne 0 ]]; then
  echo "This script must be executede as root with sudo."
  exec sudo bash "$0" "$@"
fi

# --- CONFIGURATION UTILISATEUR ---
echo "️Making main directories..."
sudo -u "$SUDO_USER" mkdir -p "$USER_HOME"/{Documents,Downloads,Pictures/wallpapers,Music,Videos,.config,.local/bin,.config/scripts}

echo "symlink to /run/media/$SUDO_USER..."
sudo -u "$SUDO_USER" ln -sf "/run/media/$SUDO_USER" "$USER_HOME/devices"

echo "Cloning ranger_devicons plugins..."
sudo -u "$SUDO_USER" git clone https://github.com/alexanderjeurissen/ranger_devicons "$USER_HOME/.config/ranger/plugins/ranger_devicons"

echo "Configuration de Hyprlock..."
sudo -u "$SUDO_USER" tee "$USER_HOME/.config/hypr/hyprlock.conf" > /dev/null <<EOF
background {
  monitor = LVDS-1
  path = $USER_HOME/Pictures/wallpapers/wallpaper.png
  blur_size = 1
  blur_passes = 1
}

input-field {
  monitor = LVDS-1
  size = 300, 60
  outline_thickness = 2
  outline_color = rgba(255, 255, 255, 0.2)
  inner_color = rgba(0, 0, 0, 0.4)
  font_color = rgba(255, 255, 255, 1.0)
  placeholder_text = Enter a password
}
EOF

echo "Configuration de Hyprpaper..."
sudo -u "$SUDO_USER" tee "$USER_HOME/.config/hypr/hyprpaper.conf" > /dev/null <<EOF
preload = $USER_HOME/Pictures/wallpapers/wallpaper.png
wallpaper =, $USER_HOME/Pictures/wallpapers/wallpaper.png
wallpaper_mode = fit
EOF

# --- COPIE DE FICHIERS PERSONNELS ---
echo "Copie des fichiers personnels..."
sudo -u "$SUDO_USER" cp ./scripts/cliphist-rofi "$USER_HOME/.local/bin/"
sudo -u "$SUDO_USER" cp ./scripts/cliphist-rofi-img "$USER_HOME/.local/bin/"
sudo -u "$SUDO_USER" cp "$USER_HOME/arch-config/wallpaper.png" "$USER_HOME/Pictures/wallpapers/"
sudo -u "$SUDO_USER" cp -r "$USER_HOME/arch-config/.config/"* "$USER_HOME/.config/"
sudo -u "$SUDO_USER" cp "$USER_HOME/arch-config/.github_tokens.yml" "$USER_HOME/"
sudo -u "$SUDO_USER" cp "$USER_HOME/arch-config/scripts/git-profile" "/usr/local/bin/"
sudo -u "$SUDO_USER" cp "$USER_HOME/arch-config/scripts/screen-zone.sh" "$USER_HOME/.config/scripts/"

chmod +x /usr/local/bin/git-profile
chmod +x "$USER_HOME/.config/scripts/screen-zone.sh"

echo "Installation complete."