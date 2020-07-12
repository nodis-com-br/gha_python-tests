FROM docker.io/nodisbr/python:3.7.3-0001

ENV NODIS_PYPI_URL
ENV NODIS_PYPI_USER
ENV NODIS_PYPI_PASSWORD


RUN pip install coverage pytest pytest-azurepipelines --user

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]