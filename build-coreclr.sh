#!/usr/bin/env bash


scriptroot="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

coreclrbuilddir="$scriptroot/../coreclr/bin/Product/Linux.x64.Release"
coreclrbinariesdir="$scriptroot/webapi/coreclrbin"

# apt install cmake clang llvm libicu-dev liblttng-ust-dev libkrb5-dev

# place binaries into a separate directory for submission to perflab
mkdir -p webapi/coreclrbin
cp "$coreclrbuilddir/bundle.dll" "$coreclrbinariesdir"
cp "$coreclrbuilddir/bundle.runtimeconfig.json" "$coreclrbinariesdir"
cp "$coreclrbuilddir/Microsoft.NET.HostModel.dll" "$coreclrbinariesdir"
cp "$coreclrbuilddir/corebundle" "$coreclrbinariesdir"
cp "$coreclrbuilddir/System.Private.CoreLib.dll" "$coreclrbinariesdir"
mkdir -p webapi/coreclrbin/crossgen2
cp $coreclrbuilddir/crossgen2published/* "$coreclrbinariesdir/crossgen2"
mkdir -p webapi/coreclrbin/tibcmgr
cp $coreclrbuilddir/tibcmgrpublished/* "$coreclrbinariesdir/tibcmgr"
