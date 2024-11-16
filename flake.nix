{
  description = "Nix Flake for declarative Minecraft Forge servers";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;

    mcVersion = "1.20.1";
    forgeVersion = "47.3.12";
    sha = "6117bf266bf8395cc216a9f9438c26f15cbede3b9b416857bbf70e07c15840f7";
  in {
    packages.x86_64-linux.default = pkgs.stdenv.mkDerivation {
      name = "minecraft-forge-server";

      src = pkgs.fetchurl {
        url = "https://maven.minecraftforge.net/net/minecraftforge/forge/${mcVersion}-${forgeVersion}/forge-${mcVersion}-${forgeVersion}-installer.jar";
        sha256 = sha;
      };

      buildInputs = [ pkgs.openjdk17 ];

      unpackPhase = ''
        mkdir -p $out
        cp $src $out/forge-installer.jar
      '';

      buildPhase = ''
        cd $out
        java -jar $out/forge-installer.jar --installServer
        rm forge-installer.jar
      '';

      #  TODO: figure out how to effectively symlink built files

      # installPhase = ''
      #   ln -s $out/server $out/minecraft-forge-server
      # '';

      meta = {
        description = "Minecraft Forge Server";
        license = pkgs.lib.licenses.unfree;
        platforms = pkgs.lib.platforms.linux;
      };
    };
  };
}
