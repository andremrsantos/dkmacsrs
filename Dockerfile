FROM alpine:edge
MAINTAINER André M. Ribeiro dos Santos "andremrsantos@gmail.com"

RUN apk update && apk add --no-cache \
    ca-certificates \
    openssl \
    rust \
    cargo \
    emacs
RUN mkdir -p /usr/local/src/ && \
    cd /usr/local/src/ && \
    wget -O - https://github.com/rust-lang/rust/archive/1.17.0.tar.gz | \
    tar -xzf -

COPY emacs.d /root/.emacs.d
RUN mkdir -p $HOME/.emacs.d/private/cache && \
    emacs --batch --load $HOME/.emacs.d/init.el

ENV TERM xterm-256color
ENV PATH /root/.cargo/bin:$PATH
ENV RUST_SRC_PATH /usr/local/src/rust-1.17.0/src

WORKDIR /workspace

CMD ["emacs", "./"]
