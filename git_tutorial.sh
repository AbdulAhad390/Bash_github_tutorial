#!/bin/bash

# 🎯 GitHub Workflow Tutorial Generator

# --- Colors ---
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

# --- Helper functions ---
success() { echo "${GREEN}✅ $1${RESET}"; }
error()   { echo "${RED}❌ $1${RESET}"; }
info()    { echo "${BLUE}ℹ $1${RESET}"; }

clear
echo "${YELLOW}============================================${RESET}"
echo "${YELLOW}   Welcome to GitHub Workflow Tutorial ${RESET}"
echo "${YELLOW}============================================${RESET}"
echo

# Lesson 1: git init
info "Lesson 1: Initialize a Git repository"
while true; do
    read -p "Run: git init : " cmd
    if [ "$cmd" = "git init" ]; then
        eval "$cmd"
    fi
    if [ -d ".git" ]; then
        success "Repository initialized!"
        break
    else
        error "Repo not found yet."
        sleep 1
    fi
done
echo

# Lesson 2: git add .
info "Lesson 2: Stage your files"
while true; do
    read -p "Run: git add . : " cmd
    if [ "$cmd" = "git add ." ]; then
        eval "$cmd"
    fi
    staged=$(git diff --cached --name-only)
    if [ -n "$staged" ]; then
        success "Files staged successfully!"
        break
    else
        error "No files staged yet."
        sleep 1
    fi
done
echo

# Lesson 3: git commit -m "first commit"
info "Lesson 3: Make your first commit"
while true; do
    read -p "Run: git commit -m \"first commit\" : " cmd
    if [[ "$cmd" =~ git\ commit\ -m\ \"first\ commit\" ]]; then
        eval "$cmd"
    fi
    commits=$(git rev-list --count HEAD 2>/dev/null || echo 0)
    if [ "$commits" -ge 1 ]; then
        success "First commit created!"
        break
    else
        error "No commit detected yet."
        sleep 1
    fi
done
echo

# Lesson 4: git branch -M main
info "Lesson 4: Rename branch to main"
while true; do
    read -p "Run: git branch -M main : " cmd
    if [ "$cmd" = "git branch -M main" ]; then
        eval "$cmd"
    fi
    branch=$(git branch --show-current 2>/dev/null)
    if [ "$branch" = "main" ]; then
        success "Branch renamed to main!"
        break
    else
        error "Branch is not 'main' yet."
        sleep 1
    fi
done
echo

# Lesson 5: git remote add origin <URL>
info "Lesson 5: Add remote origin (simulated)"
while true; do
    read -p "Run: git remote add origin https://github.com/username/repo.git : " cmd
    if [[ "$cmd" =~ git\ remote\ add\ origin ]]; then
        success "✅ (Simulated) Remote 'origin' would be added."
        echo "ℹ️ In real life, this links your local repo with GitHub."
        break
    else
        error "Please type: git remote add origin <URL>"
        sleep 1
    fi
done
echo

# Lesson 6: git push -u origin main
info "Lesson 6: Push to GitHub (simulated)"
while true; do
    read -p "Run: git push -u origin main : " cmd
    if [ "$cmd" = "git push -u origin main" ]; then
        success "✅ (Simulated) Code would be pushed to GitHub."
        echo "ℹ️  In real life, this uploads your commits to the remote repo."
        break
    else
        error "Please type: git push -u origin main"
        sleep 1
    fi
done
echo


# Lesson 7: Merge feature branch into main
info "Lesson 7: Merge a feature branch into main"

echo "👉 First, let's create a feature branch and add a dummy file."
git checkout -b feature >/dev/null 2>&1
echo "This is a feature file" > feature.txt
git add feature.txt
git commit -m "add feature file" >/dev/null 2>&1
git checkout main >/dev/null 2>&1

echo "✅ A branch 'feature' with a commit has been created for you."

echo
echo "Now your task: merge it into main."
echo "Run: git merge feature"

while true; do
    read -p "Run: git merge feature : " merge_cmd
    if [ "$merge_cmd" = "git merge feature" ]; then
        eval "$merge_cmd"
    fi

    merged=$(git log --oneline | grep "add feature file" || true)
    if [ -n "$merged" ]; then
        success "Feature branch successfully merged into main!"
        break
    else
        error "Not merged yet. Run: git merge feature"
        sleep 2
    fi
done
echo

# Lesson 8: git clone (simulated)
info "Lesson 8: Clone a repository (simulated)"

echo "👉 Normally, you would run:"
echo "   git clone https://github.com/username/repo.git"
echo

while true; do
    read -p "Run: git clone https://github.com/username/repo.git : " cmd
    if [[ "$cmd" =~ git\ clone ]]; then
        success "✅ (Simulated) Repository would be cloned into a new folder."
        echo "ℹ️  In real life, this makes a local copy of a remote repository."
        echo "📂 Example structure of a cloned repo:"
        echo "   cloned_repo/"
        echo "     ├── README.md"
        echo "     ├── .gitignore"
        echo "     └── main.py"
        break
    else
        error "Please type: git clone <URL>"
        sleep 1
    fi
done
echo


echo
echo "${GREEN}🎉 Congratulations! You completed the extended GitHub workflow tutorial!${RESET}"
echo "Now you know: init, add, commit, branch, remote, push, merge, and clone."
