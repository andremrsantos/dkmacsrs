# DKmacsGO - Emacs with Rust

This container provides the popular **emacs** editor running on an
interactive and isolated container with full **rust** developing
environment. It makes easy to setup and develop your **rust**
project.

    ## Basic run example
    docker run -it -v ${PWD}:/workspace andremrsantos/dkmacsrs


## Short lived container

Since I rather use my docker on a short lived container, I mapped
the internal **CARGO** (´/root/.cargo´) to a local volume
´/home/user/.cargo´. Some cargos are required to enjoy all emacs
benefits and I recommend to install it before running. See the
code example bellow:

    ## Install required packages
    ## rustfmt
    docker run --rm -v ${HOME}/.cargo:/root/.cargo dkmacsrs \
        cargo install rustfmt
    ## racer
    docker run --rm -v ${HOME}/.cargo:/root/.cargo dkmacsrs \
        cargo install racer

    ## Running
    docker run --rm -it \
        -v ${HOME}/.gitconfig:/root/.gitconfig \
        -v ${HOME}/.cargo:/root/.cargo \
        -v ${PWD}:/workspace \
        dkmacsrs

I've also mapped **.gitconfig** to the user folder to make easy
to use the internal **git**.

## Long lived container

Alternatively you can use a long-lived container, see code bellow:

    ## init the container
    docker run -it \
        -name dkmacs \
        -v ${HOME}/.gitconfig:/root/.gitconfig \
        -v ${PWD}:/workspace \
        dkmacsrs

    ## on other windon install required packages
    docker exec dkmacs cargo install rustfmt
    docker exec dkmacs cargo install racer

## Credits

The emacs configurations were addapted from [rakanalh/emacs-bootstra](https://github.com/rakanalh/emacs-bootstrap).
