# How to make a release

## On a fork

Initiate a Release Pull Request (PR). Ensure that the release branch includes the version in its name, as this will be utilized as the `future_version` for the GitHub changelog generator.

See Rakefile

```ruby
    config.future_release = `git rev-parse --abbrev-ref HEAD`.strip.split('-', 2).last
```

Do the following:

```shell
export RELEASE_VERSION="X.Y.Z"
git switch main
git pull -r
git switch -c release-v$RELEASE_VERSION

bundle config set --local path vendor/bundle
bundle config set --local with 'release'
bundle install

CHANGELOG_GITHUB_TOKEN="token_MC_tokenface" bundle exec rake changelog

git commit -am "Release v${RELEASE_VERSION}"
git push origin release-v$RELEASE_VERSION
```

## After the merge, as a maintainer on upstream

```shell
git switch main
git pull -r
git tag v$RELEASE_VERSION -m "v$RELEASE_VERSION"
git push --tags
```
