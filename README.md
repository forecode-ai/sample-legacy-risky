# sample-legacy-risky

Part of the ForeCode test estate. Not a real product. **Do not copy these pipelines.**

An old pipeline with deliberate guardrail violations, for testing ForeCode's guardrails, remediation and change gate:

| Violation | Where |
|---|---|
| Actions pinned to a tag or branch, not a commit | `deploy.yml` |
| No `permissions:` block (default token permissions) | `deploy.yml` |
| Download piped into a shell | `deploy.yml`, install step |
| Environment printed; command tracing in a step that uses a secret | `deploy.yml`, debug step |
| A secret echoed into the log | `deploy.yml`, deploy step |
| Production deploy with no environment, so no approval | `deploy.yml`, `deploy-prod` job |
| No tests before deploying | `deploy.yml` |
| Deploy over SSH (a deprecated deploy method in the test policies) | `deploy.yml` |
| `pull_request_target` checking out the pull request's code | `label-pr.yml` |

Made safe on purpose: the repository has no secrets; deploys are simulated (`.github/simulate.sh`); `label-pr.yml` has
an empty token, its job never runs (its condition is always false) and the workflow is disabled.

Scope comes from repository topics only (`team-legacy`, `dept-platform`, `env-prod`): no team has access and there is
no CODEOWNERS file.
