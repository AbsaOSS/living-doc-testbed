# =============================================================================
# LIVING DOC — US-002 · Join the Library
# =============================================================================
# source:          https://github.com/AbsaOSS/living-doc-testbed/blob/master/projects/core/README.md
# status:          active
# business_value:
#   - New members can join online at any hour, so sign-ups no longer depend
#     on desk opening times.
#     - Most sign-up requests used to arrive by email outside opening hours.
#   - Desk staff stop re-typing paper forms.
# notes:
#   - The sign-up wizard is also used by desk staff on the desk terminal.
#
# acceptance_criteria:
#
#   AC:US-002-01 (v1.0.0 - active)
#     - An applicant who completes the sign-up wizard sees a membership number
#       on the confirmation step.
#
#   AC:US-002-02 (v1.0.0 - active)
#     - The applicant receives a confirmation email with the membership number.
#
#   AC:US-002-03 (v1.0.0 - active)
#     - The applicant can choose the card type that matches their age.
#     - Aspect: adult, junior
# =============================================================================

@US_ID:US-002
@domain_membership
Feature: Join the Library
  As a resident, I can join the library online, so that I can borrow books without visiting the desk first.

  # AC:US-002-01 (v1.0.0 - active) - a completed sign-up shows a membership number
  # AC:US-002-02 (v1.0.0 - active) - a confirmation email carries the membership number
  @AC:US-002-01
  @AC:US-002-02
  @Regression
  Scenario Outline: Applicant joins the library
    Given an applicant named "<name>" is on the sign-up wizard
    When the applicant completes every step of the wizard
    Then a membership number is shown on the confirmation step
    And a confirmation email with that membership number is sent to "<email>"

    Examples:
      | name         | email                 |
      | Ada Lovelace | ada@example.org       |
      | Alan Turing  | alan.t@example.org    |

  # AC:US-002-03 (v1.0.0 - active) - the card type matches the applicant's age | aspect: adult
  @AC:US-002-03/aspect:adult
  Scenario: Adult applicant gets an adult card
    Given an applicant aged 34 is on the card type step
    Then the "Adult" card type is offered

  # AC:US-002-03 (v1.0.0 - active) - the card type matches the applicant's age | aspect: junior
  @AC:US-002-03/aspect:junior
  Scenario: Junior applicant gets a junior card
    Given an applicant aged 12 is on the card type step
    Then the "Junior" card type is offered
