# These should be added to your bashrc or zshrc

bass 'source <(./workon init)'

function wo {
	workon (workon list | fzf -1 --query "$1")
}
