#!/bin/bash
timezones=(
Europe/London
Europe/Paris #=Madrid,Warsaw
Europe/Helsinki
Asia/Dubai
Asia/Bangkok
)
for timezone in "${timezones[@]}"
do
  echo "$timezone" | cut -d \/ -f2 | tr -d "\n"; echo -n "`env TZ=$timezone date +%H` "
done
