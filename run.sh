#!/bin/bash

set -ex

pnpm -C renovate install

exec pnpm -C renovate start \
    "--base-dir=${PWD}/basedir" \
    --report-type=logging \
    amezin/renovate-submodule-fail-2
