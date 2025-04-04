#!/bin/bash

yq -o=json build_platforms.yaml > build_platforms.json
yq -o=json build_versions.yaml > build_versions.json

if [ "$1" == "build" ]; then
  jq -rc --slurp '{ include: [ .[1].include[] as $i | .[0].platforms[] as $p | $i + {"platform": $p.platform, "runner": $p.runner} ] }' build_platforms.json build_versions.json
fi

if [ "$1" == "tag" ]; then
    # jq -s '(.[0].platforms[] | .platform) as $platform | (.[1].include[] | .puppet_release) as $release | { puppet_release: $release, platform: $platform }' build_platforms.json build_versions.json | jq -s '{include: .}'
    jq -cr '.include |= map({ puppet_release: .puppet_release, rubygem_puppet: .rubygem_puppet })' build_versions.json
fi

rm build_platforms.json
rm build_versions.json
