#!/bin/bash

# REPO_URL https://github.com/yunting2001/propeller-app

# Step 1: Create React app using create-react-app
npx create-react-app propeller-app --template cra-template
cd propeller-app

# Step 2: Initialize git, commit, and create GitHub repository using GitHub CLI
git init
git config user.email "yunting2001@users.noreply.github.com"
git config user.name "yunting2001"
git add .
git commit -m "Initial commit: create-react-app"
gh repo create propeller-app --public --source=. --remote=origin --push

# Step 3: Switch to "update_logo" branch
git checkout -b update_logo

# Step 4 & 5: Replace logo and link in src/App.js
# (Edit src/App.js to replace logo src with https://www.propelleraero.com/wp-content/uploads/2021/05/Vector.svg)
# (Edit src/App.js to replace href with https://www.propelleraero.com/dirtmate/)

# Step 6: Commit and push the changes
git add src/App.js
git commit -m "Update logo and link to Propeller Aero"
git push origin update_logo

# Step 7: Create a PR from "update_logo" branch to "master" branch using GitHub CLI
gh pr create \
  --title "Update logo and link to Propeller Aero" \
  --body "Replace the default React logo with Propeller Aero logo and update the link to https://www.propelleraero.com/dirtmate/" \
  --base master \
  --head update_logo

# Step 8: Merge the PR using GitHub CLI (skipping approval step)
gh pr merge 1 --merge --admin
