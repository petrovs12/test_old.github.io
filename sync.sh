#!/bin/bash

# Build the site
npx quartz build --directory test-content

# Add all changes
git add -A

# Commit changes if there are any
git diff --staged --quiet || git commit -m \"Update site content\"

# Push to main branch
git push origin main

echo \"Sync completed!\"
