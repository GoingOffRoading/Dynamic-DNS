# Google-Domains-Dynamic-DNS

This container image updates a Dybamic DNS record with Google Domains to the current IP address of the host.

Relevant Documentation:

### Google Dynamic DNS: https://support.google.com/domains/answer/6147083
### Synthetic Records: https://support.google.com/domains/answer/6069273




    docker run -d -e USERNAME=$username$ PASSWORD=$password$ HOSTNAME=$hostname$ --name DNS DNS:1.0