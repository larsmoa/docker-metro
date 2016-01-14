FROM ubuntu:14.04

# We need svn, qmake and make
RUN apt-get update 
RUN apt-get install -y --no-install-recommends subversion
RUN apt-get install -y --no-install-recommends build-essential
RUN apt-get install -y --no-install-recommends qt5-default 

# Checkout and compile
RUN cd / && svn checkout svn://svn.code.sf.net/p/vcg/code/trunk vcg-code
RUN sed -i "s/\"__DATE__\"/\" __DATE__ \"/" /vcg-code/vcglib/apps/metro/metro.cpp
RUN cd /vcg-code/vcglib/apps/metro && \
	qmake "QMAKE_CXXFLAGS += -std=c++11" && \
	make -j4 && make install
RUN cp /vcg-code/vcglib/apps/metro/metro /usr/bin/

ENTRYPOINT "/usr/bin/metro"
