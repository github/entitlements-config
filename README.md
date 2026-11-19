# entitlements-config 📜

entitlements-config is an example of using [entitlements-app](https://github.com/github/entitlements-app) to manage a set of configuration.

This repository is meant to be read-only for its various examples. You should clone this repo as your own to make any changes.

## entitlements-app configuration 🗒️

Example entitlements-app configuration can be found in [`config/entitlements.yaml`](config/entitlements.yaml)

## entitlements files 📂

Example entitlements files can be found in [`entitlements/`](entitlements/)

## GitHub Actions 🚀

An example of deployment and manager review GitHub Actions can be found in [`.github/workflows`](.github/workflows)

This project uses the [`github/branch-deploy`](https://github.com/github/branch-deploy) Action for authorized IssueOps commands. Deployments are restricted to the current trusted `main` commit: comment `.deploy main` on a pull request to redeploy `main`, or `.noop main` to bootstrap without deploying. Bare `.deploy` and `.noop` commands targeting PR branches are rejected, so untrusted pull request code never runs in the privileged workflow. Lock, unlock, help, and lock-info commands remain available.

Changes are deployed after merging to `main` by the existing [deployment workflow](.github/workflows/deploy.yml). Protect `main` with appropriate review and branch-protection rules.

## Examples 📸

The scripts which the example Actions run can be found in [`examples/`](examples/)
