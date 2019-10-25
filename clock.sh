#!/bin/bash
timezones=(
America/Los_Angeles
America/New_York
Europe/London
Europe/Paris #=Madrid,Warsaw
Europe/Helsinki
Asia/Dubai
Asia/Bangkok
)

last_number=$(( ${#timezones[*]} - 1 ))
last=${timezones[$last_number]}

for timezone in "${timezones[@]}"
do
  echo "$timezone" | cut -d \/ -f2 | cut -c1-3 | tr -d "\n";
  echo -n "`env TZ=$timezone date +%H`";

  if [[ $timezone == $last ]]
  then
    break
  fi
  echo " " | tr -d "\n";
done
