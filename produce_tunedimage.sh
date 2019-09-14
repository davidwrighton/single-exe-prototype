#!/usr/bin/env bash

scriptroot="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


rm -r -f $scriptroot/webapi/tibcdata
mkdir -p $scriptroot/webapi/tibcdata
cp $scriptroot/tibcdata/* $scriptroot/webapi/tibcdata

export UseTibcData=true
dotnet publish -c Release webapi/webapi.csproj -o published -p:UseStaticHost=true -p:UsePublishFilterList=true -p:PublishTrimmed=true -p:PublishReadyToRun=true -v d
export UseTibcData=false

