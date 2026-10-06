# =============================================================================
# LIVING DOC — FUNC-009 · My Loans Page - Loan List States
# =============================================================================
# status:    active
# parent:    FEAT-002
# func_type: component_state
#
# acceptance_criteria:
#
#   AC:FUNC-009-01 (v1.0.0 - active)
#     - A member with loans sees one row per loan with its title and due date.
#
#   AC:FUNC-009-02 (v1.0.0 - active)
#     - A member with no loans sees "You have no books on loan" and a link to
#       the catalogue.
# =============================================================================

@FUNC_ID:FUNC-009
@domain_loans
Feature: My Loans Page - Loan List States

  # AC:FUNC-009-01 (v1.0.0 - active) - one row per loan with title and due date
  @AC:FUNC-009-01
  Scenario: Member with loans sees their loans
    Given the member has borrowed "The Hobbit" and "Dune"
    When the member opens the My Loans page
    Then two loans are listed, each with its title and due date

  # AC:FUNC-009-02 (v1.0.0 - active) - an empty list says so and links to the catalogue
  @AC:FUNC-009-02
  Scenario: Member without loans sees the empty state
    Given the member has no loans
    When the member opens the My Loans page
    Then "You have no books on loan" is shown with a link to the catalogue
