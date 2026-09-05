FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# chromium para gowitness/katana headless + utilidades
RUN apt-get update && apt-get install -y --no-install-recommends \
    jq tmux chromium-browser fonts-liberation \
 && rm -rf /var/lib/apt/lists/*
