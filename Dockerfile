FROM debian:bullseye
SHELL ["/bin/bash", "-c"]
WORKDIR /root
ENV HOME=/root
RUN apt update
RUN apt install -y git cmake bison wget zlib1g-dev libbz2-dev libncurses5-dev \
	libffi-dev libreadline6-dev libssl-dev flex gcc-9 curl pkg-config \
	g++-9 tcl-dev vim iverilog

# Install pyenv
RUN git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

# Install Correct Python Version
RUN pyenv install 3.8.2
RUN pyenv global 3.8.2

# Install PRGA
RUN git clone https://github.com/PrincetonUniversity/prga.git prga
WORKDIR $HOME/prga

# Link the correct version of GCC
RUN ln -sf /usr/bin/gcc-9 /usr/bin/gcc
RUN ln -sf /usr/bin/g++-9 /usr/bin/c++

RUN ./envscr/install
RUN source ./envscr/activate
WORKDIR $HOME
