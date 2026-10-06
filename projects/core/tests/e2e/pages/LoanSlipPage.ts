/* =============================================================================
 * LIVING DOC — FEAT-005 · Printable Loan Slip
 * =============================================================================
 * surface_type:          UI
 * route:                 /account/loans/{loanId}/slip
 * owners:                Lending Team
 * purpose:               A printable page with the title, member number and due date of a
 *                        new loan.
 * user_stories:          US-001
 * functionalities:       FUNC-007
 * external_dependencies: none
 * deprecation_reason:    Due dates are shown on My Loans and sent by email, so members no
 *                        longer print slips.
 * superseded_by:         FEAT-002
 * page-object:           LoanSlipPage.ts
 * ============================================================================= */

import type { Locator, Page } from "@playwright/test";

export class LoanSlipPage {
  readonly printButton: Locator;

  constructor(private readonly page: Page) {
    this.printButton = page.getByTestId("slip-print");
  }

  async goto(loanId: string): Promise<void> {
    await this.page.goto(`/account/loans/${loanId}/slip`);
  }
}
