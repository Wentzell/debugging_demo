FROM wentzell/docker_base:latest

# Install relevant additional packages
RUN sudo pip3 install gdbgui
RUN sudo apt-get update && \
    DEBIAN_FRONTEND=noninteractive sudo apt-get install -y --no-install-recommends \
	subversion \
	curl \
	netbase \
	g++-7 \
	g++-8 \
	g++-9 \
	g++-10 \
	clang-6.0 \
	clang-7 \
	clang-8 \
	clang-9 \
	clang-10 \
	clang-11 && \
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - && \
    sudo apt-get install -y --no-install-recommends nodejs && \
    sudo apt-get autoremove --purge -y && \
    sudo apt-get autoclean -y && \
    sudo rm -rf /var/cache/apt/* /var/lib/apt/lists/*

# Build llvm 12.0 including TSAN openmp support
ENV CC clang
ENV CXX clang++
RUN mkdir /home/docker/opt
RUN sed -i 's/11\.0\.0/12.0.0-rc2/' /home/docker/bin/build_llvm.sh
RUN /home/docker/bin/build_llvm.sh && rm -r llvm*

# Build and install llvm-mi
RUN git clone https://github.com/lldb-tools/lldb-mi && cd lldb-mi && \
    cmake -GNinja -DCMAKE_PREFIX_PATH=/home/docker/opt/llvm_12.0.0-rc2 -DCMAKE_INSTALL_PREFIX=/home/docker/opt/llvm_12.0.0-rc2 && \
    ninja && ninja install && \
    cd ../ && rm -r lldb-mi

# Setup Compiler Explorer with various gcc and clang versions
RUN wget https://api.github.com/repos/mattgodbolt/compiler-explorer/tarball/master -O /tmp/compiler-explorer.tar.gz
RUN tar xzf /tmp/compiler-explorer.tar.gz --one-top-level --strip-components=1 && rm /tmp/compiler-explorer.tar.gz
RUN (cd compiler-explorer; make dist)
COPY c++.local.properties compiler-explorer/etc/config
RUN sudo chown docker compiler-explorer/etc/config/c++.local.properties

# Copy the Debugging Samples
ADD samples /home/docker/samples
RUN sudo chown -R docker /home/docker/samples

# Remove solarized colorscheme
RUN echo "set background=light\ncolorscheme default" >> ~/.vimrc && rm ~/.dircolors

# Enable leak detection for ASAN
RUN echo "export ASAN_OPTIONS=symbolize=1:detect_leaks=1" >> ~/.zprofile

EXPOSE 5000 10240
CMD ["/usr/bin/zsh", "-l"]
#CMD ["cd compiler_explorer; make EXTRA_ARGS='--language c++'"]
#CMD ["gdbgui -r -g /home/docker/opt/llvm_12.0.0-rc2/bin/lldb-mi"]
