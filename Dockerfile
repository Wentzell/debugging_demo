FROM wentzell/docker_base:latest

RUN sudo pip install gdbgui
EXPOSE 5000

ADD samples /home/docker/samples
RUN sudo chown -R docker /home/docker/samples

RUN echo "export ASAN_SYMBOLIZER_PATH=\$(which llvm-symbolizer)" >> ~/.zprofile
RUN echo "export ASAN_OPTIONS=symbolize=1 # :detect_leaks=0" >> ~/.zprofile

RUN echo "export UBSAN_SYMBOLIZER_PATH=\$(which llvm-symbolizer)" >> ~/.zprofile
RUN echo "export UBSAN_OPTIONS=symbolize=1:print_stacktrace=1:halt_on_error=1" >> ~/.zprofile

RUN echo "export MSAN_SYMBOLIZER_PATH=\$(which llvm-symbolizer)" >> ~/.zprofile
RUN echo "export MSAN_OPTIONS=symbolize=1:halt_on_error=1" >> ~/.zprofile

CMD ["/usr/bin/zsh"]
