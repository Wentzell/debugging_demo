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
RUN sudo apt-get update && \
    DEBIAN_FRONTEND=noninteractive sudo apt-get install -y --no-install-recommends \
	nodejs \
	npm \
	g++-6 \
	g++-7 \
	g++-8 \
	g++-9 \
	clang-6.0 \
	clang-7 && \
    sudo apt-get autoremove --purge -y && \
    sudo apt-get autoclean -y && \
    sudo rm -rf /var/cache/apt/* /var/lib/apt/lists/*

RUN wget https://api.github.com/repos/mattgodbolt/compiler-explorer/tarball/master -O /tmp/compiler-explorer.tar.gz
RUN tar xzf /tmp/compiler-explorer.tar.gz --one-top-level --strip-components=1 && rm /tmp/compiler-explorer.tar.gz
RUN (cd compiler-explorer; make dist)
COPY c++.local.properties compiler-explorer/etc/config
RUN sudo chown docker compiler-explorer/etc/config/c++.local.properties

EXPOSE 5000 10240
CMD ["/usr/bin/zsh"]
#CMD ["cd compiler_explorer; make EXTRA_ARGS='--language c++'"]
