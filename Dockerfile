FROM openmicroscopy/bioformats:east

COPY convert.sh /tmp/convert.sh
RUN chmod +x /tmp/convert.sh
WORKDIR /bio-formats-build/bioformats/
ENTRYPOINT ["bash", "-c", "/tmp/convert.sh"]