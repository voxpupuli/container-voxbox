ARG BASE_IMAGE=docker.io/ruby:3.2-alpine

FROM $BASE_IMAGE AS builder

# Gems have to be ARG and ENV because they are used as reference in the Gemfile
ARG RUBYGEM_BUNDLER
ARG RUBYGEM_HIERA_EYAML
ARG RUBYGEM_LIBRARIAN_PUPPET
ARG RUBYGEM_MODULESYNC
ARG RUBYGEM_OPENFACT
ARG RUBYGEM_OPENVOX
ARG RUBYGEM_OPENVOX_STRINGS
ARG RUBYGEM_PUPPET_GHOSTBUSTER
ARG RUBYGEM_PUPPET_METADATA
ARG RUBYGEM_R10K
ARG RUBYGEM_RA10KE
ARG RUBYGEM_RSPEC_JUNIT_FORMATTER
ARG RUBYGEM_RUBOCOP_PERFORMANCE
ARG RUBYGEM_VOXPUPULI_ACCEPTANCE
ARG RUBYGEM_VOXPUPULI_RELEASE
ARG RUBYGEM_VOXPUPULI_TEST
ARG RUBYGEM_WEBMOCK

# renovate: depName=bundler datasource=rubygems
ENV RUBYGEM_BUNDLER=${RUBYGEM_BUNDLER:-4.0.12}
# renovate: depName=hiera-eyaml datasource=rubygems
ENV RUBYGEM_HIERA_EYAML=${RUBYGEM_HIERA_EYAML:-5.0.1}
# renovate: depName=librarian-puppet datasource=rubygems
ENV RUBYGEM_LIBRARIAN_PUPPET=${RUBYGEM_LIBRARIAN_PUPPET:-7.0.0}
# renovate: depName=modulesync datasource=rubygems
ENV RUBYGEM_MODULESYNC=${RUBYGEM_MODULESYNC:-4.2.0}
# renovate: depName=openfact datasource=rubygems
ENV RUBYGEM_OPENFACT=${RUBYGEM_OPENFACT:-5.6.1}
# renovate: depName=openvox datasource=rubygems
ENV RUBYGEM_OPENVOX=${RUBYGEM_OPENVOX:-8.27.0}
# renovate: depName=openvox-strings datasource=rubygems
ENV RUBYGEM_OPENVOX_STRINGS=${RUBYGEM_OPENVOX_STRINGS:-7.1.0}
# renovate: depName=puppet-ghostbuster datasource=rubygems
ENV RUBYGEM_PUPPET_GHOSTBUSTER=${RUBYGEM_PUPPET_GHOSTBUSTER:-2.1.0}
# renovate: depName=puppet_metadata datasource=rubygems
ENV RUBYGEM_PUPPET_METADATA=${RUBYGEM_PUPPET_METADATA:-6.2.0}
# renovate: depName=r10k datasource=rubygems
ENV RUBYGEM_R10K=${RUBYGEM_R10K:-5.0.3}
# renovate: depName=ra10ke datasource=rubygems
ENV RUBYGEM_RA10KE=${RUBYGEM_RA10KE:-4.5.1}
# renovate: depName=rspec_junit_formatter datasource=rubygems
ENV RUBYGEM_RSPEC_JUNIT_FORMATTER=${RUBYGEM_RSPEC_JUNIT_FORMATTER:-0.6.0}
# renovate: depName=rubocop-performance datasource=rubygems
ENV RUBYGEM_RUBOCOP_PERFORMANCE=${RUBYGEM_RUBOCOP_PERFORMANCE:-1.23.0}
# renovate: depName=voxpupuli-acceptance datasource=rubygems
ENV RUBYGEM_VOXPUPULI_ACCEPTANCE=${RUBYGEM_VOXPUPULI_ACCEPTANCE:-4.4.0}
# renovate: depName=voxpupuli-release datasource=rubygems
ENV RUBYGEM_VOXPUPULI_RELEASE=${RUBYGEM_VOXPUPULI_RELEASE:-5.4.1}
# renovate: depName=voxpupuli-test datasource=rubygems
ENV RUBYGEM_VOXPUPULI_TEST=${RUBYGEM_VOXPUPULI_TEST:-14.0.0}
# renovate: depName=webmock datasource=rubygems
ENV RUBYGEM_WEBMOCK=${RUBYGEM_WEBMOCK:-3.26.2}

COPY voxbox/Gemfile /opt/voxbox/Gemfile

RUN apk update \
    && apk upgrade \
    && apk add --no-cache --update alpine-sdk yaml-dev libffi-dev \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/bundler-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/default/bundler-*.gemspec \
    && gem install bundler -v ${RUBYGEM_BUNDLER} \
    && cd /opt/voxbox \
    && bundle config set jobs $(nproc) \
    && bundle config set path /opt/voxbox/vendor/bundle \
    && bundle install --gemfile=/opt/voxbox/Gemfile \
    && bundle clean --force

###############################################################################

FROM $BASE_IMAGE AS final

LABEL org.label-schema.maintainer="Voxpupuli Team <voxpupuli@groups.io>" \
      org.label-schema.vendor="Voxpupuli" \
      org.label-schema.url="https://github.com/voxpupuli/container-voxbox" \
      org.label-schema.name="Vox Pupuli Test Box" \
      org.label-schema.license="AGPL-3.0-or-later" \
      org.label-schema.vcs-url="https://github.com/voxpupuli/container-voxbox" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.dockerfile="/Containerfile"

# Disable warnings for experimental features
ENV RUBYOPT="-W:no-experimental"

# bundler needs to know where the Gemfile and gems are located
ENV BUNDLE_GEMFILE=/opt/voxbox/Gemfile
ENV BUNDLE_PATH=/opt/voxbox/vendor/bundle
ENV BUNDLE_APP_CONFIG=/opt/voxbox/vendor/bundle

RUN apk update \
    && apk upgrade \
    && apk add --no-cache openssh-client \
    && apk add --no-cache gpg \
    && apk add --no-cache jq \
    && apk add --no-cache yamllint \
    && apk add --no-cache git \
    && apk add --no-cache curl \
    # CVE fixes - gems are deleted but are reinstalled in the bundler gemset
    && rm -rf /usr/local/lib/ruby/gems/*/gems/erb-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/default/erb-*.gemspec \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/net-imap-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/net-imap-*.gemspec

COPY --from=builder /opt/voxbox /opt/voxbox

COPY Containerfile /
COPY voxbox/Rakefile /opt/voxbox/Rakefile

WORKDIR /repo

ENTRYPOINT [ "bundle", "exec", "rake", "-f", "/opt/voxbox/Rakefile" ]
CMD [ "-T" ]
