# Library Loans

The member-facing web app of a public library. Residents join online, and members search the catalogue,
borrow available books and manage their loans instead of queuing at the desk.

- **Current release:** v1.0.0. Renewing a loan is in review for v1.1.0; email reminders, an overdue badge and
  a renewal history are planned for v1.2.0.
- **Retiring in v2.0.0:** the printable loan slip, sorting by popularity and desk registration.
- **Teams:** Discovery Team (catalogue search), Lending Team (loans), Membership Team (sign-up), Finance Team
  (fines).

## Tests

End-to-end tests are Playwright with Gherkin scenarios. Each PageObject and each User Story and Functionality
feature file opens with a living-doc header.

| Path | Holds |
|---|---|
| `tests/e2e/pages/` | PageObjects, one per screen; the sign-up wizard has one per step |
| `tests/e2e/features/liv_doc_us/` | User Story feature files |
| `tests/e2e/features/liv_doc_func/` | Functionality feature files |
| `tests/e2e/features/smoke/` | Post-deployment smoke checks, not living documentation |
