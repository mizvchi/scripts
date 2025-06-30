# Mizvchi's shell scripts

These are the utility scripts I use to simplify redundant tasks.

_(Truth being that I'm just lazy)_

## Scripts

| Script				| Usage					| Description																	|
|:---------------------:|:----------------------|:------------------------------------------------------------------------------|
| [__g__](bin/g)		| g						| Combines git commands for easier adds, commits, pushs.						|
| [__mcd__](bin/mcd)	| mcd \<directory\>		| Creates a directory and moves into it.										|
| [__ud__](bin/ud)		| ud					| (Arch Only) Checks if the `/boot` partition is mounted and updates the system	|

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

* _zsh_
```
source ~/.zshrc
```

* _bash_
```
source ~/.bashrc
```

Now you can run the scripts like regular commands from anywhere in your system.
