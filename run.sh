#!/bin/bash

# If config.yml does not exist, fill with the following multiline content:
if [ ! -f config.yml ]; then
    # Echo until EOF
    cat << EOF > config.yml
# go-librespot config
device_name: go-librespot
credentials:
  type: interactive
EOF
fi

docker compose build && docker compose up -d