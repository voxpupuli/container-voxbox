# Changelog

All notable changes to this project will be documented in this file.

## [v3.0.0](https://github.com/voxpupuli/container-voxbox/tree/v3.0.0) (2025-03-13)

[Full Changelog](https://github.com/voxpupuli/container-voxbox/compare/v2.3.0...v3.0.0)

**Breaking changes:**

- feat: deprecate voxbox:7 [\#83](https://github.com/voxpupuli/container-voxbox/pull/83) ([rwaffen](https://github.com/rwaffen))

**Implemented enhancements:**

- feat: add ghostbuster [\#98](https://github.com/voxpupuli/container-voxbox/pull/98) ([rwaffen](https://github.com/rwaffen))
- chore\(deps\): update dependency ra10ke to v4 [\#92](https://github.com/voxpupuli/container-voxbox/pull/92) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency r10k to v5 [\#91](https://github.com/voxpupuli/container-voxbox/pull/91) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency puppet\_metadata to v4.6.0 [\#90](https://github.com/voxpupuli/container-voxbox/pull/90) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency bundler to v2.6.5 [\#88](https://github.com/voxpupuli/container-voxbox/pull/88) ([renovate[bot]](https://github.com/apps/renovate))
- fix: renovate looks for the name rubygem\_\*, so fix the names [\#87](https://github.com/voxpupuli/container-voxbox/pull/87) ([rwaffen](https://github.com/rwaffen))
- feat: add renovate for rubygem updates [\#85](https://github.com/voxpupuli/container-voxbox/pull/85) ([rwaffen](https://github.com/rwaffen))
- feat: remove ffi pinning, does work again [\#84](https://github.com/voxpupuli/container-voxbox/pull/84) ([rwaffen](https://github.com/rwaffen))
- feat: add rubygem rspec\_junit\_formatter for junit output on spec tests [\#81](https://github.com/voxpupuli/container-voxbox/pull/81) ([rwaffen](https://github.com/rwaffen))
- feat: add some package to do releases [\#78](https://github.com/voxpupuli/container-voxbox/pull/78) ([lbetz](https://github.com/lbetz))
- feat: add onceover rubygem [\#72](https://github.com/voxpupuli/container-voxbox/pull/72) ([tuxmea](https://github.com/tuxmea))
- feat: unpin apk packages, remove overcommit, switch back to github runners [\#69](https://github.com/voxpupuli/container-voxbox/pull/69) ([rwaffen](https://github.com/rwaffen))

**Closed issues:**

- test rubygem ffi 1.17.0 again [\#80](https://github.com/voxpupuli/container-voxbox/issues/80)
- check if onceover can be implemented into voxbox [\#70](https://github.com/voxpupuli/container-voxbox/issues/70)
- switch ci container build back to github runners [\#68](https://github.com/voxpupuli/container-voxbox/issues/68)

**Merged pull requests:**

- docs: add hint about using internal Rakefile [\#94](https://github.com/voxpupuli/container-voxbox/pull/94) ([rwaffen](https://github.com/rwaffen))
- docs: add how to run a single spec, fix markdown linter warnings [\#93](https://github.com/voxpupuli/container-voxbox/pull/93) ([rwaffen](https://github.com/rwaffen))
- docs: update tool docu, add toc, re-order sections [\#82](https://github.com/voxpupuli/container-voxbox/pull/82) ([rwaffen](https://github.com/rwaffen))
- docs: Update Readme for onceover, add onceover rake tasks [\#75](https://github.com/voxpupuli/container-voxbox/pull/75) ([tuxmea](https://github.com/tuxmea))

## [v2.3.0](https://github.com/voxpupuli/container-voxbox/tree/v2.3.0) (2024-12-02)

[Full Changelog](https://github.com/voxpupuli/container-voxbox/compare/v2.2.0...v2.3.0)

**Implemented enhancements:**

- feat: Update gitlab-ci example [\#66](https://github.com/voxpupuli/container-voxbox/pull/66) ([rwaffen](https://github.com/rwaffen))
- fix: LegacyKeyValueFormat and update curl patch level [\#65](https://github.com/voxpupuli/container-voxbox/pull/65) ([rwaffen](https://github.com/rwaffen))
- fix: update curl version [\#64](https://github.com/voxpupuli/container-voxbox/pull/64) ([rwaffen](https://github.com/rwaffen))
- feat: update puppet, facter, voxpupuli-test, puppet-metadata, rubocop-performance, bundler [\#59](https://github.com/voxpupuli/container-voxbox/pull/59) ([rwaffen](https://github.com/rwaffen))
- feat: do multi stage build [\#54](https://github.com/voxpupuli/container-voxbox/pull/54) ([rwaffen](https://github.com/rwaffen))
- feat: update gems to latest versions [\#52](https://github.com/voxpupuli/container-voxbox/pull/52) ([rwaffen](https://github.com/rwaffen))

**Fixed bugs:**

- fix: add back curl [\#57](https://github.com/voxpupuli/container-voxbox/pull/57) ([rwaffen](https://github.com/rwaffen))
- fix: add back cve fixes for system gems [\#55](https://github.com/voxpupuli/container-voxbox/pull/55) ([rwaffen](https://github.com/rwaffen))

## [v2.2.0](https://github.com/voxpupuli/container-voxbox/tree/v2.2.0) (2024-09-16)

[Full Changelog](https://github.com/voxpupuli/container-voxbox/compare/v2.1.0...v2.2.0)

**Implemented enhancements:**

- feat: re-enable by puppetlabs disabled puppet-lint checks [\#48](https://github.com/voxpupuli/container-voxbox/pull/48) ([rwaffen](https://github.com/rwaffen))
- fix: update bundler, fix cve in voxbox7 [\#45](https://github.com/voxpupuli/container-voxbox/pull/45) ([rwaffen](https://github.com/rwaffen))
- fix: in ruby 2.7 rexml is a default gem [\#42](https://github.com/voxpupuli/container-voxbox/pull/42) ([rwaffen](https://github.com/rwaffen))
- Fix: update CVE infested gems [\#41](https://github.com/voxpupuli/container-voxbox/pull/41) ([rwaffen](https://github.com/rwaffen))

**Fixed bugs:**

- fix: update broken facter reference in build [\#46](https://github.com/voxpupuli/container-voxbox/pull/46) ([rwaffen](https://github.com/rwaffen))

**Merged pull requests:**

- doc: add info about additionally included tools [\#39](https://github.com/voxpupuli/container-voxbox/pull/39) ([rwaffen](https://github.com/rwaffen))

## [v2.1.0](https://github.com/voxpupuli/container-voxbox/tree/v2.1.0) (2024-08-21)

[Full Changelog](https://github.com/voxpupuli/container-voxbox/compare/v2.0.0...v2.1.0)

**Implemented enhancements:**

- Add jq for json handling in CIs [\#34](https://github.com/voxpupuli/container-voxbox/pull/34) ([rwaffen](https://github.com/rwaffen))

## [v2.0.0](https://github.com/voxpupuli/container-voxbox/tree/v2.0.0) (2024-07-31)

[Full Changelog](https://github.com/voxpupuli/container-voxbox/compare/v1.3.0...v2.0.0)

**Breaking changes:**

- switch to alpine [\#28](https://github.com/voxpupuli/container-voxbox/pull/28) ([rwaffen](https://github.com/rwaffen))
- update puppet, facter and voxpupuli-test to latest versions, update build defaults [\#26](https://github.com/voxpupuli/container-voxbox/pull/26) ([rwaffen](https://github.com/rwaffen))

## [v1.3.0](https://github.com/voxpupuli/container-voxbox/tree/v1.3.0) (2024-07-09)

[Full Changelog](https://github.com/voxpupuli/container-voxbox/compare/v1.2.0...v1.3.0)

**Implemented enhancements:**

- chore: Update rubygem versions in build\_versions.json [\#23](https://github.com/voxpupuli/container-voxbox/pull/23) ([rwaffen](https://github.com/rwaffen))
- Remove stringio 0.1.0 from ruby 2.7 and replace with 3.1 [\#22](https://github.com/voxpupuli/container-voxbox/pull/22) ([rwaffen](https://github.com/rwaffen))

## [v1.2.0](https://github.com/voxpupuli/container-voxbox/tree/v1.2.0) (2024-06-13)

[Full Changelog](https://github.com/voxpupuli/container-voxbox/compare/v1.1.0...v1.2.0)

**Implemented enhancements:**

- Update puppet to 7.31.0 & 8.7.0 and also update gem versions [\#16](https://github.com/voxpupuli/container-voxbox/pull/16) ([rwaffen](https://github.com/rwaffen))
- add yamllint [\#13](https://github.com/voxpupuli/container-voxbox/pull/13) ([rwaffen](https://github.com/rwaffen))

**Closed issues:**

- add yamllint [\#12](https://github.com/voxpupuli/container-voxbox/issues/12)

**Merged pull requests:**

- Describe in more detail the entrypoint and switch from "supported" to "available" rake tasks [\#15](https://github.com/voxpupuli/container-voxbox/pull/15) ([rwaffen](https://github.com/rwaffen))
- describe in more detail how to use the voxbox [\#14](https://github.com/voxpupuli/container-voxbox/pull/14) ([rwaffen](https://github.com/rwaffen))
- Remove libs not needed with CVEs, move defaults to puppet 8 [\#11](https://github.com/voxpupuli/container-voxbox/pull/11) ([rwaffen](https://github.com/rwaffen))

## [v1.1.0](https://github.com/voxpupuli/container-voxbox/tree/v1.1.0) (2024-04-19)

[Full Changelog](https://github.com/voxpupuli/container-voxbox/compare/v1.0.0...v1.1.0)

**Implemented enhancements:**

- update puppet to 7.30.0 and 8.6.0, facter to 4.7.0 and r10k to 4.1.0 [\#8](https://github.com/voxpupuli/container-voxbox/pull/8) ([rwaffen](https://github.com/rwaffen))

**Merged pull requests:**

- Update GitHub actions: Labeler, Add Release workflow, try to fix trivy [\#9](https://github.com/voxpupuli/container-voxbox/pull/9) ([rwaffen](https://github.com/rwaffen))
- remove artifacts from gitlab example [\#7](https://github.com/voxpupuli/container-voxbox/pull/7) ([rwaffen](https://github.com/rwaffen))
- fix wrong file name of gitlab-ci.yml [\#6](https://github.com/voxpupuli/container-voxbox/pull/6) ([rwaffen](https://github.com/rwaffen))
- update README.md to highlight build\_versions.json and add .gitlab-ci.yaml example [\#5](https://github.com/voxpupuli/container-voxbox/pull/5) ([rwaffen](https://github.com/rwaffen))
- Use more precise container image names and add rubocop-performance [\#4](https://github.com/voxpupuli/container-voxbox/pull/4) ([rwaffen](https://github.com/rwaffen))

## [v1.0.0](https://github.com/voxpupuli/container-voxbox/tree/v1.0.0) (2024-03-27)

[Full Changelog](https://github.com/voxpupuli/container-voxbox/compare/ac1461e6cb5c9f365632f39b551bfd510aeea1ba...v1.0.0)

**Implemented enhancements:**

- Add r10k and demo minimal Rakefile [\#1](https://github.com/voxpupuli/container-voxbox/pull/1) ([rwaffen](https://github.com/rwaffen))

**Merged pull requests:**

- Gemfile: add faraday as GCG dependency [\#3](https://github.com/voxpupuli/container-voxbox/pull/3) ([bastelfreak](https://github.com/bastelfreak))



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
