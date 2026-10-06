# =============================================================================
# LIVING DOC — US-001 · Borrow a Book
# =============================================================================
# status:          active
# business_value:
#   - Members can take a book home without queuing at the desk, so the desk
#     staff spend their time on enquiries instead of checkouts.
# preconditions:
#   - The member is signed in with an account in good standing.
# not_in_scope:
#   - Borrowing from a partner library through inter-library loan.
#
# acceptance_criteria:
#
#   AC:US-001-01 (v1.0.0 - active)
#     - A member who borrows an available book from the catalogue sees the loan
#       on the My Loans page with its due date.
#
#   AC:US-001-02 (v1.0.0 - active)
#     - A member who already holds the maximum number of loans cannot borrow
#       another book and is told why.
#     preconditions:
#       - The loan limit for the member's category is set.
#
#   AC:US-001-03 (v1.1.0 - in_review)
#     - A member can renew a loan once from the My Loans page, which moves its
#       due date out by one loan period.
#
#   AC:US-001-04 (v1.0.0 - deprecated - removal planned v2.0.0)
#     - A printable loan slip is offered after a book is borrowed.
#     - Rationale: The due date is now shown on My Loans and sent by email, so
#       the slip is no longer needed.
#
#   AC:US-001-05 (v1.2.0 - planned)
#     - A member is reminded by email two days before a loan is due.
#
#   AC:US-001-06 (planned)
#     - A member can borrow an e-book from the catalogue.
#     - Rationale: Backlog - no target version; the e-book licensing terms are
#       not agreed yet.
#     not_in_scope:
#       - Reading the e-book inside the web app.
# =============================================================================

@US_ID:US-001
@domain_loans
Feature: Borrow a Book
  As a library member, I can borrow a book from the online catalogue, so that I can take it home without queuing at the desk.

  Background:
    Given a member in good standing is signed in

  # AC:US-001-01 (v1.0.0 - active) - a borrowed book shows on My Loans with its due date
  @AC:US-001-01
  @Regression
  Scenario: Member borrows an available book
    Given the book "The Hobbit" is available
    When the member borrows "The Hobbit" from the catalogue
    Then "The Hobbit" is listed on the My Loans page
    And the loan shows a due date

  # AC:US-001-04 (v1.0.0 - deprecated - removal planned v2.0.0) - a loan slip is offered after borrowing
  @AC:US-001-04
  Scenario: Member is offered a loan slip
    Given the book "Dune" is available
    When the member borrows "Dune" from the catalogue
    Then a printable loan slip for "Dune" is offered
