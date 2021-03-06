#!/usr/bin/env bash

export PIP_INDEX_URL="https://${NODIS_PYPI_USER}:${NODIS_PYPI_PASSWORD}@${NODIS_PYPI_HOST}/simple"
export PIP_EXTRA_INDEX_URL="https://pypi.org/simple/"

if [[ ${NODIS_SKIP_TESTS} != true ]] && [[ -f requirements.txt ]]; then

    pip install -r requirements.txt

    if python -m coverage run --source='.' -m pytest; then
        echo "Ok"
    else
        [[ $? -eq 5 ]] || exit $?
    fi

fi

python -m coverage xml || touch coverage.xml