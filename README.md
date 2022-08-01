# Utils

Small scripts that I personally find useful

## workon

A tool similar to direnv that adds the abiility to run arbitrary shell commands.
For example, ensuring that a particular postgres database is running

To install, copy the contents of `init.bash` into your zshrc file after the PATH being set.

## wo function
Small routine to add fuzzy finding to `workon`

In fish shell:
```fish
function wo
  workon (workon list | fzf -1 --query $argv[1])
end
```

In other shells:
```bash
function wo {
  workon $(workon list | fzf -1 --query "$1")
}
```

## Language Support

### Elixir

Provides a .iex.exs starter

## Useful Community Projects
https://github.com/unixorn/git-extra-commands
