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

Smoke scenarios and project README files are not collector inputs.

## Pipeline outputs

The workflow collects source data, normalizes documentation and UI tests, builds the coverage matrix, and
renders three Markdown documents. Every event uploads an artifact named
`living-documentation-<event>-<run-id>` containing:

| File | Purpose |
| --- | --- |
| `technical-project.md` | Technical project documentation |
| `ui-test-catalog.md` | Collected UI scenarios |
| `coverage-matrix.md` | Rendered documentation-to-test coverage |
| `coverage-matrix.json` | Structured coverage data |

For a release, these four files are also attached to the published GitHub Release. Manual dispatch accepts
`inner` and `release` views. The UI test catalog remains in the `inner` view because test normalization
does not take a view input.

## Launchers

| Launcher | When it runs | Expected result |
| --- | --- | --- |
| Pull request | Opened, synchronized, or reopened for `master` or `support/*`, when a source, workflow, or this guide changes | Generation succeeds and the four-file artifact is available for review |
| Push | Every push to `master` or `support/*` | Generation succeeds and the four-file artifact is available |
| Manual dispatch | On demand, with `view=inner` or `view=release` | Generation succeeds with the selected documentation view and a four-file artifact |
| Published release | When a GitHub Release is published | Generation succeeds, the four-file artifact is available, and all four release assets are attached |

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

- **Pull request:** open or update a PR with a change under one of the source paths or to the workflow/guide. Confirm the check runs. An unrelated-file-only PR should not start this workflow.
- **Push:** after the workflow is on the default branch, push or merge a change to `master` or `support/*`; confirm an `event=push` run and artifact.
- **Manual dispatch:** after the workflow is on the default branch, test both input values:

  ```sh
  gh workflow run living-documentation.yml --repo AbsaOSS/living-doc-testbed -f view=inner
  gh workflow run living-documentation.yml --repo AbsaOSS/living-doc-testbed -f view=release
  ```

  Confirm each run's artifact and that the documentation view matches the selected input.
- **Published release:** use the normal release process. Confirm both workflow jobs succeed, then inspect the release assets with `gh release view <tag> --repo AbsaOSS/living-doc-testbed --json assets`.

Do not mark a launcher verified from workflow syntax alone. The new workflow must be available on the
default branch before dispatch, push, and release runs can provide runtime evidence.
