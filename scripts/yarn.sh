#!/usr/bin/env bash
set -e

# Install node modules
echo -e "\\nInstalling node modules..."
yarn global add \
    eslint \
    livedown \
    remark-lint \
    typescript
