FROM debian:stable

RUN \
    apt update && apt install -y \
    curl \
    fastfetch \
    git \
    kitty-terminfo \
    sudo \
    vim \
    default-mysql-client \
    zsh

RUN useradd -m tifrueh -s /usr/bin/zsh && \
    echo "tifrueh ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER tifrueh
WORKDIR /home/tifrueh
ENV HOME=/home/tifrueh

RUN git clone https://github.com/tifrueh/dotfiles /home/tifrueh/.dotfiles

RUN /home/tifrueh/.dotfiles/shell/install.zsh
RUN /home/tifrueh/.dotfiles/vim/install.zsh

VOLUME /home/tifrueh/.dotfiles

CMD ["/usr/bin/zsh"]
