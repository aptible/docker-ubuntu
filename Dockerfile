ARG TAG
FROM --platform=linux/x86_64 ubuntu:${TAG}

ADD files/usr/bin/apt-install /usr/bin/apt-install

# Allow of well EOL versions to build.
ARG USE_EOL_REPOS
ENV USE_EOL_REPOS=${USE_EOL_REPOS}
RUN if [ "$USE_EOL_REPOS" = true ]; then sed -i.bak -r 's/(archive|security).ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list; fi

# Install latest security updates now, and on build
# During build, we use AllowRedirect to fix 4371-1.

RUN SECURITY_LIST=$(mktemp) \
 && grep security /etc/apt/sources.list > "$SECURITY_LIST" \
 && apt-get -o "Dir::Etc::SourceList=${SECURITY_LIST}" -o Acquire::http::AllowRedirect=false update \
 && apt-get -o "Dir::Etc::SourceList=${SECURITY_LIST}" -o Acquire::http::AllowRedirect=false upgrade -y \
 && rm -rf /var/lib/apt/lists/* \
 && rm "$SECURITY_LIST"

ONBUILD RUN SECURITY_LIST=$(mktemp) \
 && grep security /etc/apt/sources.list > "$SECURITY_LIST" \
 && apt-get -o "Dir::Etc::SourceList=${SECURITY_LIST}" update \
 && apt-get -o "Dir::Etc::SourceList=${SECURITY_LIST}" upgrade -y \
 && rm -rf /var/lib/apt/lists/* \
 && rm "$SECURITY_LIST"

# Install Git and tzdata. Those are usually needed in customer containers.
RUN DEBIAN_FRONTEND=noninteractive apt-install git tzdata

# Install Bats
RUN git clone https://github.com/sstephenson/bats.git /tmp/bats && \
    cd /tmp/bats && ./install.sh /usr/local

# Integration tests

# Setting tag for testing
ARG LIBC_MIN
ENV LIBC_MIN=${LIBC_MIN}
ARG LIBSSL_MIN
ENV LIBSSL_MIN=${LIBSSL_MIN}
ADD test /tmp/test
RUN bats /tmp/test
