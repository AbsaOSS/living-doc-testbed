# =============================================================================
# LIVING DOC — FUNC-008 · Catalogue Search Page - Sort Results
# =============================================================================
# status:    active
# parent:    FEAT-001
# func_type: component_action
# not_in_scope:
# - Sorting by popularity, which was retired.
# - Saving a sort order between visits.
#
# acceptance_criteria:
#
#   AC:FUNC-008-01 (v1.0.0 - active)
#     - Results are ordered by relevance by default.
#
#   AC:FUNC-008-02 (v1.0.0 - active)
#     - Choosing "Newest first" orders the results by publication date, newest
#       first.
# =============================================================================

@FUNC_ID:FUNC-008
@domain_catalogue
Feature: Catalogue Search Page - Sort Results
  Orders the catalogue results by relevance or by publication date.

  # AC:FUNC-008-01 (v1.0.0 - active) - results are ordered by relevance by default
  @AC:FUNC-008-01
  Scenario: Results are ordered by relevance
    When the member searches for "dragons"
    Then the results are ordered by relevance

  # AC:FUNC-008-02 (v1.0.0 - active) - "Newest first" orders by publication date
  @AC:FUNC-008-02
  Scenario: Results are ordered newest first
    Given the search for "dragons" shows "The Hobbit" from 1937 and "Temeraire" from 2006
    When the member sorts by "Newest first"
    Then "Temeraire" is listed before "The Hobbit"
