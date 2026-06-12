# AGENTS.md

## Scope

These instructions apply to the entire `container-voxbox` repository.

VoxBox is a multi-architecture container image for testing Vox Pupuli
OpenVox/Puppet modules. Keep changes focused on the container image, its bundled
Ruby tools, the `evb` helper, documentation, or the workflows that build and
publish the image.

## Repository layout

- `Containerfile`: multi-stage Alpine/Ruby image build and pinned tool versions.
- `voxbox/Gemfile`: gems installed into `/opt/voxbox/vendor/bundle`.
- `voxbox/Rakefile`: Rake tasks exposed by the container entrypoint.
- `build_platforms.yaml`: CI matrix and OpenVox release/version metadata.
- `evb`: Bash helper for running VoxBox with Podman or Docker.
- `.github/workflows/ci.yaml`: authoritative image build and functional test
  sequence.
- `README.md`: user-facing behavior, usage examples, breaking changes, and
  release instructions.

The root `Gemfile` and `Rakefile` support release/changelog maintenance. They
are not the bundle or Rakefile copied into the runtime image.

## Working rules

- Read `CONTRIBUTING.md` before making changes and follow the Vox Pupuli Code of
  Conduct and the OpenVox AI Usage Policy.
- Make the smallest coherent change needed. Do not mix unrelated refactoring
  with a bug fix or feature.
- Add or update tests when changing behavior. Documentation-only changes and
  pure refactoring do not require new tests.
- Update `README.md` when a change affects image contents, commands, usage,
  compatibility, or other user-visible behavior.
- Preserve Unix line endings and avoid trailing whitespace, commented-out
  code, generated artifacts, and unrelated formatting churn.
- Keep Renovate annotations directly associated with the dependency they track.
- Keep versions in `Containerfile`, `voxbox/Gemfile`, and
  `build_platforms.yaml` consistent where they describe the same component.
- Do not edit files marked `Managed by modulesync - DO NOT EDIT` unless the
  task explicitly requires changing generated modulesync output. Prefer making
  such changes in the source configuration repository.
- Do not change image tags, registry targets, release automation, or
  multi-architecture publishing behavior without checking all dependent
  workflows.

## AI-assisted contributions

- A human contributor must remain involved, review the complete change, and
  take responsibility for its quality, utility, and license compliance.
- Do not present generated work as reviewed or understood. The human
  contributor must understand every part of the submission and be able to
  discuss it during review.
- Do not operate as a fully autonomous contributor. Leave final review,
  certification, commit approval, and submission decisions to the human.
- Never add a `Signed-off-by` trailer. Only the human contributor may certify
  the Developer Certificate of Origin.
- When AI created any significant part of a change, tell the human contributor
  that disclosure is required. The commit should contain an appropriate
  attribution trailer, for example:

  ```text
  Assisted-by: Codex:MODEL_VERSION
  ```

- The pull request must also disclose significant AI use and briefly describe
  how AI contributed. Routine spelling or grammar correction does not require
  disclosure.
- Do not assume generated code is license-compatible. Prefer existing project
  code and established dependencies over generating a new implementation, and
  flag uncertain provenance or licensing for human review.
- Prefer collaboration with and extension of existing projects over creating
  new tools that duplicate existing functionality.

## Validation

Run the checks relevant to the files changed.

For all changes:

```sh
git diff --check
```

For Markdown changes, use the same linter configuration as CI:

```sh
markdownlint-cli2 '**/*.md'
```

For changes to `evb` or other shell scripts:

```sh
shellcheck evb
```

For container, bundled gem, Rake task, or platform-matrix changes, build the
image and exercise the same commands used by `.github/workflows/ci.yaml`.
Replace the platform if the host cannot build `linux/amd64`:

```sh
docker build --platform linux/amd64 -t ci/voxbox:local -f Containerfile .
git clone https://github.com/voxpupuli/puppet-example.git /tmp/puppet-example
docker run --rm -v /tmp/puppet-example:/repo:Z ci/voxbox:local
docker run --rm -v /tmp/puppet-example:/repo:Z ci/voxbox:local lint
docker run --rm -v /tmp/puppet-example:/repo:Z ci/voxbox:local metadata_lint
docker run --rm -v /tmp/puppet-example:/repo:Z ci/voxbox:local r10k:dependencies
docker run --rm -v /tmp/puppet-example:/repo:Z ci/voxbox:local r10k:syntax
docker run --rm -v /tmp/puppet-example:/repo:Z ci/voxbox:local rubocop
docker run --rm -v /tmp/puppet-example:/repo:Z ci/voxbox:local spec
docker run --rm -v /tmp/puppet-example:/repo:Z ci/voxbox:local strings:validate:reference
docker run --rm -v /tmp/puppet-example:/repo:Z ci/voxbox:local syntax
docker run --rm --entrypoint=ash ci/voxbox:local -c 'bundle check'
```

Podman may be used instead of Docker. Report any checks that could not be run
and why.

## Commits and pull requests

- Work on a topic branch and keep commits as logical units.
- Write commit subjects in imperative present tense. Keep the subject concise,
  omit the final full stop, and explain motivation and previous behavior in
  the body when useful.
- Every contributed commit requires a Developer Certificate of Origin sign-off,
  but only the human contributor may add it:

  ```sh
  git commit --signoff
  ```

- For significant AI assistance, include an attribution trailer distinct from
  the human-only `Signed-off-by` trailer and disclose the assistance in the
  pull request.
- Rebase on the current default branch before submitting a pull request.
- Ensure required GitHub Actions pass, include documentation and tests where
  applicable, and reference related issues.
