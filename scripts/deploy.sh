#!/usr/bin/env bash
set -Eeuo pipefail

docker rm -f myapp || true
docker run -d -p 8080:80 --name myapp myapp:latest
