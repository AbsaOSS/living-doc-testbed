# Living Doc generation

This repository's workflow collects the `core` project's Living Doc headers and UI scenarios, then
generates the technical project, UI test catalog, and coverage matrix. [AUL PR #6534](https://github.com/absa-group/AUL/pull/6534)
is an inspiration for the pipeline shape only; this workflow uses the testbed's own project ID and source
paths.

Generated documents are not committed. Each run uploads them as a workflow artifact, and a published
release also receives the same files as release assets.

## Sources

| Data | Source | Collected as |
| --- | --- | --- |
| User Story headers and scenarios | `projects/core/tests/e2e/features/liv_doc_us/` | Documentation source and UI tests |
| Functionality headers and scenarios | `projects/core/tests/e2e/features/liv_doc_func/` | Documentation source and UI tests |
| PageObject headers | `projects/core/tests/e2e/pages/` | Documentation source |
| Smoke scenarios | `projects/core/tests/e2e/features/smoke/` | UI tests only: mined as UI tests, but not living documentation |

Project README files are not collector inputs.

## Pipeline outputs

The workflow collects source data, normalizes documentation and UI tests, builds the coverage matrix, and
renders three Markdown documents, all in one documentation view. Every event uploads an artifact named
`living-documentation-<event>-<run-id>` containing:

| File | Purpose |
| --- | --- |
| `technical-project-<view>.md` | Technical project documentation |
| `ui-test-catalog-<view>.md` | Collected UI scenarios |
| `coverage-matrix-<view>.md` | Rendered documentation-to-test coverage |
| `coverage-matrix.json` | Structured coverage data |

`<view>` is `inner` in the inner view, and `release-v<version>` in the release view, for example
`technical-project-release-v0.2.0.md` or `technical-project-release-v0.3.0rc1.md` ([Views](#views)). For a
release, these four files are also attached to the published GitHub Release.

## Views

The workflow's first step resolves the view and the release version once; every toolkit and generator step
uses them, and the file names carry them.

| Event | View | Release version |
| --- | --- | --- |
| Pull request, push | `inner` | none |
| Manual dispatch | the `view` input | the `release-version` input, required when `view` is `release` |
| Published release | `release` | the release's tag |

- A release version is a release's `X.Y.Z` or a release candidate's `X.Y.ZrcN`, with or without a leading `v`;
  `0.3.0` and `v0.3.0` both name the files `release-v0.3.0`, and `v0.3.0rc1` names them `release-v0.3.0rc1`
- A release view without a release version, or with one in another form, fails the first step, before
  anything is collected
- The UI test catalog follows the view too: the release view drops the links to `planned` and `in_review`
  criteria

## Launchers

| Launcher | When it runs | Expected result |
| --- | --- | --- |
| Pull request | Opened, synchronized, or reopened for `master` or `support/*`, when the workflow file or a file under one of the [source](#sources) paths changes | Generation succeeds and the four-file artifact is available for review |
| Push | Every push to `master` or `support/*` | Generation succeeds and the four-file artifact is available |
| Manual dispatch | On demand, with `view=inner`, or `view=release` and a `release-version` | Generation succeeds with the selected documentation view and a four-file artifact |
| Published release | When a GitHub Release is published, a release candidate's pre-release included | Generation succeeds, the four-file artifact is available, and all four release assets are attached |

## Verification

Verify each launcher against a run of this repository's workflow; a run in another repository is not
evidence. Record the event, branch or release tag, Actions run URL, artifact name, and (for releases) asset
names. `gh run view <run-id> --repo AbsaOSS/living-doc-testbed` shows job and step results. Artifact
contents can be checked without adding generated files to the checkout:

```sh
tmpdir="$(mktemp -d)"
gh run download <run-id> --repo AbsaOSS/living-doc-testbed \
  --name living-documentation-<event>-<run-id> --dir "$tmpdir"
find "$tmpdir" -type f
```

Launcher-specific checks:

- **Pull request:** open or update a PR with a change to the workflow file or under one of the source paths. Confirm the check runs. A PR that changes only other files, this guide included, should not start this workflow.
- **Push:** after the workflow is on the default branch, push or merge a change to `master` or `support/*`; confirm an `event=push` run and artifact.
- **Manual dispatch:** after the workflow is on the default branch, test both input values:

  ```sh
  gh workflow run living-documentation.yml --repo AbsaOSS/living-doc-testbed -f view=inner
  gh workflow run living-documentation.yml --repo AbsaOSS/living-doc-testbed -f view=release -f release-version=v0.0.0
  ```

  Confirm each run's artifact and that the documentation view matches the selected input: `*-inner.md` for
  `inner`, `*-release-v0.0.0.md` for `release`. Use a version no real release has, so a test run's files are
  not mistaken for a release's. A `view=release` run without `release-version` fails at its first step.
- **Published release:** use the normal release process. Confirm both workflow jobs succeed, then inspect the release assets with `gh release view <tag> --repo AbsaOSS/living-doc-testbed --json assets`.

Do not mark a launcher verified from workflow syntax alone. The new workflow must be available on the
default branch before dispatch, push, and release runs can provide runtime evidence.
