FROM openmicroscopy/omero-server:5.6
USER root
RUN /opt/omero/server/venv3/bin/pip install -U scikit-image ome-zarr omero-cli-zarr # Dependencies
COPY src /src
RUN /opt/omero/server/venv3/bin/pip install -U /src/ome-zarr-py
RUN /opt/omero/server/venv3/bin/pip install -U /src/omero-cli-zarr
# Revert to omero-server
USER 1000
ENV PATH=/opt/omero/server/venv3/bin/:${PATH}
ENV VIRTUALENV=/opt/omero/server/venv3
ENTRYPOINT ["python"]
CMD ["-c", "import sys; print('No action'); sys.exit(0)"]
