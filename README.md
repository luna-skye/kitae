# Kitae - Nix Flake for Minecraft Forge
A simple Nix Flake for fetching and extracting a Minecraft Forge server from the official Maven repo.

This project is very much a work in progress and aims to fill my personal needs for modern Forge servers, so I can't recommend it for general use at the moment, nor do I claim this code is acceptable. It isn't.


[Kitae (鍛え)](https://www.japandict.com/%E9%8D%9B%E3%81%88) - Meaning to forge or temper


## ⚠️ Usage Warning
Forge requires upstream dependencies from Mojang which it then patches. This flake doesn't yet provide those in a Nix way, so building this Flake requires the sandbox option to be disabled to allow external downloads by Forge, this however results in an impure derivation, keep this in mind.

For example with:

```fish
nix build --option sandbox false .#default
```

This is not ideal as it could damage reproducibility. In the future I'd like to improve this, among other things.


## Future Plans
- Handle Forge dependencies through Nix if possible to provide pure and reproducible builds
- Implement tests, maybe include test builds of popular server versions (1.12.2, 1.18.2, 1.19.2, 1.20.1, etc.)
- NeoForge alternative source
- Allow JVM user args config through Nix


## NOT Planned
- Nix based properties/config/mod declaration
