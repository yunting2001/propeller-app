#!/bin/bash

# REPO_URL https://github.com/yunting2001/propeller-app

# Step 1: Create React app using create-react-app
npx create-react-app propeller-app
cd propeller-app

# Step 2: Authenticate GitHub CLI, create GitHub repository, and push code
gh auth login
gh repo create propeller-app --public --source=. --remote=origin --push

# Step 3: Switch to "update_logo" branch
git checkout -b update_logo

# Step 4: Replace the existing logo with Propeller Aero logo
sed -i "" 's|img src={logo}|img src="https://www.propelleraero.com/wp-content/uploads/2021/05/Vector.svg"|g' src/App.js

# Step 5: Replace the existing link with Propeller Aero dirtmate link
sed -i "" 's|href="https://reactjs.org"|href="https://www.propelleraero.com/dirtmate/"|g' src/App.js

# Step 6: Commit and push the changes
git add .
git commit -m "Update logo and link to Propeller Aero"
git push origin update_logo

# Step 7: Create a PR from "update_logo" branch to "master" branch using GitHub CLI
gh pr create --title "Update logo" --body "Updating logo and link" --base master --head update_logo

# Step 8: Merge the PR using GitHub CLI (skipping approval step)
gh pr merge --merge --admin
