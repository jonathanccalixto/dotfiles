# Imports profiles files
for extension in (zsh sh); do
  for file in `find ${dotfiles}/profile.d/*.$extension -n -maxdepth 1`; do
    source $file;
  done
done
