# =============================================================================
# LIVING DOC — FUNC-001 · Catalogue Search Page - Filter Search Results
# =============================================================================
# status:    active
# parent:    FEAT-001
# func_type: component_action
# rationale:
#   - Filtering narrows the results already shown; it never runs a new search,
#     so it stays a separate behaviour from the search box.
# preconditions:
#   - A search has returned results from more than one author and subject.
#
# acceptance_criteria:
#
#   AC:FUNC-001-01 (v1.0.0 - active)
#     - Selecting a filter value keeps only the results that match it.
#     - Aspect: author, subject
#
#   AC:FUNC-001-02 (v1.0.0 - active)
#     - Clearing all filters restores the full result list.
# =============================================================================

@FUNC_ID:FUNC-001
@domain_catalogue
Feature: Catalogue Search Page - Filter Search Results
  Narrows the catalogue results already on screen by author or subject.

  # AC:FUNC-001-01 (v1.0.0 - active) - a filter keeps only matching results | aspect: author
  @AC:FUNC-001-01/aspect:author
  Scenario: Filtering by author keeps only that author's books
    Given the search for "dragons" shows books by "J. R. R. Tolkien" and "Naomi Novik"
    When the member filters by the author "Naomi Novik"
    Then only books by "Naomi Novik" are listed

  # AC:FUNC-001-02 (v1.0.0 - active) - clearing the filters restores the full list
  @AC:FUNC-001-02
  Scenario: Clearing the filters restores every result
    Given the search for "dragons" is filtered by the author "Naomi Novik"
    When the member clears all filters
    Then every result of the search for "dragons" is listed
