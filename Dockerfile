FROM circleci/postgres:11

RUN apt-get update
RUN apt-get install -y git make perl
RUN rm -rf /var/lib/apt/lists/*

ENV PGTAP_VERSION v1.1.0
RUN git clone git://github.com/theory/pgtap.git && \
    cd pgtap && \
    git checkout tags/$PGTAP_VERSION && \
    make && \
    make install

EXPOSE 5432
