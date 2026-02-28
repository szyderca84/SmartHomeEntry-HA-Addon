ARG BUILD_FROM

# --- Build agent from source ---
FROM golang:1.22-alpine AS builder
WORKDIR /src
COPY ../go.mod ../go.sum ./
RUN go mod download
COPY ../ .
ARG TARGETARCH
RUN CGO_ENABLED=0 GOARCH=${TARGETARCH} go build -ldflags="-s -w" \
    -o /smarthomeentry-agent ./cmd/agent

# --- Final image ---
FROM ${BUILD_FROM}
RUN apk add --no-cache ca-certificates

COPY --from=builder /smarthomeentry-agent /usr/local/bin/smarthomeentry-agent
RUN chmod +x /usr/local/bin/smarthomeentry-agent

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
