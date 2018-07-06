FROM wentzell/docker_base:latest

RUN sudo pip install gdbgui

# Debugging Samples
ADD samples /home/docker/samples
RUN sudo chown -R docker /home/docker/samples

# Sanitizer Config
RUN echo "export ASAN_SYMBOLIZER_PATH=\$(which llvm-symbolizer)" >> ~/.zprofile
RUN echo "export ASAN_OPTIONS=symbolize=1 # :detect_leaks=0" >> ~/.zprofile

RUN echo "export UBSAN_SYMBOLIZER_PATH=\$(which llvm-symbolizer)" >> ~/.zprofile
RUN echo "export UBSAN_OPTIONS=symbolize=1:print_stacktrace=1:halt_on_error=1" >> ~/.zprofile

RUN echo "export MSAN_SYMBOLIZER_PATH=\$(which llvm-symbolizer)" >> ~/.zprofile
RUN echo "export MSAN_OPTIONS=symbolize=1:halt_on_error=1" >> ~/.zprofile

# Setup Compiler Explorer
RUN wget https://deb.nodesource.com/setup_8.x -O nodesetup.sh && \
    sudo bash nodesetup.sh && rm nodesetup.sh
RUN sudo apt-get update && \
    DEBIAN_FRONTEND=noninteractive sudo apt-get install -y --no-install-recommends nodejs && \
    sudo apt-get autoremove --purge -y && \
    sudo apt-get autoclean -y && \
    sudo rm -rf /var/cache/apt/* /var/lib/apt/lists/*

RUN wget https://api.github.com/repos/mattgodbolt/compiler-explorer/tarball/master -O /tmp/compiler-explorer.tar.gz
RUN tar xzf /tmp/compiler-explorer.tar.gz --one-top-level --strip-components=1 && rm /tmp/compiler-explorer.tar.gz
COPY c++.local.properties compiler-explorer/etc/config
RUN (cd compiler-explorer; make dist)

EXPOSE 5000 10240
CMD ["/usr/bin/zsh"]
