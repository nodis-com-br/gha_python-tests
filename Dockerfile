FROM docker.io/nodisbr/python

RUN pip install coverage pytest pytest-azurepipelines

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]