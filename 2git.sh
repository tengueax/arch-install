#!/bin/sh

USERNAME="tengueax"
EMAIL="tengueax@tutamail.com"
GPG_KEY="REDACTED"

# ssh-keygen -t ed25519 -C "$EMAIL"

git config --global init.defaultBranch main
git config --global user.name "$USERNAME"
git config --global user.email "$EMAIL"

git config --global --unset gpg.format
git config --global user.signingkey "$GPG_KEY"
git config --global commit.gpgsign true
