FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y \
    silversearcher-ag \
    gcc \
    make \
    binutils \
    xorriso \ 
    qemu-system-x86 \
    perl \
    python3 \
    locate \
    git \
    tig \
    bat \
    cscope \
    ctags \
    htop \
    neovim \
    xxd \
    emacs \
    grub2 \ 
    ncurses-dev \
    python3-pip \
    curl \
    thefuck \
    tmux \
    gdb \
    valgrind \
    ssh \
    netcat \
    fzf \
    julia

RUN pip3 install -U pandas numpy seaborn scipy matplotlib 

RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
RUN git clone https://github.com/khale/neovim-config && mkdir -p ~/.config/nvim && mv neovim-config/init.vim ~/.config/nvim/ && rm -rf neovim-config
