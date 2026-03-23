#!/usr/bin/env bash
set -euo pipefail

NEW_VERSION="${1:-${NEW_VERSION:-${VERSION:-}}}"
if [ -z "${NEW_VERSION}" ]; then
  echo "usage: make version NEW_VERSION=0.1.1" >&2
  exit 1
fi

if ! [[ "${NEW_VERSION}" =~ ^[0-9]+\.[0-9]+\.[0-9]+([.-][0-9A-Za-z.-]+)?$ ]]; then
  echo "error: NEW_VERSION must look like semver (for example 0.1.1 or 1.0.0-rc.1)" >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${REPO_ROOT}"

if ! command -v perl >/dev/null 2>&1; then
  echo "error: perl is required for version bump replacements" >&2
  exit 1
fi

CURRENT_VERSION="$(awk -F '"' '/^version = "/ { print $2; exit }' trigrep-cli/Cargo.toml)"
if [ -z "${CURRENT_VERSION}" ]; then
  echo "error: could not detect current version from trigrep-cli/Cargo.toml" >&2
  exit 1
fi

if [ "${CURRENT_VERSION}" = "${NEW_VERSION}" ]; then
  echo "version is already ${NEW_VERSION}" >&2
  exit 0
fi

export CURRENT_VERSION
export NEW_VERSION

perl -i -pe 's/version = "\Q$ENV{CURRENT_VERSION}\E"/version = "$ENV{NEW_VERSION}"/g' \
  trigrep-cli/Cargo.toml \
  trigrep-index/Cargo.toml

perl -0777 -i -pe 's/(name = "trigrep-cli"\nversion = ")\Q$ENV{CURRENT_VERSION}\E(")/$1$ENV{NEW_VERSION}$2/; s/(name = "trigrep-index"\nversion = ")\Q$ENV{CURRENT_VERSION}\E(")/$1$ENV{NEW_VERSION}$2/;' \
  Cargo.lock

perl -i -pe 's/v\Q$ENV{CURRENT_VERSION}\E/v$ENV{NEW_VERSION}/g' README.md

echo "bumped version: ${CURRENT_VERSION} -> ${NEW_VERSION}" >&2
echo "updated: trigrep-cli/Cargo.toml, trigrep-index/Cargo.toml, Cargo.lock, README.md" >&2
