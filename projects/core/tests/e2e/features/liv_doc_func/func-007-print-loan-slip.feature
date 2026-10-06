# =============================================================================
# LIVING DOC — FUNC-007 · Printable Loan Slip - Print Slip
# =============================================================================
# status:    deprecated
# deprecated_at:      2026-08-03
# deprecation_reason: The due date is shown on My Loans and sent by email, so the
#                     printed slip is no longer needed.
# parent:    FEAT-005
# func_type: button_action
#
# acceptance_criteria:
#
#   AC:FUNC-007-01 (v1.0.0 - deprecated - removal planned v2.0.0)
#     - Pressing "Print" opens the browser print dialog with the slip's title,
#       member number and due date.
# =============================================================================

@FUNC_ID:FUNC-007
@domain_loans
Feature: Printable Loan Slip - Print Slip
  Prints a slip for a new loan.

  # AC:FUNC-007-01 (v1.0.0 - deprecated - removal planned v2.0.0) - "Print" opens the print dialog with the slip
  @AC:FUNC-007-01
  Scenario: Member prints a loan slip
    Given the member is on the loan slip of "Dune"
    When the member presses "Print"
    Then the print dialog shows "Dune" with the member number and the due date
