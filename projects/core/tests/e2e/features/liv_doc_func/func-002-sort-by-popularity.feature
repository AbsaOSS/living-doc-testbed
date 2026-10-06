# =============================================================================
# LIVING DOC — FUNC-002 · Catalogue Search Page - Sort by Popularity
# =============================================================================
# status:    deprecated
# deprecated_at:      2026-08-03
# deprecation_reason: Popularity favoured a handful of titles; members asked for
#                     relevance and newest-first instead.
# superseded_by:      FUNC-008
# parent:    FEAT-001
# func_type: component_action
# notes:
#   - The popularity score is refreshed overnight from the previous day's loans.
#
# acceptance_criteria:
#
#   AC:FUNC-002-01 (v1.0.0 - deprecated - removal planned v2.0.0)
#     - Choosing "Most popular" orders the results by the number of loans in the
#       last 90 days, highest first.
# =============================================================================

@FUNC_ID:FUNC-002
@domain_catalogue
Feature: Catalogue Search Page - Sort by Popularity
  Orders the catalogue results by how often each book was borrowed recently.

  # AC:FUNC-002-01 (v1.0.0 - deprecated - removal planned v2.0.0) - "Most popular" orders by recent loans
  @AC:FUNC-002-01
  Scenario: Results are ordered by recent loans
    Given the search for "dragons" shows "Temeraire" with 40 recent loans and "The Hobbit" with 12
    When the member sorts by "Most popular"
    Then "Temeraire" is listed before "The Hobbit"
