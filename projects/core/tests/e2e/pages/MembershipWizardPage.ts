/* =============================================================================
 * LIVING DOC — FEAT-003 · Membership Sign-up Wizard
 * =============================================================================
 * surface_type:          UI
 * route:                 /join
 * owners:                Membership Team
 * wizard-steps:          Details · Card Type · Confirm
 * purpose:               Multi-step wizard where a resident joins the library and receives a
 *                        membership number.
 * user_stories:          US-002, US-003
 * functionalities:       FUNC-005, FUNC-006, FUNC-011
 * external_dependencies: address-lookup-service, email-gateway
 * page-object:           MembershipWizardPage.ts
 * ============================================================================= */

import type { Locator, Page } from "@playwright/test";

export class MembershipWizardPage {
  readonly stepTitle: Locator;
  readonly nextButton: Locator;
  readonly backButton: Locator;

  constructor(private readonly page: Page) {
    this.stepTitle = page.getByTestId("wizard-step-title");
    this.nextButton = page.getByTestId("wizard-next");
    this.backButton = page.getByTestId("wizard-back");
  }

  async goto(): Promise<void> {
    await this.page.goto("/join");
  }

  async next(): Promise<void> {
    await this.nextButton.click();
  }
}
