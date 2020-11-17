FROM alpine:3.7
RUN apk update && apk add bind-tools && apk add curl
COPY /Google-Domains-Dynamic-DNS.sh
RUN chmod +x /Google-Domains-Dynamic-DNS.sh
ENTRYPOINT [ "/bin/sh", "/Google-Domains-Dynamic-DNS.sh" ]