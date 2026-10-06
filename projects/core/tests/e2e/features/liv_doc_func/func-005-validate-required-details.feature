# =============================================================================
# LIVING DOC — FUNC-005 · Membership Sign-up Wizard - Validate Required Details
# =============================================================================
# source:    https://github.com/AbsaOSS/living-doc-testbed/blob/master/projects/core/README.md
# status:    active
# parent:    FEAT-003
# func_type: field_validation
#
# acceptance_criteria:
#
#   AC:FUNC-005-01 (v1.0.0 - active)
#     - Leaving a required detail empty shows an inline error under it and keeps
#       the applicant on the details step.
#     - Aspect: name, date-of-birth, address
#
#   AC:FUNC-005-02 (v1.0.0 - active)
#     - A date of birth in the future is rejected with an inline error.
# =============================================================================

@FUNC_ID:FUNC-005
@domain_membership
Feature: Membership Sign-up Wizard - Validate Required Details
  Checks the applicant's details on the first wizard step before they can move on.

  # AC:FUNC-005-01 (v1.0.0 - active) - an empty required detail shows an inline error | aspect: name
  @AC:FUNC-005-01/aspect:name
  Scenario: Empty name is rejected
    Given the applicant is on the details step
    When the applicant continues with the name left empty
    Then an inline error is shown under the name

  # AC:FUNC-005-01 (v1.0.0 - active) - an empty required detail shows an inline error | aspect: date of birth
  @AC:FUNC-005-01/aspect:date-of-birth
  Scenario: Empty date of birth is rejected
    Given the applicant is on the details step
    When the applicant continues with the date of birth left empty
    Then an inline error is shown under the date of birth

  # AC:FUNC-005-01 (v1.0.0 - active) - an empty required detail shows an inline error | aspect: address
  @AC:FUNC-005-01/aspect:address
  Scenario: Empty address is rejected
    Given the applicant is on the details step
    When the applicant continues with the address left empty
    Then an inline error is shown under the address

  # AC:FUNC-005-02 (v1.0.0 - active) - a future date of birth is rejected
  @AC:FUNC-005-02
  Scenario: Future date of birth is rejected
    Given the applicant is on the details step
    When the applicant enters a date of birth of 2099-01-01
    Then an inline error is shown under the date of birth
