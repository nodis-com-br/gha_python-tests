FROM docker.io/nodisbr/python:3.7.3-0001

RUN pip install coverage pytest pytest-azurepipelines

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]