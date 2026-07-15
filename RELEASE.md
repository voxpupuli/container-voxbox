<!-- Managed by modulesync - DO NOT EDIT -->
<!-- https://voxpupuli.org/docs/updating-files-managed-with-modulesync/ -->
# Release

VoxBox container releases use semantic versions starting at `10.0.0`.
The Git tag must use the `vX.Y.Z` form; the image tags combine that version with the OpenVox flavor.
For example, Git tag `v10.1.2` publishes `10.1.2-openvox8` and `10.1.2-openvox8.28.0`.
Only the highest released semantic version updates the `latest` image tag.

## On a fork

Please follow these instructions carefully.
Ensure that you name the branch precisely as `release-vX.Y.Z`
since this nomenclature is crucial for obtaining the `future_version` in the changelog.
Your attention to this specific branch naming convention is essential for accurate version tracking in the changelog.

```shell
export RELEASE_VERSION="X.Y.Z"
git switch main
git pull --rebase
git switch --create release-v$RELEASE_VERSION

bundle config set --local path vendor/bundle
bundle config set --local with 'release'
bundle install

CHANGELOG_GITHUB_TOKEN="token_MC_tokenface" bundle exec rake changelog

git commit --all --signoff --sign --message "Release v${RELEASE_VERSION}"
git push --set-upstream origin HEAD
```

Then open a PR, discuss and merge.

## After the merge, as a maintainer on upstream

```shell
git switch main
git pull --rebase
git tag v$RELEASE_VERSION --sign --message "v$RELEASE_VERSION"
git push --tags
```
