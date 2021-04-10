FROM alpine:3
LABEL maintainer="Alexander v. Buchholtz (https://github.com/albuch)"

RUN apk add --update --no-cache jq

COPY entrypoint.sh /entrypoint.sh
CMD chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]