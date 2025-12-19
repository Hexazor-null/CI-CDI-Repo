#!/usr/bin/env bash
set -Eeuo pipefail

if grep -q "CI/CD" app/index.html; then
  echo "✅ Test passed: 'CI/CD' found in index.html"
else
  echo "❌ Test failed: 'CI/CD' not found in index.html"
  exit 1
fi

