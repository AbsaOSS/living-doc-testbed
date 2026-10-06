/* =============================================================================
 * LIVING DOC — FEAT-003 · Membership Sign-up Wizard  [cross-reference]
 * =============================================================================
 * This file implements Step 3 (Confirm) of the Membership Sign-up Wizard.
 * The authoritative Feature header is in MembershipWizardPage.ts.
 *
 * parent-feat:     FEAT-003
 * route:           /join  (wizard stays on this URL)
 * owners:          Membership Team
 * purpose:         Step 3 (Confirm) — the applicant reviews the details and joins.
 * page-object:     MembershipWizardConfirmStep.ts
 * ============================================================================= */

import type { Locator, Page } from "@playwright/test";

export class MembershipWizardConfirmStep {
  readonly joinButton: Locator;
  readonly membershipNumber: Locator;

  constructor(private readonly page: Page) {
    this.joinButton = page.getByTestId("confirm-join");
    this.membershipNumber = page.getByTestId("confirm-membership-number");
  }

  async join(): Promise<void> {
    await this.joinButton.click();
  }
}
