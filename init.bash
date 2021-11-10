# These should be added to your bashrc or zshrc

source <(workon init)

wo () {
	workon $(workon list | fzf -1 --query "$1")
}
