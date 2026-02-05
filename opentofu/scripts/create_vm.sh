#!/bin/bash
# Create xenvm
#
# XOA_URL="ws://<serverURL>"
# XOA_USER=""
# XOA_PASSWORD=""

XOA_INSECURE="true" # Self-signed cert

cd ../xenvm

tofu plan
tofu apply

#tofu destroy
