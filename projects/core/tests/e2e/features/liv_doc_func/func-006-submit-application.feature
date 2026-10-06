# =============================================================================
# LIVING DOC — FUNC-006 · Membership Sign-up Wizard - Submit Application
# =============================================================================
# status:    active
# parent:    FEAT-003
# func_type: button_action
# preconditions:
#   - The applicant has completed the details and card type steps.
#
# acceptance_criteria:
#
#   AC:FUNC-006-01 (v1.0.0 - active)
#     - Pressing "Join" creates the membership and shows its number on the
#       confirmation step.
#
#   AC:FUNC-006-02 (v1.0.0 - active)
#     - Pressing "Join" a second time does not create a second membership.
# =============================================================================

@FUNC_ID:FUNC-006
@domain_membership
Feature: Membership Sign-up Wizard - Submit Application
  Creates the membership when the applicant confirms the sign-up.

  # AC:FUNC-006-01 (v1.0.0 - active) - "Join" creates the membership and shows its number
  @AC:FUNC-006-01
  Scenario: Joining creates a membership
    Given the applicant is on the confirm step
    When the applicant presses "Join"
    Then a membership number is shown
