# TV Dot Files

[Source: The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles)
[Source: A simpler way to manage your dotfiles](https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html)

## Setup new machine

Before installation:

``` bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.tvdotfiles --work-tree=$HOME'
```

Clone dotfiles into a bare repo in a dot folder in `$HOME`:

``` bash
git clone --bare https://github.com/taivu/tvdotfiles.git $HOME/.tvdotfiles
```

Define the alias in the current shell scope:

``` bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.tvdotfiles --work-tree=$HOME'
```

Checkout actual content from bare repo to `$HOME`:

``` bash
dotfiles checkout
```

The Step above might fail with a message like:

``` bash
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

This is because your `$HOME` folder might already have some stock configuration files which would be overwritten by Git. The solution is simple: back up the files if you care about them, remove them if you don't care. I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:

``` bash
mkdir -p .config-backup && \
dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

Re-run the checkout if you had problems:

``` bash
dotfiles checkout
```

Set the flat `showUntrackedFiles` to `no` on this specific (local) repo:

``` bash
dotfiles config --local status.showUntrackedFiles no
```

You're done, from now on you can type `dotfiles` commands to add and update your dotfiles:

``` bash
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles add .bashrc
dotfiles commit -m "Add bashrc"
dotfiles push
```

Branch | Description | Notes
-------|-------------|------
machines/osx | mac | osx 10.14.4

