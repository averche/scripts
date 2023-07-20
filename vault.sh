#!/bin/bash

set -e

# start
vault server -config=config.hcl &

# initialize
init_output=$(vault operator init -format=json -n 1 -t 1)

root_token=$(echo "${init_output?}" | jq -r '.root_token')
unseal_key=$(echo "${init_output?}" | jq -r '.unseal_keys_b64[0]')

# unseal
vault operator unseal "${unseal_key?}"

# login
vault login "${root_token}"
