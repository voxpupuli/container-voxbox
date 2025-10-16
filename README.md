# Vox Pupuli Test Box

[![CI](https://github.com/voxpupuli/container-voxbox/actions/workflows/ci.yaml/badge.svg)](https://github.com/voxpupuli/container-voxbox/actions/workflows/ci.yaml)
[![License](https://img.shields.io/github/license/voxpupuli/container-voxbox.svg)](https://github.com/voxpupuli/container-voxbox/blob/main/LICENSE)
[![Sponsored by betadots GmbH](https://img.shields.io/badge/Sponsored%20by-betadots%20GmbH-blue.svg)](https://www.betadots.de)

---

- [Vox Pupuli Test Box](#vox-pupuli-test-box)
  - [Introduction](#introduction)
  - [Included rubygems](#included-rubygems)
  - [Additionally included tools](#additionally-included-tools)
  - [Versions](#versions)
  - [Usage](#usage)
    - [Rake](#rake)
      - [release Task](#release-task)
      - [spec Task](#spec-task)
      - [Available rake tasks](#available-rake-tasks)
    - [Onceover](#onceover)
    - [Shell](#shell)
    - [Puppet](#puppet)
      - [puppet-strings](#puppet-strings)
    - [puppet-ghostbuster](#puppet-ghostbuster)
    - [YAMLlint](#yamllint)
    - [JQ](#jq)
    - [cURL](#curl)
    - [RuboCop](#rubocop)
  - [GitLab](#gitlab)
    - [Example GitLab CI configuration](#example-gitlab-ci-configuration)
    - [GitLab Codequality Report](#gitlab-codequality-report)
    - [GitLab Unit Test Report](#gitlab-unit-test-report)
  - [Version Schema](#version-schema)
  - [How to release?](#how-to-release)
  - [How to contribute?](#how-to-contribute)

## Introduction

This container should be used to test voxpupuli OpenVox/Puppet modules.
It has the voxpupuli-test, -acceptance, -release gems and all dependencies installed.

## Informations

- ⚠ On February 28, 2025, OpenVox/Puppet 7 entered its end-of-life phase. Consequently, no new VoxBox:7 releases will be build. Existing versions will be retained for continued access.

## Included rubygems

- modulesync
- onceover
- openfact
- openvox
- puppet-ghostbuster
- r10k
- rubocop
- voxpupuli-acceptance
- voxpupuli-release
- voxpupuli-test

## Additionally included tools

- curl
- git
- gpg
- jq
- ssh-client
- yamllint

## Versions

Too see which tool versions are included in the container, see:

[build_versions.yaml](build_versions.yaml)

## Usage

### Rake

Change into the root of a OpenVox/Puppet module and run the container.
Make sure to mount the current directory into the container under `/repo`.
The default entrypoint is rake. Without any arguments it will run `rake -T`.
You can specify a rake task as argument. See [Available rake tasks](#available-rake-tasks) for more information.

To guarantee a consistent rake environment, use `-f /Rakefile` to explicitly specify your Rakefile,
rather than relying on potentially outdated versions in a repository.
The Rakefile being used can be viewed [here](voxbox/Rakefile).

```shell
cd puppet-example
podman run -it --rm -v $PWD:/repo:Z ghcr.io/voxpupuli/voxbox:8                   # rake -T
podman run -it --rm -v $PWD:/repo:Z ghcr.io/voxpupuli/voxbox:8 spec              # rake spec
podman run -it --rm -v $PWD:/repo:Z ghcr.io/voxpupuli/voxbox:8 -f /Rakefile spec # rake spec with "safe" Rakefile
```

#### release Task

Using the release rake task:

```shell
podman run -it --rm \
   -v $PWD:/repo:Z \
   -v ~/.gitconfig:/etc/gitconfig:ro \
   -v ~/.ssh:/root/.ssh \
   -v ${SSH_AUTH_SOCK}:${SSH_AUTH_SOCK} \
   -e SSH_AUTH_SOCK="${SSH_AUTH_SOCK}" \
   ghcr.io/voxpupuli/voxbox:8 release
```

#### spec Task

Running only a specific spec:

```shell
podman run -it --rm -e "SPEC=spec/classes/example_spec.rb" -v $PWD:/repo:Z ghcr.io/voxpupuli/voxbox:8 -f /Rakefile spec
```

#### Available rake tasks

```shell
rake beaker                                                                     # Run RSpec code examples
rake build                                                                      # Build puppet module package
rake build:pdk                                                                  # Build Puppet module with PDK
rake check                                                                      # Run static pre release checks
rake check:dot_underscore                                                       # Fails if any ._ files are present in directory
rake check:git_ignore                                                           # Fails if directories contain the files specified in .gitignore
rake check:symlinks                                                             # Fails if symlinks are present in directory
rake check:test_file                                                            # Fails if .pp files present in tests folder
rake check:trailing_whitespace                                                  # Check for trailing whitespace
rake check_changelog                                                            # Check Changelog
rake clean                                                                      # Clean a built module package
rake compute_dev_version                                                        # Print development version of module
rake generate_fixtures                                                          # Generate -fixtures.yml based on Puppetfile
rake generate_vendor_cache                                                      # Fetches the core modules which are usually bundled in AIO agent
rake help                                                                       # Display the list of available rake tasks
rake lint                                                                       # Run puppet-lint
rake lint_fix                                                                   # Run puppet-lint
rake metadata_lint                                                              # Run metadata-json-lint
rake module:build                                                               # Build the module using puppet-modulebuilder
rake module:bump                                                                # Bump module version to the next patch
rake module:bump:full                                                           # Bump module version to the next FULL version
rake module:bump:major                                                          # Bump module version to the next MAJOR version
rake module:bump:minor                                                          # Bump module version to the next MINOR version
rake module:bump:patch                                                          # Bump module version to the next PATCH version
rake module:bump_commit                                                         # Bump version and git commit
rake module:bump_commit:full                                                    # Bump module version to the next FULL version and git commit
rake module:bump_commit:major                                                   # Bump module version to the next MAJOR version and git commit
rake module:bump_commit:minor                                                   # Bump module version to the next MINOR version and git commit
rake module:bump_commit:patch                                                   # Bump module version to the next PATCH version and git commit
rake module:bump_to_version[new_version]                                        # Bump module to specific version number
rake module:clean                                                               # Runs clean again
rake module:dependency[module_name,version]                                     # Set specific module dependency version
rake module:push                                                                # Push module to the Puppet Forge
rake module:release                                                             # Release the Puppet module, doing a clean, build, bump_commit, tag, push and git push
rake module:tag                                                                 # Git tag with the current module version
rake module:version                                                             # Get current module version
rake module:version:next                                                        # Get next module version
rake module:version:next:major                                                  # Get the next MAJOR version
rake module:version:next:minor                                                  # Get the next MINOR version
rake module:version:next:patch                                                  # Get the next PATCH version
rake parallel_spec                                                              # Run spec tests in parallel and clean the fixtures directory if successful
rake parallel_spec_standalone                                                   # Parallel spec tests
rake r10k:dependencies                                                          # Print outdated forge modules
rake r10k:deprecation                                                           # Validate that no forge modules are deprecated
rake r10k:duplicates                                                            # Check Puppetfile for duplicates
rake r10k:install                                                               # Install modules specified in Puppetfile
rake r10k:print_git_conversion                                                  # Convert and print forge modules to git format
rake r10k:solve_dependencies[allow_major_bump]                                  # Find missing or outdated module dependencies
rake r10k:syntax                                                                # Syntax check Puppetfile
rake r10k:validate                                                              # Validate the git urls and branches, refs, or tags
rake release                                                                    # Release via GitHub Actions
rake release:prepare                                                            # Prepare a release
rake release_checks                                                             # Runs all necessary checks on a module in preparation for a release
rake rubocop                                                                    # Run RuboCop
rake rubocop:autocorrect                                                        # Autocorrect RuboCop offenses (only when it's safe)
rake rubocop:autocorrect_all                                                    # Autocorrect RuboCop offenses (safe and unsafe)
rake spec                                                                       # Run spec tests and clean the fixtures directory if successful
rake spec:simplecov                                                             # Run spec tests with ruby simplecov code coverage
rake spec_clean                                                                 # Clean up the fixtures directory
rake spec_clean_symlinks                                                        # Clean up any fixture symlinks
rake spec_list_json                                                             # List spec tests in a JSON document
rake spec_prep                                                                  # Create the fixtures directory
rake spec_standalone                                                            # Run RSpec code examples
rake strings:generate[patterns,debug,backtrace,markup,json,markdown,yard_args]  # Generate Puppet documentation with YARD
rake strings:generate:reference[patterns,debug,backtrace]                       # Generate Puppet Reference documentation
rake strings:gh_pages:update                                                    # Update docs on the gh-pages branch and push to GitHub
rake strings:validate:reference[patterns,debug,backtrace]                       # Validate the reference is up to date
rake syntax                                                                     # Syntax check for Puppet manifests, templates and Hiera
rake syntax:hiera                                                               # Syntax check Hiera config files
rake syntax:manifests                                                           # Syntax check Puppet manifests
rake syntax:templates                                                           # Syntax check Puppet templates
rake test                                                                       # Run tests
rake travis_release                                                             # Deprecated: use the "release" task instead
rake validate                                                                   # Check syntax of Ruby files and call :syntax and :metadata_lint
rake voxpupuli:custom:lint_all                                                  # Lint with all puppet-lint checks
```

### Onceover

If you want to run onceover, you have to override the entrypoint:

```shell
podman run -it --rm -v $PWD:/repo:Z --entrypoint onceover ghcr.io/voxpupuli/voxbox:8 help
```

Onceover allows you to run tests against your control-repository.

Initialize onceover:

```shell
podman run -it --rm -v $PWD:/repo:Z --entrypoint onceover ghcr.io/voxpupuli/voxbox:latest init
```

Running spec tests:

```shell
podman run -it --rm -v $PWD:/repo:Z --entrypoint onceover ghcr.io/voxpupuli/voxbox:8 run spec
```

Running spec test with internal git+ssh modules in Puppetfile:

```shell
podman run -it --rm \
  -v ~/.ssh:/root/.ssh:Z \
  -v $PWD:/repo:Z \
  --entrypoint onceover ghcr.io/voxpupuli/voxbox:latest run spec
```

Running spec tests with puppet output:

```shell
podman run -it --rm \
  -v $PWD:/repo:Z \
  -e SHOW_PUPPET_OUTPUT=true \
  --entrypoint onceover ghcr.io/voxpupuli/voxbox:latest run spec
```

Other commands are:

| Command | What it does |
|---|---|
| `show puppetfile` | Analyze the Puppetfile and show open updates |
| `update puppetfile` | Update modules |

Further commands, required configuration and usage is described in the [onceover repository](https://github.com/voxpupuli/onceover).

### Shell

If you need a shell, you have to override the entrypoint:

```shell
podman run -it --rm -v $PWD:/repo:Z --entrypoint ash ghcr.io/voxpupuli/voxbox:8
```

### Puppet

If you want to execute puppet change the entrypoint to `puppet` and pass subcommands/parameters to it.

```shell
podman run -it --rm -v $PWD:/repo:Z --entrypoint puppet ghcr.io/voxpupuli/voxbox:8 --help
```

#### puppet-strings

```shell
podman run -it --rm -v $PWD:/repo:Z --entrypoint puppet ghcr.io/voxpupuli/voxbox:8 strings --help
```

## puppet-ghostbuster

If you want to execute puppet-ghostbuster change the entrypoint to `ash` and pass the command to the container.
Ghostbuster needs a connection to the OpenVoxDB/PuppetDB, so you have to provide the environment variables.
You can find them in the documentation of the [puppet-ghostbuster](https://github.com/voxpupuli/puppet-ghostbuster) repository.

Ghostbuster supports the following checks:

- ghostbuster_classes
- ghostbuster_defines
- ghostbuster_facts
- ghostbuster_files
- ghostbuster_functions
- ghostbuster_hiera_files
- ghostbuster_templates
- ghostbuster_types

They can be combined with `--only-checks` and listed in a comma separated list.

```shell
podman run -it --rm -v $PWD:/repo:Z --entrypoint ash ghcr.io/voxpupuli/voxbox:8
find . -type f -exec bundle exec --gemfile /Gemfile puppet-lint --only-checks ghostbuster_classes,ghostbuster_facts {} \+
```

### YAMLlint

If you want to execute yamllint change the entryoint to `yamllint` and pass a folder to the container, f.e. `.`.

```shell
podman run -it --rm -v $PWD:/repo:Z --entrypoint yamllint ghcr.io/voxpupuli/voxbox:8 .
```

### JQ

If you want to execute jq change the entrypoint to `jq` and pass a query/parameter to the container.

```shell
podman run -it --rm -v $PWD:/repo:Z --entrypoint jq ghcr.io/voxpupuli/voxbox:8 --help
```

### cURL

If you want to execute curl change the entrypoint to `curl` and pass a query/parameter to the container.

```shell
podman run -it --rm -v $PWD:/repo:Z --entrypoint curl ghcr.io/voxpupuli/voxbox:8 --help
```

### RuboCop

If you want to execute RuboCop directly change the entrypoint to `rubocop` and pass a subcommands/parameter to the container.

```shell
podman run -it --rm -v $PWD:/repo:Z --entrypoint rubocop ghcr.io/voxpupuli/voxbox:8
podman run -it --rm -v $PWD:/repo:Z --entrypoint rubocop ghcr.io/voxpupuli/voxbox:8 --auto-gen-config
```

## EasyVoxBox (evb)

The [evb script](evb) shortens the commands to be typed for running voxbox. Additionaly, it does not care about the sequence of
options, wich can be usefull for setting shell aliases. To run the command you must change into any subdirectory of a openvox module
(with a metadata.json file) or a control repository (with a Puppetfile).

Display the evb help message:

```shell
$ evb help
Usage: /usr/local/bin/evb [options] [command]

available options:
  --noop        : print the command to run, but do not run it
  --entrypoint  : use a different entrypoint
                  examples for available endpoints are:
                  onceover, ash, puppet, yamllint, jq, curl, rubocop
                  default: no entrypoint specified
  --image image : use a different image (default ghcr.io/voxpupuli/voxbox:8)
  --env VAR=val : specify environment variables (can be used multiple times)
                  Remark: the term './' in a assignment will be replaced with
                  the correct path to be used in the container.
                  Example: if you start the script in ~/openvox-supermodule/spec/classes
                           and set --env SPEC=./supermodule_spec.rb we will
                           run VoxBox with -e SPEC=spec/classes/supermodule_spec.rb
  --volume vol  : specify an additional volume to put into the container
                  see podman man page how to specify 'vol'. (no path magic is done ;))
  --runcmd      : this lets you change the program used to start the container
                  if not set explicit it looks for podman or docker.

available command:
   help  : print this help message and exit

commands/options not listed here are passed to VoxBox as is.
use the '--noop' option to print the detailed call to VoxBox.
```

See the command that would be executed (dropping the --noop option will run the command):

```shell
evb --noop                                     # for rake -T
evb --noop spec                                # for rake spec
evb --noop --env SPEC=./example_spec.rb spec   # for only a specific spec in the current subdirectory
evb --noop --entrypoint onceover --help        # onceover help

# or the release rake task
evb --volume ~/.gitconfig:/etc/gitconfig:ro \
    --volume ~/.ssh:/root/.ssh \
    --volume ${SSH_AUTH_SOCK}:${SSH_AUTH_SOCK} \
    --env  SSH_AUTH_SOCK="${SSH_AUTH_SOCK}" \
    release --noop
```

## GitLab

### Example GitLab CI configuration

see [.gitlab-ci.yml](.gitlab-ci.yml)

### GitLab Codequality Report

- <https://github.com/puppetlabs/puppet-lint?tab=readme-ov-file#integration-with-gitlab-code-quality>
- <https://docs.gitlab.com/ci/testing/code_quality/>

Example usage:

```yaml
code-quality:
  image:
    name: ghcr.io/voxpupuli/voxbox:8
    entrypoint: ['']
  stage: verify
  script:
    - rake -f /Rakefile voxpupuli:custom:lint_all
  variables:
    # setting this variable makes puppet-lint create the json file
    # needed for the code quality report
    CODECLIMATE_REPORT_FILE: 'gl-code-quality-report.json'
  artifacts:
    when: always
    reports:
      codequality: gl-code-quality-report.json
    expire_in: 1 week
```

### GitLab Unit Test Report

add to .rspec file:

```text
--format RspecJunitFormatter
--out rspec.xml
```

add to .gitlab-ci.yml:

```yaml
rspec:
  image:
    name: ghcr.io/voxpupuli/voxbox:8
    entrypoint: ['']
  stage: test
  script:
    - rake -f /Rakefile spec
  artifacts:
    when: always
    reports:
      junit: rspec.xml
    expire_in: 1 week
```

## Version Schema

The version schema has the following layout:

```text
<puppet.major>.<puppet.minor>.<puppet.patch>-v<container.major>.<container.minor>.<container.patch>
<puppet.major>-v<container.major>.<container.minor>.<container.patch>
<puppet.major>
latest
```

Example usage:

```shell
podman pull ghcr.io/voxpupuli/voxbox:8.5.1-v1.2.3
podman pull ghcr.io/voxpupuli/voxbox:8-v1.2.3
podman pull ghcr.io/voxpupuli/voxbox:8
podman pull ghcr.io/voxpupuli/voxbox:latest
```

| Name | Description |
| --- | --- |
| puppet.major    | Describes the contained major Puppet version (7 or 8) |
| puppet.minor    | Describes the contained minor Puppet version |
| puppet.patch    | Describes the contained patchlevel Puppet version |
| container.major | Describes breaking changes without backward compatibility |
| container.minor | Describes new features or refactoring with backward compatibility |
| container.patch | Describes if minor changes or bugfixes have been implemented |

## How to release?

see [RELEASE.md](RELEASE.md)

## How to contribute?

see [CONTRIBUTING.md](CONTRIBUTING.md)
