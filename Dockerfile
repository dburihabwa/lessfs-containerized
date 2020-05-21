FROM ubuntu:14.04
RUN apt-get update && apt-get install --yes --force-yes autoconf automake build-essential byacc encfs expect flex gcc libfuse-dev libmhash-dev libmhash2 libssl-dev libtool libtokyocabinet-dev make pkg-config wget
RUN wget http://download.oracle.com/berkeley-db/db-4.8.30.tar.gz && tar xzvf db-4.8.30.tar.gz && cd db-4.8.30/build_unix/ && ../dist/configure && make && make install
RUN echo "/usr/local/BerkeleyDB.4.8/lib" >> /etc/ld.so.conf
RUN wget http://downloads.sourceforge.net/project/lessfs/lessfs/lessfs-1.7.0/lessfs-1.7.0.tar.gz && tar xzvf lessfs-1.7.0.tar.gz
WORKDIR lessfs-1.7.0
RUN export CFLAGS="-I /usr/local/BerkeleyDB.4.8/include/ -L /usr/local/BerkeleyDB.4.8/lib" && ./configure --with-berkeleydb && make && make install && cp etc/lessfs.cfg-bdb /etc/lessfs.cfg && ldconfig
RUN mkdir -p /data/mta && mkdir -p /data/dta/ && mkdir -p /mnt/fuse/
WORKDIR /
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
