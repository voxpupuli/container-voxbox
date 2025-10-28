ARG BASE_IMAGE=docker.io/ruby:3.4-alpine

FROM $BASE_IMAGE AS builder

# Gems have to be ARG and ENV because they are used as reference in the Gemfile
ARG RUBYGEM_BUNDLER
ARG RUBYGEM_MODULESYNC
ARG RUBYGEM_ONCEOVER
ARG RUBYGEM_OPENFACT
ARG RUBYGEM_OPENVOX
ARG RUBYGEM_HIERA_EYAML
ARG RUBYGEM_PUPPET_GHOSTBUSTER
ARG RUBYGEM_PUPPET_METADATA
ARG RUBYGEM_R10K
ARG RUBYGEM_RA10KE
ARG RUBYGEM_RSPEC_JUNIT_FORMATTER
ARG RUBYGEM_RUBOCOP_PERFORMANCE
ARG RUBYGEM_VOXPUPULI_ACCEPTANCE
ARG RUBYGEM_VOXPUPULI_RELEASE
ARG RUBYGEM_VOXPUPULI_TEST
ARG RUBYGEM_LIBRARIAN_PUPPET

ENV RUBYGEM_BUNDLER=${RUBYGEM_BUNDLER:-2.7.2}
ENV RUBYGEM_MODULESYNC=${RUBYGEM_MODULESYNC:-4.2.0}
ENV RUBYGEM_ONCEOVER=${RUBYGEM_ONCEOVER:-5.0.2}
ENV RUBYGEM_OPENFACT=${RUBYGEM_OPENFACT:-5.1.0}
ENV RUBYGEM_OPENVOX=${RUBYGEM_OPENVOX:-8.23.1}
ENV RUBYGEM_HIERA_EYAML=${RUBYGEM_HIERA_EYAML:-4.3.0}
ENV RUBYGEM_PUPPET_GHOSTBUSTER=${RUBYGEM_PUPPET_GHOSTBUSTER:-2.0.0}
ENV RUBYGEM_PUPPET_METADATA=${RUBYGEM_PUPPET_METADATA:-5.3.0}
ENV RUBYGEM_R10K=${RUBYGEM_R10K:-5.0.2}
ENV RUBYGEM_RA10KE=${RUBYGEM_RA10KE:-4.5.0}
ENV RUBYGEM_RSPEC_JUNIT_FORMATTER=${RUBYGEM_RSPEC_JUNIT_FORMATTER:-0.6.0}
ENV RUBYGEM_RUBOCOP_PERFORMANCE=${RUBYGEM_RUBOCOP_PERFORMANCE:-1.23.0}
ENV RUBYGEM_VOXPUPULI_ACCEPTANCE=${RUBYGEM_VOXPUPULI_ACCEPTANCE:-4.1.0}
ENV RUBYGEM_VOXPUPULI_RELEASE=${RUBYGEM_VOXPUPULI_RELEASE:-5.0.1}
ENV RUBYGEM_VOXPUPULI_TEST=${RUBYGEM_VOXPUPULI_TEST:-13.1.0}
ENV RUBYGEM_LIBRARIAN_PUPPET=${RUBYGEM_LIBRARIAN_PUPPET:-5.1.0}

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
    && rm -rf /usr/local/lib/ruby/gems/*/gems/rexml-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/rexml-*.gemspec \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/racc-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/default/racc-*.gemspec \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/drb-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/default/drb-*.gemspec \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/csv-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/default/csv-*.gemspec \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/minitest-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/minitest-*.gemspec

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

ENTRYPOINT [ "rake" ]
CMD [ "-f", "/Rakefile", "-T" ]
