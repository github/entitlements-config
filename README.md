# entitlements-config 📜

entitlements-config is an example of using [entitlements-app](https://github.com/github/entitlements-app) to manage a set of configuration.

This repository is meant to be read-only for its various examples. You should clone this repo as your own to make any changes.

## Dependency sources

`entitlements-app` must be explicitly declared in the GitHub Packages source
block in `Gemfile` and locked to that source in `Gemfile.lock`. Keep these
declarations when updating dependencies to prevent resolution through public
RubyGems. Other gems continue to use RubyGems.org.

Bootstrap uses the checked-in `vendor/cache` with `bundle install --local`.
When refreshing the cache, fetch `entitlements-app` from the approved GitHub
Packages registry using credentials with `read:packages`; do not commit credentials.

## entitlements-app configuration 🗒️

Example entitlements-app configuration can be found in [`config/entitlements.yaml`](config/entitlements.yaml)

## entitlements files 📂

Example entitlements files can be found in [`entitlements/`](entitlements/)

## GitHub Actions 🚀

An example of deployment and manager review GitHub Actions can be found in [`.github/workflows`](.github/workflows)

This project uses the [`github/branch-deploy`](https://github.com/github/branch-deploy) Action to facilitate deployments. The `branch-deploy` Action is used to "branch deploy" pull requests to a given environment (in this case production) so that changes can be previewed before merging.

Here is an [example pull request](https://github.com/github/entitlements-config/pull/30) showing how you can easily deploy changes by commenting `.deploy` on a pull request.

Branch-deploy commands are limited to comments from repository owners,
organization members, or repository collaborators. The `branch-deploy` Action
also requires write or admin permission and disallows fork deployments. Bots
without an allowed author association cannot trigger these commands. The
checkout uses the Action-selected commit SHA and does not persist Git credentials.

## Examples 📸

The scripts which the example Actions run can be found in [`examples/`](examples/)
