FROM alpine:3.7
RUN apk add curl dig
COPY /Google-Domains-Dynamic-DNS.sh
RUN chmod +x /sayhello.sh
ENTRYPOINT [ "" ]