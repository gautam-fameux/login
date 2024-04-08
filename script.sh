#!/bin/bash

# Define variables
BRANCH_NAME="third"
OTHER_BRANCH="main"  # Change this to the name of another existing branch

# Switch to the main branch
git checkout "$OTHER_BRANCH"

# Check if the 'third' branch already exists
if git show-ref --quiet "refs/heads/$BRANCH_NAME"; then
    # If 'third' branch exists, delete it
    git branch -D "$BRANCH_NAME"
fi

# Create and switch to a new branch named 'third'
git checkout -b "$BRANCH_NAME"

# Stage changes (assuming all changes are in index.js)
git add index.js

# Commit changes
git commit -m "New changes in index.js"

# Push the new 'third' branch to the remote repository and set upstream
git push -u origin "$BRANCH_NAME"
