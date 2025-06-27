# lean prover
curl https://elan.lean-lang.org/elan-init.sh -sSf | sh

# scala coursier
# On x86-64 (aka AMD64)
curl -fL "https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz" | gzip -d > cs

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

chmod +x cs
./cs setup

opam init
opam update
