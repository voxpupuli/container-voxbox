ARG BASE_IMAGE=ruby:2.7.8

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

COPY voxbox/Gemfile /
COPY Dockerfile /

RUN apt update && apt upgrade -y \
    && apt autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && bundle config set path.system true \
    && bundle install --gemfile=/Gemfile

WORKDIR /repo

ENTRYPOINT [ "rake" ]
CMD [ "-T" ]
