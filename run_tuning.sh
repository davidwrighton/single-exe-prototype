#!/usr/bin/env bash

scriptroot="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

rm -r -f $scriptroot/rawibcdata
mkdir -p $scriptroot/rawibcdata

export COMPlus_ZapBBInstr=*
export COMPlus_ZapBBInstrDir=$scriptroot/rawibcdata
export COMPlus_ZapBBInstrR2RGenerics=2

$scriptroot/published/webapi & PROC_ID=$!
echo $PROC_ID

sleep 1
curl http://localhost:5000/WeatherForecast > /dev/null
while [ $? -ne 0 ] 
do
  sleep 1
  curl http://localhost:5000/WeatherForecast > /dev/null
done

echo Service Live!

counter=1
while [ $counter -le 10 ]
do
  echo $counter
  curl http://localhost:5000/WeatherForecast > /dev/null
  counter=$(($counter+1))
  sleep 1
done

echo Telling the service to quit
kill -s SIGTERM $PROC_ID

sleep 1
while kill -0 "$PROC_ID" >/dev/null 2>&1; do
    echo "PROCESS IS STILL RUNNING"
    sleep 1
done

echo "PROCESS TERMINATED"