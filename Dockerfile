FROM gliderlabs/alpine:latest
ADD https://storage.googleapis.com/kubernetes-release/release/v1.8.4/bin/linux/amd64/kubectl /usr/local/bin/kubectl
ADD https://s3cr3t.net/etcdctl /usr/local/bin/etcdctl
RUN apk-install tshark bash tmux screen iputils bind-tools curl ca-certificates
ENV HOME=/config
ENV ETCDCTL_API=3
RUN set -x && \
    chmod +x /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/etcdctl && \
    \
    # Create non-root user (with a randomly chosen UID/GUI).
    adduser kubectl -Du 2342 -h /config && \
    \
    # Basic check it works.
    kubectl version --client
CMD ["sleep", "86500"]
