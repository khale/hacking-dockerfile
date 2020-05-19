FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y \
    bat \
    binutils \
    cscope \
    ctags \
    curl \
    emacs \
    fd-find \
    fish \
    fzf \
    gcc \
    gdb \
    git \
    grub2 \ 
    htop \
    julia \
    language-pack-en \
    locate \
    make \
    ncurses-dev \
    neovim \
    netcat \
    perl \
    python3 \
    python3-pip \
    qemu-system-x86 \
    silversearcher-ag \
    ssh \
    thefuck \
    tig \
    tmux \
    valgrind \
    xorriso \ 
    xxd 

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
