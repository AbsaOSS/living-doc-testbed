# living-doc-testbed

A simulated real project for [Living Documentation](https://github.com/AbsaOSS/living-doc). Each project
here looks like a team's repository that has adopted living doc: PageObjects and `.feature` files carrying
living-doc headers, and nothing else of living doc. The integration tests in `living-doc` read this repository
the way living doc reads any repository, and check that the pipeline handles it cleanly.

## Rules

- **Fixture sources stay canonical.** The Living Doc workflow collects these sources but does not modify
  them. Generated documents are workflow artifacts and release assets, never committed output.
- **Every project follows the canon 100 %.** Headers, tags and scenarios are written to the canon on
  `living-doc` `master`. Problem cases are not authored here; `living-doc` derives them from a copy.
- **`master` is read directly** by `living-doc`'s integration tests, so every merge must keep it canon-clean.
- **One project per folder** under `projects/`, **one documentation source per project**.

## Projects

| Project | Documentation source | What it is |
|---|---|---|
| [`core`](projects/core/README.md) | source headers: PageObjects and `.feature` files | A library-loans web app: online sign-up, catalogue search, borrowing and renewing loans. |

## Generation pipeline

The [Living Doc generation workflow](.github/workflows/living-documentation.yml) collects the `core`
project sources and publishes generated output as CI artifacts and release assets. See the
[generation guide](docs/living-doc-generation.md) for source paths, outputs, launchers, and verification.
