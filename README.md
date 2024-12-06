# Mizvchi's shell scripts

These are the utility scripts I use to simplify some tasks.

## Scripts

| Script				| Usage					| Description																	|
|:---------------------:|:----------------------|:------------------------------------------------------------------------------|
| [__ftp__](bin/ftp)	| ftp \<directory\>		| Creates a directory, moves into it, copies libft template files, opens nvim.	|
| [__g__](bin/g)		| g						| Combines git commands for easier adds, commits, pushs.						|
| [__mcd__](bin/mcd)	| mcd \<directory\>		| Creates a directory and moves into it.										|

## How to use

Personally, I like making a `.scripts` directory inside my `$HOME` folder.
If you want to have the same file structure, you can use the following command :
```
git clone https://github.com/mizvchi/scripts.git ~/.scripts
```

Otherwise, clone the repository wherever you want.

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

Now you can run the scripts like regular commands from anywhere in your system.
