# Google-Domains-Dynamic-DNS

This container image updates a Dybamic DNS record with Google Domains to the current IP address of the host.

Relevant Documentation:

### Google Dynamic DNS: https://support.google.com/domains/answer/6147083
### Synthetic Records: https://support.google.com/domains/answer/6069273


Example applitcation with Kubernetes:



    ---
    apiVersion: batch/v1beta1
    kind: CronJob
    metadata:
    name: MYDOMAIN
    spec:
    schedule: "*/15 * * * *"
    jobTemplate:
        spec:
        template:
            spec:
            containers:
            - name: MYDOMAIN
                image: THIS-CONTAINER
            restartPolicy: Never
            env:
                - name: username
                value: "YOUR_USERNAME_HERE"
                - name: password
                value: "YOUR_PASSWORD_HERE"
                - name: domain
                value: "YOUR_DOMAIN_HERE"
