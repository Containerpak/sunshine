FROM ghcr.io/containerpak/gtk:main

ADD --checksum=sha256:c7e5452f8cf2609dffbdeda63ca3be7ee45f91505dc496844d65924817cb2517 https://github.com/LizardByte/Sunshine/releases/download/v2026.516.143833/sunshine-ubuntu-26.04-amd64.deb /tmp/source
COPY icon.png /usr/share/icons/hicolor/128x128/apps/sunshine.png

RUN apt-get update && \
    apt-get install -y --no-install-recommends libayatana-appindicator3-1 libcap2 libdrm2 libminiupnpc19 libopus0 libpulse0 && \
    dpkg-deb -x /tmp/source / && \
    cpak-clean-junk
