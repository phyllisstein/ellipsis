# `ellipsis`: Dotfiles
![Bernadette Peters as Dot, Stephen Sondheim's _Sunday in the Park with George_ (1984)](mascot.png)

## Getting Started
1. Install [GNU Stow](https://www.gnu.org/software/stow/).

    ```shell
    brew install stow
    ```

2. Clone this repo into your home directory.

    ```shell
    git clone https://github.com/phyllisstein/ellipsis $HOME/.ellipsis
    ```

3. From `~/.ellipsis`, add dotfile symlinks with Stow.

    ```shell
    cd ~/.ellipsis
    stow --no-folding public
    ```

    The `--no-folding` flag ensures Stow doesn't clobber important directories like `.local`.

## Unlocking Secrets
Use the key stored in 1Password.

```shell
git-crypt unlock $KEY_PATH
```
