#!/bin/bash
# Copy files in first while we are still in the dir
cp -r helix $HOME/.config

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup component add rust-analyzer

# Helix
mkdir -p $HOME/src
cd $HOME/src
git clone https://github.com/helix-editor/helix
cd helix
cargo install \
   --profile opt \
   --config 'build.rustflags="-C target-cpu=native"' \
   --path helix-term \
   --locked
echo 'export HELIX_RUNTIME=~/src/helix/runtime' >> $HOME/.bashrc
