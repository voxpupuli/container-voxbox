#!/bin/bash

yq -o=json build_platforms.yaml > build_platforms.json
yq -o=json build_versions.yaml > build_versions.json

if [ "$1" == "build" ]; then
  jq -rc --slurp '{ include: [ .[1].include[] as $i | .[0].platforms[] as $p | $i + {"platform": $p.platform, "runner": $p.runner} ] }' build_platforms.json build_versions.json
fi

if [ "$1" == "tag" ]; then
    # jq -s '(.[0].platforms[] | .platform) as $platform | (.[1].include[] | .openvox_release) as $release | { openvox_release: $release, platform: $platform }' build_platforms.json build_versions.json | jq -s '{include: .}'
    jq -cr '.include |= map({ openvox_release: .openvox_release, rubygem_openvox: .rubygem_openvox })' build_versions.json
fi

rm build_platforms.json
rm build_versions.json
