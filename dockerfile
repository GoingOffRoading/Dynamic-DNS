FROM alpine:3.7
RUN apk update && apk add bind-tools && apk add curl
COPY /Dynamic-DNS.sh /
RUN chmod +x /Dynamic-DNS.sh
ENTRYPOINT [ "/bin/sh", "/Dynamic-DNS.sh" ]