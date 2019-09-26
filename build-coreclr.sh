#!/usr/bin/env bash


scriptroot="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

coreclrbuilddir_rel="$scriptroot/../coreclr/bin/Product/Linux.x64.Release"
coreclrbuilddir=$coreclrbuilddir_rel
#coreclrbuilddir="$scriptroot/../coreclr/bin/Product/Linux.x64.Debug"
coreclrbinariesdir="$scriptroot/webapi/coreclrbin"

# apt install cmake clang llvm libicu-dev liblttng-ust-dev libkrb5-dev

# place binaries into a separate directory for submission to perflab
rm -r -f webapi/coreclrbin
mkdir -p webapi/coreclrbin
cp "$coreclrbuilddir/bundle.dll" "$coreclrbinariesdir"
cp "$coreclrbuilddir/bundle.runtimeconfig.json" "$coreclrbinariesdir"
cp "$coreclrbuilddir/Microsoft.NET.HostModel.dll" "$coreclrbinariesdir"
cp "$coreclrbuilddir/corebundle" "$coreclrbinariesdir"
cp "$coreclrbuilddir/System.Private.CoreLib.dll" "$coreclrbinariesdir"
rm -r -f webapi/coreclrbin/crossgen2
mkdir -p webapi/coreclrbin/crossgen2
cp $coreclrbuilddir_rel/crossgen2/* "$coreclrbinariesdir/crossgen2"
rm -r -f webapi/coreclrbin/tibcmgr
mkdir -p webapi/coreclrbin/tibcmgr
cp $coreclrbuilddir_rel/tibcmgr/* "$coreclrbinariesdir/tibcmgr"
