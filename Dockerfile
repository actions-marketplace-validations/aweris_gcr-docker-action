FROM docker/github-actions:v1

# Install dependencies
RUN apk add --no-cache python                     \
                       curl                       \
                       bash                       \
                       which                      \
 && curl -sSL https://sdk.cloud.google.com | bash \
 && rm -rf /var/cache/apk/*

# Add cloud sdk to PATH
ENV PATH $PATH:/root/google-cloud-sdk/bin

COPY entrypoint.sh /github-actions-entrypoint.sh

ENTRYPOINT ["/github-actions-entrypoint.sh"]