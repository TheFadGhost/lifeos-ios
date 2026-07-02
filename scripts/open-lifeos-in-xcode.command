#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_DIR="$ROOT_DIR/LifeOS"

if ! command -v xcodegen >/dev/null 2>&1; then
  cat <<'MESSAGE'
XcodeGen is not installed yet.

Install it for free with Homebrew:
  brew install xcodegen

If Homebrew is not installed, first install it from:
  https://brew.sh

Then double-click this file again.
MESSAGE
  exit 2
fi

cd "$PROJECT_DIR"
xcodegen generate
open LifeOS.xcodeproj
