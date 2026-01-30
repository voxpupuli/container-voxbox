ARG BASE_IMAGE=docker.io/ruby:3.2-alpine

FROM $BASE_IMAGE AS builder

# Gems have to be ARG and ENV because they are used as reference in the Gemfile
ARG RUBYGEM_BUNDLER
ARG RUBYGEM_HIERA_EYAML
ARG RUBYGEM_LIBRARIAN_PUPPET
ARG RUBYGEM_MODULESYNC
ARG RUBYGEM_ONCEOVER
ARG RUBYGEM_OPENFACT
ARG RUBYGEM_OPENVOX
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
ENV RUBYGEM_BUNDLER=${RUBYGEM_BUNDLER:-4.0.5}
# renovate: depName=hiera-eyaml datasource=rubygems
ENV RUBYGEM_HIERA_EYAML=${RUBYGEM_HIERA_EYAML:-4.3.0}
# renovate: depName=librarian-puppet datasource=rubygems
ENV RUBYGEM_LIBRARIAN_PUPPET=${RUBYGEM_LIBRARIAN_PUPPET:-6.0.0}
# renovate: depName=modulesync datasource=rubygems
ENV RUBYGEM_MODULESYNC=${RUBYGEM_MODULESYNC:-4.2.0}
# renovate: depName=onceover datasource=rubygems
ENV RUBYGEM_ONCEOVER=${RUBYGEM_ONCEOVER:-5.0.2}
# renovate: depName=openfact datasource=rubygems
ENV RUBYGEM_OPENFACT=${RUBYGEM_OPENFACT:-5.3.0}
# renovate: depName=openvox datasource=rubygems
ENV RUBYGEM_OPENVOX=${RUBYGEM_OPENVOX:-8.24.2}
# renovate: depName=puppet-ghostbuster datasource=rubygems
ENV RUBYGEM_PUPPET_GHOSTBUSTER=${RUBYGEM_PUPPET_GHOSTBUSTER:-2.0.0}
# renovate: depName=puppet-metadata datasource=rubygems
ENV RUBYGEM_PUPPET_METADATA=${RUBYGEM_PUPPET_METADATA:-6.0.0}
# renovate: depName=r10k datasource=rubygems
ENV RUBYGEM_R10K=${RUBYGEM_R10K:-5.0.2}
# renovate: depName=ra10ke datasource=rubygems
ENV RUBYGEM_RA10KE=${RUBYGEM_RA10KE:-4.5.0}
# renovate: depName=rspec-junit-formatter datasource=rubygems
ENV RUBYGEM_RSPEC_JUNIT_FORMATTER=${RUBYGEM_RSPEC_JUNIT_FORMATTER:-0.6.0}
# renovate: depName=rubocop-performance datasource=rubygems
ENV RUBYGEM_RUBOCOP_PERFORMANCE=${RUBYGEM_RUBOCOP_PERFORMANCE:-1.23.0}
# renovate: depName=voxpupuli-acceptance datasource=rubygems
ENV RUBYGEM_VOXPUPULI_ACCEPTANCE=${RUBYGEM_VOXPUPULI_ACCEPTANCE:-4.3.0}
# renovate: depName=voxpupuli-release datasource=rubygems
ENV RUBYGEM_VOXPUPULI_RELEASE=${RUBYGEM_VOXPUPULI_RELEASE:-5.1.0}
# renovate: depName=voxpupuli-test datasource=rubygems
ENV RUBYGEM_VOXPUPULI_TEST=${RUBYGEM_VOXPUPULI_TEST:-13.2.0}
# renovate: depName=webmock datasource=rubygems
ENV RUBYGEM_WEBMOCK=${RUBYGEM_WEBMOCK:-3.26.1}

COPY voxbox/Gemfile /

RUN apk update \
    && apk upgrade \
    && apk add --no-cache --update alpine-sdk yaml-dev \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/bundler-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/default/bundler-*.gemspec \
    && gem install bundler -v ${RUBYGEM_BUNDLER} \
    && bundle config set path.system true \
    && bundle config set jobs $(nproc) \
    && bundle install --gemfile=/Gemfile \
    && bundle clean --force \
    && rm -rf /usr/local/lib/ruby/gems/*/cache/* \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/cgi-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/default/cgi-*.gemspec \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/stringio-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/default/stringio-*.gemspec \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/rdoc-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/default/rdoc-*.gemspec \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/racc-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/default/racc-*.gemspec \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/drb-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/default/drb-*.gemspec \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/csv-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/default/csv-*.gemspec \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/minitest-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/minitest-*.gemspec \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/base64-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/default/base64-*.gemspec \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/bigdecimal-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/default/bigdecimal-*.gemspec

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

RUN apk update \
    && apk upgrade \
    && apk add --no-cache openssh-client \
    && apk add --no-cache gpg \
    && apk add --no-cache jq \
    && apk add --no-cache yamllint \
    && apk add --no-cache git \
    && apk add --no-cache curl \
    && rm -rf /usr/local/lib/ruby/gems

COPY --from=builder /usr/local/lib/ruby/gems /usr/local/lib/ruby/gems
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /Gemfile.lock /Gemfile.lock
COPY Containerfile /
COPY voxbox/Rakefile /
COPY voxbox/Gemfile /

WORKDIR /repo

ENTRYPOINT [ "rake", "-f", "/Rakefile" ]
CMD [ "-T" ]
