ARG BASE_IMAGE=docker.io/ruby:3.2.5-alpine3.20

FROM $BASE_IMAGE AS builder

# Gems have to be ARG and ENV because they are used as reference in the Gemfile
ARG RUBYGEM_PUPPET
ENV RUBYGEM_PUPPET ${RUBYGEM_PUPPET:-8.8.1}

ARG RUBYGEM_FACTER
ENV RUBYGEM_FACTER=${RUBYGEM_FACTER:-4.8.0}

ARG RUBYGEM_VOXPUPULI_TEST
ENV RUBYGEM_VOXPUPULI_TEST=${RUBYGEM_VOXPUPULI_TEST:-9.0.0}

ARG RUBYGEM_VOXPUPULI_ACCEPTANCE
ENV RUBYGEM_VOXPUPULI_ACCEPTANCE=${RUBYGEM_VOXPUPULI_ACCEPTANCE:-3.2.0}

ARG RUBYGEM_VOXPUPULI_RELEASE
ENV RUBYGEM_VOXPUPULI_RELEASE=${RUBYGEM_VOXPUPULI_RELEASE:-3.1.0}

ARG RUBYGEM_PUPPET_METADATA
ENV RUBYGEM_PUPPET_METADATA=${RUBYGEM_PUPPET_METADATA:-4.2.0}

ARG RUBYGEM_MODULESYNC
ENV RUBYGEM_MODULESYNC=${RUBYGEM_MODULESYNC:-3.2.0}

ARG RUBYGEM_R10K
ENV RUBYGEM_R10K=${RUBYGEM_R10K:-4.1.0}

ARG RUBYGEM_RA10KE
ENV RUBYGEM_RA10KE=${RUBYGEM_RA10KE:-3.1.0}

ARG RUBYGEM_RUBOCOP_PERFORMANCE
ENV RUBYGEM_RUBOCOP_PERFORMANCE=${RUBYGEM_RUBOCOP_PERFORMANCE:-1.21.1}

ARG RUBYGEM_BUNDLER
ENV RUBYGEM_BUNDLER=${RUBYGEM_BUNDLER:-2.5.18}

COPY voxbox/Gemfile /

RUN apk update \
    && apk upgrade \
    && apk add --no-cache --update alpine-sdk \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/bundler-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/default/bundler-*.gemspec \
    && gem install bundler -v ${RUBYGEM_BUNDLER} \
    && bundle config set path.system true \
    && bundle config set jobs $(nproc) \
    && bundle install --gemfile=/Gemfile \
    && rm -rf /usr/local/lib/ruby/gems/*/cache/* \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/cgi-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/default/cgi-*.gemspec \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/stringio-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/default/stringio-*.gemspec \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/rdoc-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/default/rdoc-*.gemspec \
    && rm -rf /usr/local/lib/ruby/gems/2.7.0/gems/default/rexml-* \
    && rm -rf /usr/local/lib/ruby/gems/2.7.0/specifications/default/rexml-*.gemspec \
    && rm -rf /usr/local/lib/ruby/gems/*/gems/rexml-* \
    && rm -rf /usr/local/lib/ruby/gems/*/specifications/rexml-*.gemspec

###############################################################################

FROM $BASE_IMAGE AS final

LABEL org.label-schema.maintainer="Voxpupuli Team <voxpupuli@groups.io>" \
      org.label-schema.vendor="Voxpupuli" \
      org.label-schema.url="https://github.com/voxpupuli/container-voxbox" \
      org.label-schema.name="Vox Pupuli Test Box" \
      org.label-schema.license="AGPL-3.0-or-later" \
      org.label-schema.vcs-url="https://github.com/voxpupuli/container-voxbox" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.dockerfile="/Dockerfile"

# APKs are not used in any other file, so ARG is sufficient.
ARG APK_JQ=1.7.1-r0
ARG APK_YAMLLINT=1.35.1-r1
ARG APK_GIT=2.45.2-r0
ARG APK_CURL=8.10.1-r0

RUN apk update \
    && apk upgrade \
    && apk add jq=${APK_JQ} \
    && apk add yamllint=${APK_YAMLLINT} \
    && apk add git=${APK_GIT} \
    && apk add curl=${APK_CURL} \
    && rm -rf /var/cache/apk/* \
    && rm -rf /usr/local/lib/ruby/gems

COPY --from=builder /usr/local/lib/ruby/gems /usr/local/lib/ruby/gems
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY Dockerfile /
COPY voxbox/Rakefile /

WORKDIR /repo

ENTRYPOINT [ "rake" ]
CMD [ "-f", "/Rakefile", "-T" ]
