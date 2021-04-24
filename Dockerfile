FROM alpine:3
LABEL maintainer="Alexander v. Buchholtz (https://github.com/albuch)"

RUN apk add --update --no-cache bash jq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]