#!/bin/bash

# GitHub Workflow Tutorial Generator 

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

continue_or_exit() {
    while true; do
        read -p "👉 Do you want to continue to the next lesson? (y/n): " choice
        case "$choice" in
            y|Y ) echo; break ;;
            n|N ) echo "👋 Exiting tutorial. See you next time!"; exit 0 ;;
            * ) echo "Please type y or n." ;;
        esac
    done
}

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
echo " 'git init' creates a new Git repository in the current folder."
echo "It sets up a hidden '.git' directory where Git stores all version history."
echo
while true; do
    read -p "Run: git init : " cmd
    if [ "$cmd" = "git init" ]; then
        eval "$cmd"
        if [ -d ".git" ]; then
            success "Repository initialized!"
            continue_or_exit
            break
        fi
    fi
    error "Please type exactly: git init"
done
echo

# Lesson 1.5: git status (before staging)
info "Check repo status (before staging)"
echo " 'git status' shows the state of your working directory."
echo "Right after 'git init', files appear as 'untracked'."
echo
while true; do
    read -p "Run: git status : " cmd
    if [ "$cmd" = "git status" ]; then
        eval "$cmd"
        success "You saw the status! Files are untracked at this stage."
        continue_or_exit
        break
    else
        error "Please type: git status"
    fi
done
echo

# Lesson 2: git add .
info "Lesson 2: Stage your files"
echo " 'git add .' stages all changes in your project."
echo
while true; do
    read -p "Run: git add . : " cmd
    if [ "$cmd" = "git add ." ]; then
        eval "$cmd"
    else
        error "Please type exactly: git add ."
        continue
    fi
    staged=$(git diff --cached --name-only)
    if [ -n "$staged" ]; then
        success "Files staged successfully!"
        continue_or_exit
        break
    else
        error "No files staged yet."
    fi
done
echo

# Lesson 2.5: git status (after staging)
info "Check repo status (after staging)"
echo "After 'git add .', files are staged for commit."
echo
while true; do
    read -p "Run: git status : " cmd
    if [ "$cmd" = "git status" ]; then
        eval "$cmd"
        success "You saw the status! Files are staged."
        continue_or_exit
        break
    else
        error "Please type: git status"
    fi
done
echo

# Lesson 3: git commit
info "Lesson 3: Make your first commit"
echo " 'git commit' permanently saves your staged changes."
echo
while true; do
    read -p "Run: git commit -m \"first commit\"  " cmd
    if [ "$cmd" = "git commit -m \"first commit\"" ]; then
        eval "$cmd"
    else
        error "Please type exactly: git commit -m \"first commit\""
        continue
    fi
    commits=$(git rev-list --count HEAD 2>/dev/null || echo 0)
    if [ "$commits" -ge 1 ]; then
        success "First commit created!"
        continue_or_exit
        break
    else
        error "No commit detected yet."
    fi
done
echo

# Lesson 3.5: git status (after commit)
info "Check repo status (after commit)"
echo "After committing, your working directory is clean."
echo
while true; do
    read -p "Run: git status : " cmd
    if [ "$cmd" = "git status" ]; then
        eval "$cmd"
        success "Working tree is clean now."
        continue_or_exit
        break
    else
        error "Please type: git status"
    fi
done
echo

# Lesson 4: git rm
info "Lesson 4: Remove a tracked file"
echo "'git rm <file>' removes a file and stages its deletion."
echo
echo "Creating a dummy file 'deleteme.txt'..."
echo "Delete me" > deleteme.txt
git add deleteme.txt && git commit -m "add deleteme file" >/dev/null 2>&1
while true; do
    read -p "Run: git rm deleteme.txt : " cmd
    if [ "$cmd" = "git rm deleteme.txt" ]; then
        eval "$cmd"
        success "File removed and staged for commit!"
        git commit -m "remove deleteme.txt" >/dev/null 2>&1
        continue_or_exit
        break
    else
        error "Please type: git rm deleteme.txt"
    fi
done
echo

# Lesson 5: git branch -M main
info "Lesson 5: Rename branch to main"
echo
while true; do
    read -p "Run: git branch -M main : " cmd
    if [ "$cmd" = "git branch -M main" ]; then
        eval "$cmd"
    else
        error "Please type: git branch -M main"
        continue
    fi
    branch=$(git branch --show-current)
    if [ "$branch" = "main" ]; then
        success "Branch renamed to main!"
        continue_or_exit
        break
    fi
done
echo

# Lesson 6: git remote add origin
info "Lesson 6: Add remote origin"
echo
while true; do
    read -p "Run: git remote add origin https://github.com/username/repo.git : " cmd
    if [ "$cmd" = "git remote add origin https://github.com/username/repo.git" ]; then
        success "✅ Remote 'origin' would be added."
        continue_or_exit
        break
    else
        error "Please type: git remote add origin https://github.com/username/repo.git"
    fi
done
echo

# Lesson 7: git fetch
info "Lesson 7: Fetch updates from remote"
echo
while true; do
    read -p "Run: git fetch origin : " cmd
    if [ "$cmd" = "git fetch origin" ]; then
        success "✅ Changes would be fetched."
        continue_or_exit
        break
    else
        error "Please type: git fetch origin"
    fi
done
echo

# Lesson 8: git pull
info "Lesson 8: Pull updates from remote"
echo
while true; do
    read -p "Run: git pull origin main : " cmd
    if [ "$cmd" = "git pull origin main" ]; then
        success "✅ Code would be pulled."
        continue_or_exit
        break
    else
        error "Please type: git pull origin main"
    fi
done
echo

# Lesson 9: git push
info "Lesson 9: Push to GitHub"
echo
while true; do
    read -p "Run: git push -u origin main : " cmd
    if [ "$cmd" = "git push -u origin main" ]; then
        success "✅ Code would be pushed."
        continue_or_exit
        break
    else
        error "Please type: git push -u origin main"
    fi
done
echo

# Lesson 10: git clone
info "Lesson 10: Clone a repository"
echo
while true; do
    read -p "Run: git clone https://github.com/username/repo.git : " cmd
    if [ "$cmd" = "git clone https://github.com/username/repo.git" ]; then
        success "✅ Repo would be cloned."
        echo "📂 Example structure:"
        echo "   cloned_repo/"
        echo "     ├── README.md"
        echo "     └── main.py"
        continue_or_exit
        break
    else
        error "Please type: git clone https://github.com/username/repo.git"
    fi
done
echo

# Lesson 11: git log --graph
info "Lesson 11: Visualize history"
echo
while true; do
    read -p "Run: git log --oneline --graph --all : " cmd
    if [ "$cmd" = "git log --oneline --graph --all" ]; then
        eval "$cmd"
        success "Viewed commit history!"
        continue_or_exit
        break
    else
        error "Please type: git log --oneline --graph --all"
    fi
done
echo

echo
echo "${GREEN}🎉 Congratulations! You completed the full GitHub workflow tutorial!${RESET}"
echo "Now you know: init, add, commit, rm, branch, remote, fetch, pull, push, clone, log."
