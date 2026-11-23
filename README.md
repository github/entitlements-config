# entitlements-config 📜

entitlements-config is an example of using [entitlements-app](https://github.com/github/entitlements-app) to manage a set of configuration.

This repository is meant to be read-only for its various examples. You should clone this repo as your own to make any changes.

## entitlements-app configuration 🗒️

Example entitlements-app configuration can be found in [`config/entitlements.yaml`](config/entitlements.yaml)

## entitlements files 📂

Example entitlements files can be found in [`entitlements/`](entitlements/)

## GitHub Actions 🚀

An example of deployment and manager review GitHub Actions can be found in [`.github/workflows`](.github/workflows)

Changes are deployed to the `production` environment by the [deployment workflow](.github/workflows/deploy.yml) after a pull request is merged to `main`. Pull request branches are not deployed before merge, so unreviewed code never runs with write permissions. To roll back, revert the pull request. Protect `main` with appropriate review and branch-protection rules.

## Examples 📸

The scripts which the example Actions run can be found in [`examples/`](examples/)
