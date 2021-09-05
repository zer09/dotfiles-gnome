# My personal dotfiles

### Steps to clone
- Manually update the kernel if available through *Manjaro Settings Manager*
- Change the default shell to bash ```chsh -s /bin/bash```
- Initialize git

```shell
pamac install seahorse x11-ssh-askpass xclip 

ssh-keygen -t ed25519 -C "gilbertconsellado@gmail.com"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519

# copy the pub key and register add it to github
xclip -sel clip < ~/.ssh/id_ed25519.pub
```


- Bare clone this repo

    `git clone --bare git@github.com:zer09/dotfiles-gnome.git $HOME/.dotfiles`

- Load aliased git command

    `alias dit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`

- Dont show untracked files

    `dit config --local status.showUntrackedFiles no`

- Checkout the files

    `dit checkout -f`

- Update submodules

    `dit submodule update --remote`

### Steps to install
- Full update the system by executing and reboot after.

    `pamac install base base-devel`

- Install the needed apps then reboot.

    `./.dotfiles-setup/install-app.sh`

- Then lastly execute the post install.

    `./.dotfiles-setup/post-install.sh`
