FROM alpine:edge
MAINTAINER André M. Ribeiro dos Santos "andremrsantos@gmail.com"

RUN apk update && apk add --no-cache \
    ca-certificates \
    git \
    rust \
    cargo \
    emacs
RUN mkdir -p /usr/local/src/ && \
    cd /usr/local/src/ && \
    git clone --depth=1 https://github.com/rust-lang/rust.git && \
    rm -rf rust/.git

COPY emacs.d /root/.emacs.d
RUN mkdir -p $HOME/.emacs.d/private/cache && \
    emacs --batch --load $HOME/.emacs.d/init.el

ENV TERM xterm-256color
ENV PATH /root/.cargo/bin:$PATH
ENV RUST_SRC_PATH /usr/local/src/rust/src

WORKDIR /workspace

CMD ["emacs", "./"]
