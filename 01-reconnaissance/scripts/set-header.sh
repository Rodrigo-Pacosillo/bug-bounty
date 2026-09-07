#!/bin/bash
# Header Configuration Script for CLEAR Bug Bounty
# Ensures X-Bug-Bounty header is properly set

echo "CLEAR Bug Bounty Header Configuration"
echo "====================================="
echo ""
echo "IMPORTANT: This script sets environment variables for your current terminal session."
echo "For browser automation, you need to manually visit: https://www.clearme.com/?bug-bounty-program=HackerOne&bug-bounty-username=<YOUR_USERNAME>"
echo ""

# Read username from user
read -p "Enter your HackerOne username: " USERNAME

if [ -z "$USERNAME" ]; then
    echo "Error: Username cannot be empty"
    exit 1
fi

# Set environment variables
export X_BUG_BOUNTY="HackerOne-$USERNAME"

echo ""
echo "✓ X-Bug-Bounty header set to: $X_BUG_BOUNTY"
echo ""
echo "To verify, run in your terminal:"
echo "  echo \$X_BUG_BOUNTY"
echo ""
echo "For testing with curl:"
echo "  curl -H \"X-Bug-Bounty: \$X_BUG_BOUNTY\" https://www.clearme.com"
echo ""
echo "Export to your shell config (~/.bashrc or ~/.zshrc) for persistence:"
echo "  echo 'export X_BUG_BOUNTY=\"HackerOne-$USERNAME\"' >> ~/.bashrc"
echo ""

# Save to file for reference
mkdir -p bug-bounty/01-reconnaissance/data/headers
echo "$X_BUG_BOUNTY" > bug-bounty/01-reconnaissance/data/headers/current-header.txt
echo "✓ Saved to: bug-bounty/01-reconnaissance/data/headers/current-header.txt"
