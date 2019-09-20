#!/usr/bin/env bash

scriptroot="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

referencescommandline=

for dll in $scriptroot/published/multifile-publish/*.dll
do
  referencescommandline="$referencescommandline -r:$dll"
done

rm -r -f $scriptroot/tibcdata
mkdir -p $scriptroot/tibcdata

for dll in $scriptroot/published/multifile-publish/*.dll
do
  assemfullname=$(basename $dll)
  assemname="${assemfullname%.*}"
  ibcfile=$scriptroot/rawibcdata/$assemname.ibc
  tibcfile=$scriptroot/tibcdata/$assemname.tibc
  if [ -f $ibcfile ]
  then
    tibc_command="$scriptroot/webapi/coreclrbin/tibcmgr/tibcmgr convert $referencescommandline $ibcfile $dll $tibcfile"
    echo $ibcfile
    $tibc_command
  fi
done

