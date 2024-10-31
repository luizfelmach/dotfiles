if ! command -v gum &> /dev/null; then
  echo "command gum not found ..."
  echo "installing gum ..."
  sudo pacman -S gum --noconfirm
fi

packages() {
  PACKAGES="$HOME/.packages"

  if [ ! -d "$PACKAGES" ]; then
      echo "Could not open $PACKAGES"
      exit 1
  fi

  LISTS=$(/usr/bin/ls "$PACKAGES" | gum choose --no-limit --header "Choose lists to install")

  for LIST in $LISTS; do
    yay -S $(cat "$PACKAGES/$LIST" | xargs)
  done
}


