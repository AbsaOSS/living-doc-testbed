# =============================================================================
# LIVING DOC — FUNC-012 · Loan Detail Page - Show Renewal History
# =============================================================================
# status:    planned
# parent:    FEAT-004
# func_type: visibility
#
# acceptance_criteria:
#
#   AC:FUNC-012-01 (v1.2.0 - planned)
#     - A loan that has been renewed shows the date of each renewal.
# =============================================================================

@FUNC_ID:FUNC-012
@domain_loans
Feature: Loan Detail Page - Show Renewal History
  Lists when a loan was renewed.

  # AC:FUNC-012-01 (v1.2.0 - planned) - each renewal of a loan shows its date
  @AC:FUNC-012-01
  Scenario: A renewed loan lists the date of each renewal
    Given the member renewed "Dune" on 2026-11-02 and on 2026-11-16
    When the member opens the loan detail page for "Dune"
    Then the renewal history lists 2026-11-02 and 2026-11-16
