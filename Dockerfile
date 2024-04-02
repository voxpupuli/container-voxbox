ARG BASE_IMAGE=ghcr.io/betadots/ruby:2.7.8-focal

FROM $BASE_IMAGE

LABEL org.label-schema.maintainer="Voxpupuli Team <info@voxpupuli.org>" \
      org.label-schema.vendor="Voxpupuli" \
      org.label-schema.url="https://github.com/voxpupuli/container-voxbox" \
      org.label-schema.name="Vox Pupuli Test Box" \
      org.label-schema.license="AGPL-3.0-or-later" \
      org.label-schema.vcs-url="https://github.com/voxpupuli/container-voxbox" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.dockerfile="/Dockerfile"

ARG RUBYGEM_PUPPET
ENV RUBYGEM_PUPPET=${RUBYGEM_PUPPET:-7.29.1}

ARG RUBYGEM_FACTER
ENV RUBYGEM_FACTER=${RUBYGEM_FACTER:-4.6.1}

ARG RUBYGEM_VOXPUPULI_TEST
ENV RUBYGEM_VOXPUPULI_TEST=${RUBYGEM_VOXPUPULI_TEST:-7.1.0}

ARG RUBYGEM_VOXPUPULI_ACCEPTANCE
ENV RUBYGEM_VOXPUPULI_ACCEPTANCE=${RUBYGEM_VOXPUPULI_ACCEPTANCE:-3.0.0}

ARG RUBYGEM_VOXPUPULI_RELEASE
ENV RUBYGEM_VOXPUPULI_RELEASE=${RUBYGEM_VOXPUPULI_RELEASE:-3.0.1}

ARG RUBYGEM_PUPPET_METADATA
ENV RUBYGEM_PUPPET_METADATA=${RUBYGEM_PUPPET_METADATA:-3.6.0}

ARG RUBYGEM_MODULESYNC
ENV RUBYGEM_MODULESYNC=${RUBYGEM_MODULESYNC:-3.2.0}

ARG RUBYGEM_R10K
ENV RUBYGEM_R10K=${RUBYGEM_R10K:-4.0.2}

ARG RUBYGEM_RA10KE
ENV RUBYGEM_RA10KE=${RUBYGEM_RA10KE:-3.0.0}

ARG RUBYGEM_RUBOCOP_PERFORMANCE
ENV RUBYGEM_RUBOCOP_PERFORMANCE=${RUBYGEM_RUBOCOP_PERFORMANCE:-1.21.0}

COPY voxbox/Gemfile /
COPY voxbox/Rakefile /
COPY Dockerfile /

RUN apt-get update && apt-get upgrade -y \
    && apt-get purge -y "libaom*" \
    && apt-get autoremove -y \
    && apt-get clean \
    && bundle config set path.system true \
    && bundle config set jobs $(nproc) \
    && bundle install --gemfile=/Gemfile \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /usr/local/lib/ruby/gems/*/cache/* \
    && rm -rf /usr/local/lib/ruby/gems/2.7.0/specifications/default/cgi-0.1.0.2.gemspec

WORKDIR /repo

ENTRYPOINT [ "rake" ]
CMD [ "-f", "/Rakefile", "-T" ]
