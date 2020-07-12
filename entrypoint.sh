#!/bin/ash
# shellcheck shell=dash

set -euo pipefail

run_cmd() {
  # github actions runner has overwriting some values when running docker action so we need to run this just before
  # running `github-actions`
  gcloud auth configure-docker -q

  /github-actions "$@"
}

run_cmd "$@"
