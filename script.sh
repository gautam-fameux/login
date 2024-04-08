#!/bin/bash

# Define variables
BRANCH_NAME="one"
OTHER_BRANCH="main"  # Change this to the name of another existing branch

# Stage all changes
echo "Staging all changes"
git add .

# Check if there are any changes
if ! git diff --quiet --exit-code; then
    # Commit all changes
    echo "Committing all changes"
    git commit -m "Update: Commit all changes"
fi

# Switch to the main branch
git checkout "$OTHER_BRANCH"

# Check if the 'one' branch already exists
if git show-ref --quiet "refs/heads/$BRANCH_NAME"; then
    # If 'one' branch exists, delete it
    git branch -D "$BRANCH_NAME"
fi

# Create and switch to a new branch named 'one'
git checkout -b "$BRANCH_NAME"

# Push the new 'one' branch to the remote repository and set upstream
echo "Pushing changes to the remote repository"
git push -u origin "$BRANCH_NAME"
