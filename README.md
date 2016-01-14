Builds a docker image for Metro.

Metro is a command line tool for measuring error on simplified surfaces. 

Building
===============
docker build -t metro .

Running
===============
docker run --rm -v /some/path:/mnt metro /mnt/original.obj /mnt/simplified.obj

The original source code for Metro is available from http://sourceforge.net/p/vcg/code/HEAD/tree/trunk/
