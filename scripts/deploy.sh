#!/usr/bin/env bash
# Runs on the target VM: unpack the release and restart the service.
set -euo pipefail
tar -xzf /tmp/release.tgz -C /opt/order-export
systemctl restart order-export
