/* =============================================================================
 * LIVING DOC — FEAT-004 · Loan Detail Page
 * =============================================================================
 * surface_type:          UI
 * route:                 /account/loans/{loanId}
 * owners:                Lending Team
 * stub-reason:           The loan detail template carries no test-id attributes yet; surface
 *                        documented from the design. discovered 2026-09-28
 * purpose:               The screen where a member sees one loan in full.
 * user_stories:          US-001
 * functionalities:       FUNC-012
 * external_dependencies: none
 * page-object:           LoanDetailPage.ts
 * ============================================================================= */

export class LoanDetailPage {
  constructor(private readonly page: import("@playwright/test").Page) {}

  async goto(loanId: string): Promise<void> {
    await this.page.goto(`/account/loans/${loanId}`);
  }
}
