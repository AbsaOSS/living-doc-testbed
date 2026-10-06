# =============================================================================
# LIVING DOC — US-003 · Register at the Desk
# =============================================================================
# status:          deprecated
# deprecated_at:   2026-06-01
# deprecation_reason: Desk staff now register members through the online sign-up
#                     wizard, so the separate desk registration flow is retired.
# superseded_by:   US-002
# business_value:
#   - Residents without internet access can still become members.
#
# acceptance_criteria:
#
#   AC:US-003-01 (v1.0.0 - deprecated - removal planned v2.0.0)
#     - Desk staff can register a resident from a paper form and hand over a
#       printed membership card.
# =============================================================================

@US_ID:US-003
@domain_membership
Feature: Register at the Desk
  As desk staff, I can register a resident from a paper form, so that residents without internet access can join.

  # AC:US-003-01 (v1.0.0 - deprecated - removal planned v2.0.0) - desk staff register a resident from a paper form
  @AC:US-003-01
  Scenario: Desk staff register a resident
    Given a resident hands in a completed paper form
    When the desk staff register the resident
    Then a membership card is printed for the resident
