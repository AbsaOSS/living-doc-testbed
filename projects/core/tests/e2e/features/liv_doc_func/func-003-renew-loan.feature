# =============================================================================
# LIVING DOC — FUNC-003 · My Loans Page - Renew Loan
# =============================================================================
# status:    in_review
# parent:    FEAT-002
# func_type: button_action
# not_in_scope:
#   - Renewing a loan that another member has reserved.
#
# acceptance_criteria:
#
#   AC:FUNC-003-01 (v1.1.0 - in_review)
#     - Pressing "Renew" moves the loan's due date out by one loan period.
#
#   AC:FUNC-003-02 (v1.1.0 - in_review)
#     - The "Renew" button is disabled once the loan has been renewed.
# =============================================================================

@FUNC_ID:FUNC-003
@domain_loans
Feature: My Loans Page - Renew Loan
  Extends a loan from the My Loans page.

  # No scenarios on master yet: the behaviour and its scenarios are in review.
