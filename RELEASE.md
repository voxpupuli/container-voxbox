# How to make a release

Initiate a Release Pull Request (PR). Ensure that the release branch includes the version in its name, as this will be utilized as the `future_version` for the GitHub changelog generator.

See Rakefile

```ruby
    config.future_release = `git rev-parse --abbrev-ref HEAD`.strip.split('-', 2).last
```

On a fork create a release PR:

```shell
git switch main
git pull -r
git switch -c release-vX.Y.Z

bundle config set --local path vendor/bundle
bundle config set --local with 'release'
bundle install

CHANGELOG_GITHUB_TOKEN="token_MC_tokenface" bundle exec rake changelog

git commit -am 'Release vX.Y.Z'
git push origin release-vX.Y.Z
```

After the merge as a maintainer on origin do:

```shell
git switch main
git pull -r
git tag vX.Y.Z
git push --tags
```
