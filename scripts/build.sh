#!/usr/bin/env bash
set -Eeuo pipefail

docker build -t myapp:latest -f docker/Dockerfile .

