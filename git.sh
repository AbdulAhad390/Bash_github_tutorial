#!/bin/bash

# 🎯 GitHub Workflow Tutorial Generator (Safe Learning Mode)

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
echo "You will learn Git step-by-step. Each lesson explains a concept,"
echo "then you practice by typing the correct command."
echo

# Lesson 1: git init
info "Lesson 1: Initialize a Git repository"
echo "📖 'git init' creates a new Git repository in the current folder."
echo "It sets up a hidden '.git' directory where Git stores all version history."
echo
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

# Lesson 1.5: git status (before add)
info "Lesson 1.5: Check repo status (before staging)"
echo "📖 'git status' shows the state of your working directory."
echo "Right after 'git init', files appear as 'untracked'."
echo
while true; do
    read -p "Run: git status : " cmd
    if [ "$cmd" = "git status" ]; then
        eval "$cmd"
        success "You saw the status! Files are untracked at this stage."
        break
    else
        error "Please type: git status"
        sleep 1
    fi
done
echo

# Lesson 2: git add .
info "Lesson 2: Stage your files"
echo "📖 'git add .' stages all the changes in your project."
echo "Staging means preparing files to be part of the next commit."
echo
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

# Lesson 2.5: git status (after add, before commit)
info "Lesson 2.5: Check repo status (after staging)"
echo "📖 After 'git add .', files are staged for commit."
echo "Now 'git status' will show them under 'Changes to be committed'."
echo
while true; do
    read -p "Run: git status : " cmd
    if [ "$cmd" = "git status" ]; then
        eval "$cmd"
        success "You saw the status! Files are staged and ready to commit."
        break
    else
        error "Please type: git status"
        sleep 1
    fi
done
echo

# Lesson 2.6: git diff
info "Lesson 2.6: View changes with git diff"
echo "📖 'git diff' shows unstaged code changes."
echo "Use it to review what you’re about to commit."
echo
while true; do
    read -p "Run: git diff : " cmd
    if [ "$cmd" = "git diff" ]; then
        eval "$cmd"
        success "You viewed the diff!"
        break
    else
        error "Please type: git diff"
        sleep 1
    fi
done
echo

# Lesson 2.7: git restore --staged
info "Lesson 2.7: Unstage a file"
echo "📖 Sometimes you add a file by mistake."
echo "Use 'git restore --staged <file>' to remove it from staging."
echo
while true; do
    read -p "Run: git restore --staged hello.txt : " cmd
    if [ "$cmd" = "git restore --staged hello.txt" ]; then
        eval "$cmd"
        success "File unstaged successfully!"
        break
    else
        error "Please type: git restore --staged hello.txt"
        sleep 1
    fi
done
echo
git add hello.txt   # Re-stage so commit can continue

# Lesson 3: git commit
info "Lesson 3: Make your first commit"
echo "📖 'git commit' permanently saves your staged changes."
echo "Each commit is like a snapshot with a message."
echo
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

# Lesson 3.5: git status (after commit)
info "Lesson 3.5: Check repo status (after commit)"
echo "📖 After committing, your working directory is clean."
echo
while true; do
    read -p "Run: git status : " cmd
    if [ "$cmd" = "git status" ]; then
        eval "$cmd"
        success "Working tree is clean now."
        break
    else
        error "Please type: git status"
        sleep 1
    fi
done
echo

# Lesson 4: git branch -M main
info "Lesson 4: Rename branch to main"
echo "📖 By default, Git creates 'master'. Modern convention is 'main'."
echo
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

# Lesson 5: git remote add origin (simulated)
info "Lesson 5: Add remote origin (simulated)"
echo "📖 A remote links your local repo to GitHub."
echo
while true; do
    read -p "Run: git remote add origin https://github.com/username/repo.git : " cmd
    if [[ "$cmd" =~ git\ remote\ add\ origin ]]; then
        success "✅ (Simulated) Remote 'origin' would be added."
        break
    else
        error "Please type: git remote add origin <URL>"
        sleep 1
    fi
done
echo

# Lesson 6: git push (simulated)
info "Lesson 6: Push to GitHub (simulated)"
echo "📖 'git push' uploads your commits to GitHub."
echo
while true; do
    read -p "Run: git push -u origin main : " cmd
    if [ "$cmd" = "git push -u origin main" ]; then
        success "✅ (Simulated) Code would be pushed to GitHub."
        break
    else
        error "Please type: git push -u origin main"
        sleep 1
    fi
done
echo

# Lesson 7: Merge feature branch
info "Lesson 7: Merge a feature branch into main"
echo "📖 Branches let you develop features separately, then merge them."
echo
git checkout -b feature >/dev/null 2>&1
echo "Feature file" > feature.txt
git add feature.txt
git commit -m "add feature file" >/dev/null 2>&1
git checkout main >/dev/null 2>&1
echo "✅ Feature branch created with a commit."
echo
while true; do
    read -p "Run: git merge feature : " merge_cmd
    if [ "$merge_cmd" = "git merge feature" ]; then
        eval "$merge_cmd"
    fi
    merged=$(git log --oneline | grep "add feature file" || true)
    if [ -n "$merged" ]; then
        success "Feature branch merged!"
        break
    else
        error "Not merged yet."
        sleep 2
    fi
done
echo

# Lesson 7.5: git log --graph
info "Lesson 7.5: Visualize history"
echo "📖 'git log --oneline --graph --all' shows commit history as a graph."
echo
while true; do
    read -p "Run: git log --oneline --graph --all : " cmd
    if [ "$cmd" = "git log --oneline --graph --all" ]; then
        eval "$cmd"
        success "You viewed commit history graph!"
        break
    else
        error "Please type: git log --oneline --graph --all"
        sleep 1
    fi
done
echo

# Lesson 8: git clone (simulated)
info "Lesson 8: Clone a repository (simulated)"
echo "📖 'git clone' copies a remote repo to your computer."
echo
while true; do
    read -p "Run: git clone https://github.com/username/repo.git : " cmd
    if [[ "$cmd" =~ git\ clone ]]; then
        success "✅ (Simulated) Repository would be cloned."
        echo "📂 Example cloned repo:"
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
echo "Now you know: init, status, add, diff, restore, commit, branch, remote, push, merge, log, and clone."
