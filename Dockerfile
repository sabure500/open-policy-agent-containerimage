FROM alpine:3.11

ENV OPEN_POLICY_AGENT 0.20.4

RUN apk --no-cache add curl

RUN curl -sL https://openpolicyagent.org/downloads/v${OPEN_POLICY_AGENT}/opa_linux_amd64 -o /usr/bin/opa \
    && chmod +x /usr/bin/opa \
    && ls -lha /usr/bin/opa \
    && /usr/bin/opa --help

RUN apk del --purge curl

CMD ["/usr/bin/opa"]