FROM ubuntu:26.04 AS source

ADD --checksum=sha256:c7e5452f8cf2609dffbdeda63ca3be7ee45f91505dc496844d65924817cb2517 https://github.com/LizardByte/Sunshine/releases/download/v2026.516.143833/sunshine-ubuntu-26.04-amd64.deb /tmp/source

FROM ghcr.io/containerpak/gtk3:main

COPY icon.png /usr/share/icons/hicolor/128x128/apps/sunshine.png

RUN --mount=type=bind,from=source,source=/tmp/source,target=/run/sunshine.deb \
    apt-get update && \
    apt-get install -y --no-install-recommends /run/sunshine.deb && \
    cpak-clean-junk
