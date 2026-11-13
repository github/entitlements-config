# entitlements-config 📜

entitlements-config is an example of using [entitlements-app](https://github.com/github/entitlements-app) to manage a set of configuration.

This repository is meant to be read-only for its various examples. You should clone this repo as your own to make any changes.

## entitlements-app configuration 🗒️

Example entitlements-app configuration can be found in [`config/entitlements.yaml`](config/entitlements.yaml)

## entitlements files 📂

Example entitlements files can be found in [`entitlements/`](entitlements/)

## GitHub Actions 🚀

An example of deployment and manager review GitHub Actions can be found in [`.github/workflows`](.github/workflows)

Pull requests run [PR validation](.github/workflows/pr-validation.yml) with read-only repository permissions and no deployment secrets. Validation runs `script/deploy --noop` against a local LDAP fixture and uploads a PR-number artifact. The separate [results workflow](.github/workflows/pr-results.yml) validates that artifact against the originating run and current PR before posting a comment for same-repository PRs. It never checks out or executes PR code.

This project uses the [`github/branch-deploy`](https://github.com/github/branch-deploy) Action for authorized IssueOps commands. Deployments are restricted to the current trusted `main` commit: comment `.deploy main` on a pull request to deploy it, or `.noop main` to bootstrap without deploying. Bare `.deploy` and `.noop` commands targeting PR branches are rejected. Lock, unlock, help, and lock-info commands remain available.

Changes are deployed after merging to `main` by the existing [deployment workflow](.github/workflows/deploy.yml). Protect `main` with appropriate review and branch-protection rules. The two new workflows must be present on the default branch before cross-workflow result reporting can run.

## Examples 📸

The scripts which the example Actions run can be found in [`examples/`](examples/)
