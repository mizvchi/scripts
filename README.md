# Mizvchi's shell scripts

These are the utility scripts I use to simplify some tasks.

## How to use

Personally, I like making a `.scripts` directory in $HOME.
If you want the same file structure, you can use the following commands :
```
git clone https://github.com/mizvchi/scripts.git ~/.scripts
```

You will then have to source the folder in your shell configuration.
Edit your `~/.bashrc` / `~/.zshrc` file, and add the following code :
```
# Source all scripts in ~/.scripts/bin
for script in $HOME/.scripts/bin/*; do
    [ -f "$script" ] && source "$script"
done
```

Then reload your configuration file :

zsh
```
source $HOME/.zshrc
```

bash
```
source $HOME/.bashrc
```

