#!/usr/bin/env bash
set -euo pipefail

exec docker-compose up --build --abort-on-container-exit
