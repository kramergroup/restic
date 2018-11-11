FROM restic/restic

# Install Let's Encrypt Root Certificate 
RUN apk update && apk add ca-certificates curl bash && rm -rf /var/cache/apk/*
RUN curl https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem.txt > /usr/local/share/ca-certificates/lets-encrypt-x3-cross-signed.crt && \
    update-ca-certificates

COPY entrypoint.sh /entrypoint.sh

VOLUME [ "/source-data" ]

WORKDIR /source-data

ENTRYPOINT ["/entrypoint.sh"]

