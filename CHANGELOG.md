# Changelog

All notable changes to this project will be documented in this file.

## [v4.1.0](https://github.com/voxpupuli/container-voxbox/tree/v4.1.0) (2026-03-13)

[Full Changelog](https://github.com/voxpupuli/container-voxbox/compare/v4.0.1...v4.1.0)

**Implemented enhancements:**

- SBOM/Gemfile.lock - get all gem dependencies and the installed version number [\#143](https://github.com/voxpupuli/container-voxbox/issues/143)
- Enhance error handling in evb script [\#216](https://github.com/voxpupuli/container-voxbox/pull/216) ([corporate-gadfly](https://github.com/corporate-gadfly))
- add missing gems, fix whitespaces [\#213](https://github.com/voxpupuli/container-voxbox/pull/213) ([rwaffen](https://github.com/rwaffen))
- feat: use /Rakefile per default [\#187](https://github.com/voxpupuli/container-voxbox/pull/187) ([rwaffen](https://github.com/rwaffen))
- fix: replace default gems for base64 and bigdecimal, silence warnings for exp. features [\#177](https://github.com/voxpupuli/container-voxbox/pull/177) ([rwaffen](https://github.com/rwaffen))
- README: EasyVoxBox: fix typos [\#174](https://github.com/voxpupuli/container-voxbox/pull/174) ([kenyon](https://github.com/kenyon))
- feat: add webmock for easier api mocking in rspec tests [\#171](https://github.com/voxpupuli/container-voxbox/pull/171) ([rwaffen](https://github.com/rwaffen))
- fix: Update base image to use ruby:3.2-alpine [\#169](https://github.com/voxpupuli/container-voxbox/pull/169) ([rwaffen](https://github.com/rwaffen))
- feat: Add hiera-eyaml and librarian-puppet to github actions [\#166](https://github.com/voxpupuli/container-voxbox/pull/166) ([rwaffen](https://github.com/rwaffen))
- feat: add hiera-eyaml [\#165](https://github.com/voxpupuli/container-voxbox/pull/165) ([JGodin-C2C](https://github.com/JGodin-C2C))
- feat: Add librarian utility [\#164](https://github.com/voxpupuli/container-voxbox/pull/164) ([JGodin-C2C](https://github.com/JGodin-C2C))

**Fixed bugs:**

- Regression: librarian pulling in the puppt gem again :\( [\#167](https://github.com/voxpupuli/container-voxbox/issues/167)
- r10k:diff task does not work from inside a container [\#118](https://github.com/voxpupuli/container-voxbox/issues/118)
- Gem: racc is installed two times [\#117](https://github.com/voxpupuli/container-voxbox/issues/117)
- Bug: ghostbuster linters are executed every time [\#101](https://github.com/voxpupuli/container-voxbox/issues/101)
- fix: add libffi-dev for compiling gem dependency fiddler [\#240](https://github.com/voxpupuli/container-voxbox/pull/240) ([rwaffen](https://github.com/rwaffen))
- fix: add openvox-strings, pin to 6.0.0 [\#226](https://github.com/voxpupuli/container-voxbox/pull/226) ([bootc](https://github.com/bootc))
- CI: properly check if all jobs passed [\#225](https://github.com/voxpupuli/container-voxbox/pull/225) ([bastelfreak](https://github.com/bastelfreak))
- fix: use the right names for gem lookups [\#214](https://github.com/voxpupuli/container-voxbox/pull/214) ([rwaffen](https://github.com/rwaffen))
- fix: update bundler and containerfile defaults, remove removal of rexml [\#207](https://github.com/voxpupuli/container-voxbox/pull/207) ([rwaffen](https://github.com/rwaffen))

**Merged pull requests:**

- chore\(deps\): update dependency github\_changelog\_generator to '~\> 1.17.0' [\#246](https://github.com/voxpupuli/container-voxbox/pull/246) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency bundler to v4.0.8 [\#243](https://github.com/voxpupuli/container-voxbox/pull/243) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update docker/build-push-action action to v7 [\#238](https://github.com/voxpupuli/container-voxbox/pull/238) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency librarian-puppet to v7 [\#237](https://github.com/voxpupuli/container-voxbox/pull/237) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update docker/login-action action to v4 - autoclosed [\#235](https://github.com/voxpupuli/container-voxbox/pull/235) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency puppet-ghostbuster to v2.1.0 [\#234](https://github.com/voxpupuli/container-voxbox/pull/234) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update actions/upload-artifact action to v7 [\#232](https://github.com/voxpupuli/container-voxbox/pull/232) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency bundler to v4.0.7 [\#230](https://github.com/voxpupuli/container-voxbox/pull/230) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency hiera-eyaml to v5 [\#229](https://github.com/voxpupuli/container-voxbox/pull/229) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency openfact to v5.5.0 [\#224](https://github.com/voxpupuli/container-voxbox/pull/224) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency voxpupuli-release to v5.2.0 [\#221](https://github.com/voxpupuli/container-voxbox/pull/221) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency openvox to v8.25.0 [\#220](https://github.com/voxpupuli/container-voxbox/pull/220) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency openfact to v5.4.0 [\#219](https://github.com/voxpupuli/container-voxbox/pull/219) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(config\): migrate Renovate config [\#218](https://github.com/voxpupuli/container-voxbox/pull/218) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency bundler to v4.0.6 [\#206](https://github.com/voxpupuli/container-voxbox/pull/206) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency voxpupuli-acceptance to v4.3.0 [\#204](https://github.com/voxpupuli/container-voxbox/pull/204) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency openfact to v5.3.0 [\#203](https://github.com/voxpupuli/container-voxbox/pull/203) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency voxpupuli-release to v5.1.0 [\#202](https://github.com/voxpupuli/container-voxbox/pull/202) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependabot/fetch-metadata action to v2.5.0 [\#201](https://github.com/voxpupuli/container-voxbox/pull/201) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency puppet\_metadata to v6 [\#200](https://github.com/voxpupuli/container-voxbox/pull/200) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency bundler to v4.0.3 [\#198](https://github.com/voxpupuli/container-voxbox/pull/198) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency rdoc to v7 [\#197](https://github.com/voxpupuli/container-voxbox/pull/197) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency minitest to v6 [\#196](https://github.com/voxpupuli/container-voxbox/pull/196) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency minitest to v6 [\#194](https://github.com/voxpupuli/container-voxbox/pull/194) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency bundler to v4.0.2 [\#193](https://github.com/voxpupuli/container-voxbox/pull/193) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency bigdecimal to v4 [\#192](https://github.com/voxpupuli/container-voxbox/pull/192) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency openvox to v8.24.2 [\#191](https://github.com/voxpupuli/container-voxbox/pull/191) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency openfact to v5.2.1 [\#190](https://github.com/voxpupuli/container-voxbox/pull/190) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update davidanson/markdownlint-cli2-action action to v22 [\#185](https://github.com/voxpupuli/container-voxbox/pull/185) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency openvox to v8.24.1 [\#184](https://github.com/voxpupuli/container-voxbox/pull/184) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency openfact to v5.2.0 [\#183](https://github.com/voxpupuli/container-voxbox/pull/183) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency bundler to v4 [\#181](https://github.com/voxpupuli/container-voxbox/pull/181) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency voxpupuli-test to v13.2.0 [\#180](https://github.com/voxpupuli/container-voxbox/pull/180) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency voxpupuli-acceptance to v4.2.0 [\#179](https://github.com/voxpupuli/container-voxbox/pull/179) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update actions/checkout action to v6 [\#178](https://github.com/voxpupuli/container-voxbox/pull/178) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(docs\): correct typos and formatting in README.md [\#175](https://github.com/voxpupuli/container-voxbox/pull/175) ([rwaffen](https://github.com/rwaffen))
- chore\(deps\): update davidanson/markdownlint-cli2-action action to v21 [\#173](https://github.com/voxpupuli/container-voxbox/pull/173) ([renovate[bot]](https://github.com/apps/renovate))
- chore\(deps\): update dependency voxpupuli-release to v5.0.2 [\#172](https://github.com/voxpupuli/container-voxbox/pull/172) ([renovate[bot]](https://github.com/apps/renovate))

## [v4.0.1](https://github.com/voxpupuli/container-voxbox/tree/v4.0.1) (2025-10-16)

[Full Changelog](https://github.com/voxpupuli/container-voxbox/compare/v4.0.0...v4.0.1)

**Fixed bugs:**

- fix: repair labeler CI [\#162](https://github.com/voxpupuli/container-voxbox/pull/162) ([rwaffen](https://github.com/rwaffen))
- fix: use openvox in all CI [\#161](https://github.com/voxpupuli/container-voxbox/pull/161) ([rwaffen](https://github.com/rwaffen))

## [v4.0.0](https://github.com/voxpupuli/container-voxbox/tree/v4.0.0) (2025-10-16)

[Full Changelog](https://github.com/voxpupuli/container-voxbox/compare/v3.2.0...v4.0.0)

**Implemented enhancements:**

- add a script evb \(=EasyVoxBox\) for more comfortable use of VoxBox [\#136](https://github.com/voxpupuli/container-voxbox/pull/136) ([trefzer](https://github.com/trefzer))
- feat: change to openvox/openfact gem [\#119](https://github.com/voxpupuli/container-voxbox/pull/119) ([rwaffen](https://github.com/rwaffen))

**Fixed bugs:**

- fix ghostbuster [\#142](https://github.com/voxpupuli/container-voxbox/pull/142) ([tuxmea](https://github.com/tuxmea))

**Merged pull requests:**

- chore\(deps\): update dependency onceover to v5 [\#125](https://github.com/voxpupuli/container-voxbox/pull/125) ([renovate[bot]](https://github.com/apps/renovate))

## [v3.2.0](https://github.com/voxpupuli/container-voxbox/tree/v3.2.0) (2025-07-11)

[Full Changelog](https://github.com/voxpupuli/container-voxbox/compare/v3.1.0...v3.2.0)

**Merged pull requests:**

- feat: switch to Containerfile and update CI workflows to use it, update gemset to eliminate duplicates [\#128](https://github.com/voxpupuli/container-voxbox/pull/128) ([rwaffen](https://github.com/rwaffen))
- docs: add more hints for using onceover [\#121](https://github.com/voxpupuli/container-voxbox/pull/121) ([rwaffen](https://github.com/rwaffen))

## [v3.1.0](https://github.com/voxpupuli/container-voxbox/tree/v3.1.0) (2025-05-22)

[Full Changelog](https://github.com/voxpupuli/container-voxbox/compare/v3.0.0...v3.1.0)

**Fixed bugs:**

- codeowners are broken [\#95](https://github.com/voxpupuli/container-voxbox/issues/95)
- fix: actually use specified r10k and ra10ke versions [\#114](https://github.com/voxpupuli/container-voxbox/pull/114) ([rwaffen](https://github.com/rwaffen))
- fix: resolve gem problems [\#104](https://github.com/voxpupuli/container-voxbox/pull/104) ([rwaffen](https://github.com/rwaffen))

**Closed issues:**

- fix gem problems [\#97](https://github.com/voxpupuli/container-voxbox/issues/97)

**Merged pull requests:**

- docs: add rubocop entrypoint howto, update wording regarding OpenVox and Puppet [\#110](https://github.com/voxpupuli/container-voxbox/pull/110) ([rwaffen](https://github.com/rwaffen))
- docs: add gitlab unit test report and codequality report [\#109](https://github.com/voxpupuli/container-voxbox/pull/109) ([rwaffen](https://github.com/rwaffen))
- docs: put ghostbuster in order, update build\_versions link [\#102](https://github.com/voxpupuli/container-voxbox/pull/102) ([rwaffen](https://github.com/rwaffen))

## [v3.0.0](https://github.com/voxpupuli/container-voxbox/tree/v3.0.0) (2025-03-14)

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
