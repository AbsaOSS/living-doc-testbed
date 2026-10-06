/* =============================================================================
 * LIVING DOC — FEAT-002 · My Loans Page
 * =============================================================================
 * surface_type:          UI
 * route:                 /account/loans
 * owners:                Lending Team, Finance Team
 * purpose:               The screen where a member sees the books they have on loan, with
 *                        due dates, and renews a loan.
 * user_stories:          US-001
 * functionalities:       FUNC-003, FUNC-004, FUNC-009, FUNC-010
 * external_dependencies: none
 * page-object:           MyLoansPage.ts
 * ============================================================================= */

import type { Locator, Page } from "@playwright/test";

export class MyLoansPage {
  readonly loans: Locator;

  constructor(private readonly page: Page) {
    this.loans = page.getByTestId("loan-item");
  }

  async goto(): Promise<void> {
    await this.page.goto("/account/loans");
  }

  loan(title: string): Locator {
    return this.loans.filter({ hasText: title });
  }

  dueDate(title: string): Locator {
    return this.loan(title).getByTestId("loan-due-date");
  }

  renewButton(title: string): Locator {
    return this.loan(title).getByTestId("loan-renew");
  }

  async renew(title: string): Promise<void> {
    await this.renewButton(title).click();
  }
}
