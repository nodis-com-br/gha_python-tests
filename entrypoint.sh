#!/usr/bin/env bash

export PIP_INDEX_URL="http://${NODIS_PYPI_USER}:${NODIS_PIPY_PASSWORD}@${NODIS_PYPI_HOST}/simple"
export PIP_EXTRA_INDEX_URL="https://pypi.org/simple/"

if [[ ${NODIS_NO_TESTS} != "True" ]] && [[ -f requirements.txt ]]; then

    pip install -r requirements.txt --user

    if python -m coverage run --source='.' -m pytest; then
        echo "Ok"
    else
        [[ $? -eq 5 ]] || exit $?
    fi

    if ! python -m coverage xml; then
       touch coverage.xml
    fi

fi