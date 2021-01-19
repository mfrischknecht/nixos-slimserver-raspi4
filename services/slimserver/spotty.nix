{ stdenv
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage rec {
  pname = "spotty";
  version = "0.35.0";

  src = fetchFromGitHub {
    owner = "michaelherger";
    repo = pname;
    rev = "v${version}";
    sha256 = "1plkig39y0wfm2vcnw6b806n4xm3gf0n6s76rxqh4fkpg5lj7xb9";
  };

  cargoSha256 = "0kwc7a9dd33xcb8j8x7c1dxnb0yal0nx5zgdr7mbsbq8rlg5y0yd";

  cargoPatches = [
    # Remove the dependency on the avx2 branch of rust-crypto.
    # This currently breaks nix builds, because `cargo vendor`
    # (used by `buildRustPackage` fails to deal with `replace`).
    ./use-cargo-rust-crypto.patch
  ];

  meta = with stdenv.lib; {
    description = "An open source client application for Spotify";
    homepage = "https://github.com/michaelherger/spotty";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
