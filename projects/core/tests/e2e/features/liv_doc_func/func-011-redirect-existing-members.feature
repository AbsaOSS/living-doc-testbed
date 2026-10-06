# =============================================================================
# LIVING DOC — FUNC-011 · Membership Sign-up Wizard - Redirect Existing Members
# =============================================================================
# status:    active
# parent:    FEAT-003
# func_type: navigation_rule
#
# acceptance_criteria:
#
#   AC:FUNC-011-01 (v1.0.0 - active)
#     - A signed-in member who opens the sign-up wizard is taken to the My Loans
#       page instead.
# =============================================================================

@FUNC_ID:FUNC-011
@domain_membership
Feature: Membership Sign-up Wizard - Redirect Existing Members
  Keeps members who are already signed in from joining a second time.

  # AC:FUNC-011-01 (v1.0.0 - active) - a signed-in member is taken to My Loans
  @AC:FUNC-011-01
  Scenario: Signed-in member is redirected to My Loans
    Given a member is signed in
    When the member opens "/join"
    Then the My Loans page is displayed
