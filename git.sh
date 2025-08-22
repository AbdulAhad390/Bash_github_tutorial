# Lesson 7.5: git log --oneline --graph --all
info "Lesson 7.5: Visualize history"
echo "📖 Description: 'git log --oneline --graph --all' shows a visual history."
echo "It displays commits from all branches in a compact graph format."
echo
while true; do
    read -p "Run: git log --oneline --graph --all : " cmd
    if [ "$cmd" = "git log --oneline --graph --all" ]; then
        eval "$cmd"
        success "You viewed the commit history with a graph!"
        break
    else
        error "Please type: git log --oneline --graph --all"
        sleep 1
    fi
done
echo