#!/bin/bash

# Create content directory if it doesn't exist
mkdir -p content

# Copy all markdown files from the parent directory, excluding private files and .obsidian
cd ..
find . -name "*.md" ! -path "*/private*" ! -path "*/.obsidian/*" ! -path "*/quartz/*" -exec cp {} quartz/content/ \;

# Copy any assets (images, etc.)
find . -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.gif" -o -name "*.svg" ! -path "*/private*" ! -path "*/.obsidian/*" ! -path "*/quartz/*" -exec cp {} quartz/content/ \;

echo "Content moved successfully!" 
