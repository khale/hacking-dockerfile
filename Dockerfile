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
    fish \
    fzf \
    language-pack-en \
    julia

# for powerline
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get install -y fonts-powerline

RUN pip3 install -U pandas numpy seaborn scipy matplotlib 
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
RUN git clone https://github.com/khale/neovim-config && mkdir -p ~/.config/nvim && mv neovim-config/init.vim ~/.config/nvim/ && rm -rf neovim-config
RUN git clone https://github.com/khale/fish-config && mkdir -p ~/.config/fish && mv fish-config/config.fish ~/.config/fish/ && rm -rf fish-config
RUN git clone https://github.com/khale/fisher-config && mv fisher-config/fishfile ~/.config/fish/ && rm -rf fisher-config
RUN git clone https://github.com/khale/.tmux && mv .tmux/.tmux.conf ~/.tmux.conf && rm -rf .tmux
