# Google-Domains-Dynamic-DNS

[Google Domains](https://domains.google/) offers a reasonably cheap/flexible DynamicDNS solution for registering domains and subdomains for your projects.  The only catch is that there are no automated solutions to update your dyanmic IP address when your IP changes back to your Google Domains DNS record.  Enter **Google-Domains-Dynamic-DNS**: a terrible name but a convienient way to update your DynamicDNS Google record.

To use this image, you will need the following from your Dynamic DNS record:

* Username
* Password
* Hostname

# Docker Use

Run the following to execute the container as a one time use.  

    docker run -d -e USERNAME=**$Username$** -e PASSWORD=**$Password$** -e HOSTNAME=**$Hostname$** --name googledns goingoffroading/google_domains_dynamic_dns_updater

# Docker-Compose

Working example: [Docker-Compose](https://github.com/GoingOffRoading/Google-Domains-Dynamic-DNS/blob/main/docker-compose.yml)

    ---
    version: '3'
    services:
    torrent:
    container_name: googledns
    image: goingoffroading/google_domains_dynamic_dns_updater
    environment:
    - USERNAME=**$Username$**
    - PASSWORD=**$Password$**
    - HOSTNAME=**$Hostname$**

# Kubernetes Cronjob

Working example: [kubernetes-cronjob.yml](https://github.com/GoingOffRoading/Google-Domains-Dynamic-DNS/blob/main/kubernetes-cronjob.yml)

---
    apiVersion: batch/v1beta1
    kind: CronJob
    metadata:
    name: googledns
    nameSpace: default
    spec:
    schedule: "*/15 * * * *"
    jobTemplate:
        spec:
        template:
            spec:
            containers:
            - name: googledns
                image: goingoffroading/google_domains_dynamic_dns_updater
            restartPolicy: Never
            env:
                - name: USERNAME
                value: "**$Username$**"
                - name: PASSWORD
                value: "**$Password$**"
                - name: HOSTNAME
                value: "**$Hostname$**"

# Kubernetes Cronjob

Supporting Google Documentation:

* Google Dynamic DNS: https://support.google.com/domains/answer/6147083
* Synthetic Records: https://support.google.com/domains/answer/6069273

# To-Do List

- [ ] Add unit tests
