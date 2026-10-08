# =============================================================================
# LIVING DOC — FUNC-010 · My Loans Page - Total Fines Owed
# =============================================================================
# status:    active
# parent:    FEAT-002
# func_type: calculation
# rationale:
#   - The total is shown on its own, not on payment, so members see what they
#     owe before they come to the desk.
#
# acceptance_criteria:
#
#   AC:FUNC-010-01 (v1.0.0 - active)
#     - The total shown is the sum of the fines on every loan, to the cent.
#
#   AC:FUNC-010-02 (v1.0.0 - active)
#     - A fine that is {fine-state} is left out of the total.
#     - fine-state: paid, waived, written-off
# =============================================================================

@FUNC_ID:FUNC-010
@domain_loans
Feature: My Loans Page - Total Fines Owed
  Adds up the fines a member owes across all loans.

  # AC:FUNC-010-01 (v1.0.0 - active) - the total is the sum of every loan's fine
  @AC:FUNC-010-01
  Scenario: Total fines add up across loans
    Given the member owes 0.40 on "The Hobbit" and 1.20 on "Dune"
    When the member opens the My Loans page
    Then the total fines owed is 1.60

  # AC:FUNC-010-02 (v1.0.0 - active) - a settled fine is left out of the total
  @AC:FUNC-010-02
  Scenario Outline: A settled fine is left out of the total
    Given the member has a fine of 0.40 on "The Hobbit" and 1.20 on "Dune"
    And the fine on "Dune" is <fine-state>
    When the member opens the My Loans page
    Then the total fines owed is 0.40

    Examples:
      | fine-state  |
      | paid        |
      | waived      |
      | written-off |
