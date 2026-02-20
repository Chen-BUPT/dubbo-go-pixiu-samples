#!/usr/bin/env bash
set -euo pipefail

PIXIU_URL="${PIXIU_URL:-http://127.0.0.1:18889}"
MODEL_NAME="${MODEL_NAME:-Qwen2.5-3B-Instruct}"

export NO_PROXY="${NO_PROXY:-127.0.0.1,localhost}"
export no_proxy="${no_proxy:-127.0.0.1,localhost}"

body=$(cat <<JSON
{"model":"${MODEL_NAME}","messages":[{"role":"user","content":"kvcache byoe verification request"}]}
JSON
)

curl -sS -H 'Content-Type: application/json' \
  -X POST "${PIXIU_URL}/v1/chat/completions" \
  -d "${body}"
echo ""
