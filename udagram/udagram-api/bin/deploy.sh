#!/bin/bash
set -e

echo "EB_APP: $EB_APP"
echo "EB_ENV: $EB_ENV"

# Go to the backend folder (adjust if needed)
cd ./www

# Optional: write all env vars to .env for the app itself
printenv > .env

# Initialize Elastic Beanstalk app (non-interactive)
eb init "$EB_APP" \
  --platform node.js \
  --region "$AWS_REGION"

# Select environment
eb use "$EB_ENV"

# Set all environment variables on EB from CircleCI
eb setenv \
  PORT="$PORT" \
  USERNAME="$USERNAME" \
  AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID" \
  AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" \
  AWS_REGION="$AWS_REGION" \
  AWS_DEFAULT_REGION="$AWS_REGION" \
  AWS_PROFILE="$AWS_PROFILE" \
  AWS_BUCKET="$AWS_BUCKET" \
  JWT_SECRET="$JWT_SECRET" \
  POSTGRES_DB="$POSTGRES_DB" \
  POSTGRES_HOST="$POSTGRES_HOST" \
  POSTGRES_PASSWORD="$POSTGRES_PASSWORD" \
  POSTGRES_PORT="$POSTGRES_PORT" \
  POSTGRES_USERNAME="$POSTGRES_USERNAME" \
  URL="$URL"

# Deploy!
eb deploy "$EB_ENV"
