#!/bin/sh -xe

OS_VERSION=$1

# Add monitor interface to config
cat <<EOF > /etc/rocknsm/config.yml
---
rock_monifs:
  - tap0
EOF

# Generate defaults
/rock/bin/generate_defaults.sh

echo "--- DUMP DEFAULT VALUES ---"
cat /etc/rocknsm/config.yml


echo "--- END DEFAULT VALUES ---"

# Run deploy
DEBUG=1 /rock/bin/deploy_rock.sh 