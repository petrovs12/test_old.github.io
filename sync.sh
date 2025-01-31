#!/bin/bash

# Build the site
npx quartz build --directory ../vault

# Add all changes including public directory
git add public -f

# Commit changes if there are any
git diff --staged --quiet || git commit -m "Update site content: $(date)\"

# Push to main branch
git push origin main

echo \"Sync completed!\"
