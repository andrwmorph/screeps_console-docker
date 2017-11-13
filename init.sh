#!/bin/bash

sed -i "s|<username>|$USERNAME|"  /app/.screepsconsole.yaml
sed -i "s|<password>|$PASSWORD|"  /app/.screepsconsole.yaml

exec /app/screeps_console/bin/screepsconsole.sh
