FROM alpine

RUN apk add --no-cache --virtual=build-dependencies python3 git make bash && /usr/bin/python3 -m pip install virtualenv && \
    mkdir /app && adduser -h /app -u 910 -D screeps && chown 910:910 /app

USER 910:910
WORKDIR /app
ADD config.yaml /app/.screepsconsole.yaml
ADD init.sh /app/
RUN git clone https://github.com/screepers/screeps_console && \
    cd screeps_console && \
    virtualenv -p /usr/bin/python3 env && \
    make

ENTRYPOINT ["/app/init.sh"]
