#!/usr/bin/env bash
set -euo pipefail

# deploy.sh - build and deploy my-react-app to Netlify
# Usage:
#   NETLIFY_AUTH_TOKEN=your_token NETLIFY_SITE_ID=your_site_id ./deploy.sh
#   or run ./deploy.sh and the script will prompt / open login if token missing

SITE_ID=${NETLIFY_SITE_ID:-}

echo "Building my-react-app..."
npm --prefix ./my-react-app run build

DIST_DIR="my-react-app/dist"
if [ ! -d "$DIST_DIR" ]; then
  echo "Build output not found at $DIST_DIR" >&2
  exit 1
fi

if ! command -v netlify >/dev/null 2>&1; then
  echo "netlify CLI not found; installing..."
  npm install -g netlify-cli
fi

if [ -z "${NETLIFY_AUTH_TOKEN:-}" ]; then
  echo "NETLIFY_AUTH_TOKEN not set; launching netlify login..."
  netlify login
fi

if [ -z "$SITE_ID" ]; then
  echo "No NETLIFY_SITE_ID provided; deploying interactively..."
  netlify deploy --dir=$DIST_DIR --prod
else
  echo "Deploying to site: $SITE_ID"
  netlify deploy --dir=$DIST_DIR --site=$SITE_ID --prod
fi

echo "Deploy complete."
