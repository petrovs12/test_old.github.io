#!/bin/bash

# Create test-content directory if it doesn't exist
mkdir -p test-content

# Copy only specific files
cp ../vault/index.md ../vault/about.md ../vault/science.math.md ../vault/science.math.Functional\ Analysis.Kernel\ Methods.md test-content/

# Build the site
npx quartz build --directory test-content

# Add all changes
git add -A

# Commit changes if there are any
git diff --staged --quiet || git commit -m \"Update site content\"

# Push to main branch
git push origin main

echo \"Sync completed!\"
