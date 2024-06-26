# cdda-experimenta-git-flake

This is my personal nix flake to run the autommatically built CDDA game from
CDDA github repo. Beware that I'm using this flake for learning nix flakes and nixos.

# game version

- 2024-06-26-0530

# exposed binaries

- `cdda-tiles-launcher` - A shell script to launch `cataclysm-tiles` with my preferred settings of choice.
- `cataclysm-tiles` - The invoked game binary. Call this manually (with `--help` for info) if you want more control.

# userdir

I don't want to to mess with my existing CDDA game user directories, so I set a custom one in `$HOME/.cdda-experimental-git`.

# supported archs

- x86_64_linux

I don't see any point of supporting more but feel free to extend the flake.

# not supported
- TUI/ncurses edition.
