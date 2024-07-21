# cdda-experimenta-git-flake

This is my personal nix flake to run the autommatically built CDDA game from
CDDA github repo. Beware that I'm using this flake for learning nix flakes and nixos.

# running for a quick try

- Remotely: `nix run github:cloudyluna/cdda-experimental-git-flake`.

- Locally: `nix run` or `nix run .#default` from within the repo directory.

# install

- Remotely: `nix profile install github:cloudyluna/cdda-experimental-git-flake`
- Locally:  `nix profile install .` from within the directory.

# Extra mods

I also bundle some mods that I like as another package.

> NOTE: Remember to enable them in your world creation menu by pressing 'm' button and select your mod of choice
in the world creation screen.

## Current included mods for extra package are:
- [Tankmod Revived](https://github.com/chaosvolt/cdda-tankmod-revived-mod) (commit hash: 70278e9576a875c801ff6848e059312ae97a411c)
  - M1 Abrams, electric powered mini tank, etc. I love battle tanks in this game! Cozy and comfy.
- [CDDA-Minimods](https://github.com/John-Candlebury/CDDA-Minimods/) (commit hash: 2b8fbb3ffe1ecded1b0716d6d6601977752457d5)
  - Included submods:
    - ***No_rust*** because I don't want want character skills to decay overtime of when rarely used. Remember
    this mod can be found in the balance tab in the mod menu.

To make this work, just append `#extras` to the package name.

For example:

To install remotely: `nix profile install github:cloudyluna/cdda-experimental-git-flake#extras`

# game version

- 2024-06-26-1623

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
