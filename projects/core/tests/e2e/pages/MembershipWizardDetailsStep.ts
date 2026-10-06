/* =============================================================================
 * LIVING DOC — FEAT-003 · Membership Sign-up Wizard  [cross-reference]
 * =============================================================================
 * This file implements Step 1 (Details) of the Membership Sign-up Wizard.
 * The authoritative Feature header is in MembershipWizardPage.ts.
 *
 * parent-feat:     FEAT-003
 * route:           /join  (wizard stays on this URL)
 * owners:          Membership Team
 * functionalities: FUNC-005
 * purpose:         Step 1 (Details) — the applicant's name, date of birth and home
 *                  address.
 * page-object:     MembershipWizardDetailsStep.ts
 * notes:
 *   - The address field suggests matches as the applicant types.
 * ============================================================================= */

import type { Locator, Page } from "@playwright/test";

export class MembershipWizardDetailsStep {
  readonly nameInput: Locator;
  readonly dateOfBirthInput: Locator;
  readonly addressInput: Locator;

  constructor(private readonly page: Page) {
    this.nameInput = page.getByTestId("details-name");
    this.dateOfBirthInput = page.getByTestId("details-date-of-birth");
    this.addressInput = page.getByTestId("details-address");
  }

  fieldError(field: "name" | "date-of-birth" | "address"): Locator {
    return this.page.getByTestId(`details-${field}-error`);
  }
}
