#!/bin/sh -l

echo Creating deployer directory

mkdir ~/.config
mkdir ~/.config/dfx
mkdir ~/.config/dfx/identity
mkdir ~/.config/dfx/identity/default

echo Adding identity.pem and wallets file file

echo $INPUT_IDENTITY > ~/.config/dfx/identity/default/identity.pem
sed -i 's/\\r\\n/\r\n/g' ~/.config/dfx/identity/default/identity.pem
echo $INPUT_WALLETS > ~/.config/dfx/identity/default/wallets.json

which dfx

echo "Path:"

echo $PATH


rustup install stable

rustup target add wasm32-unknown-unknown

cargo install ic-cdk-optimizer --root target

echo "Deploying to the IC"

dfx deploy --network=$INPUT_NETWORK $INPUT_DFX_PARAMS
