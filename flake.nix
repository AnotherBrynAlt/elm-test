{
  description = "Simple Elm Environment";

  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  outputs = { self, nixpkgs, ... }:
    let 
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      devShells.x86_64-linux.default =
        pkgs.mkShell {
	  buildInputs = with pkgs.elmPackages; [
	    elm
	    elm-format
	    elm-language-server
	    elm-review
	  ];
	};
    };
}
