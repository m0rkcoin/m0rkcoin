#! /usr/bin/env bash

set -o errexit

[ "$OSTYPE" != "win"* ] || die "Windows is not supported"

OPTIND=1

while getopts "c:z" opt; do
    case "$opt" in
    c)  COMPILE_ARGS=${OPTARG}
        ;;
    z)  archive=1
    esac
done
archive=${archive:-0}

shift $((OPTIND-1))

rm -rf build; mkdir -p build/release; cd build/release

if [[ "$OSTYPE" == "msys" ]]; then
    cmake -G "Visual Studio 15 Win64" "..\.."
    msbuild.exe Bytecoin.sln /property:Configuration=Release ${COMPILE_ARGS}
else
    cmake -D STATIC=ON -D ARCH="default" -D CMAKE_BUILD_TYPE=Release ../..
    echo "make ${COMPILE_ARGS}"
    PORTABLE=1 make ${COMPILE_ARGS}
fi

if [[ $? == "0" ]]; then
    echo "Compilation successful"
fi

if [[ $archive == "1" ]]; then
    
    BUILD_DIR="output"
    cd "$(dirname "$0")"; mkdir -p ${BUILD_DIR}; cd ${BUILD_DIR}
    MORKCOIN_NAME="m0rkcoin"
    WINDOWS_BUILD_DIR="$MORKCOIN_NAME-windows"
    MAC_BUILD_DIR="$MORKCOIN_NAME-mac"
    LINUX_BUILD_DIR="$MORKCOIN_NAME-linux"

    case "$OSTYPE" in
        msys*)
            rm -f ${WINDOWS_BUILD_DIR}.zip
            rm -rf ${WINDOWS_BUILD_DIR}
            mkdir ${WINDOWS_BUILD_DIR}
            cp ../build/release/src/Release/${MORKCOIN_NAME}d.exe ${WINDOWS_BUILD_DIR}/
            cp ../build/release/src/Release/simplewallet.exe ${WINDOWS_BUILD_DIR}/
            cp ../build/release/src/Release/walletd.exe ${WINDOWS_BUILD_DIR}/
            cp ../build/release/src/Release/miner.exe ${WINDOWS_BUILD_DIR}/
            zip -r ${WINDOWS_BUILD_DIR}.zip ${WINDOWS_BUILD_DIR}/
            ;;
        darwin*)
            rm -f ${MAC_BUILD_DIR}.zip
            rm -rf ${MAC_BUILD_DIR}
            mkdir ${MAC_BUILD_DIR}
            cp ../build/release/src/${MORKCOIN_NAME}d ${MAC_BUILD_DIR}/
            cp ../build/release/src/simplewallet ${MAC_BUILD_DIR}/
            cp ../build/release/src/walletd ${MAC_BUILD_DIR}/
            cp ../build/release/src/miner ${MAC_BUILD_DIR}/
            zip -r ${MAC_BUILD_DIR}.zip ${MAC_BUILD_DIR}/
            ;;
        *)
            rm -f ${LINUX_BUILD_DIR}.tar.gz
            rm -rf ${LINUX_BUILD_DIR}
            mkdir ${LINUX_BUILD_DIR}
            cp ../build/release/src/${MORKCOIN_NAME}d ${LINUX_BUILD_DIR}/
            cp ../build/release/src/simplewallet ${LINUX_BUILD_DIR}/
            cp ../build/release/src/walletd ${LINUX_BUILD_DIR}/
            cp ../build/release/src/miner ${LINUX_BUILD_DIR}/
            tar -zcfv ${LINUX_BUILD_DIR}.tar.gz ${LINUX_BUILD_DIR}
            ;;
    esac
fi
