/* =============================================================================
 * LIVING DOC — FEAT-001 · Catalogue Search Page
 * =============================================================================
 * surface_type:          UI
 * route:                 /catalogue
 * owners:                Discovery Team
 * purpose:               The screen where a member searches the library catalogue, narrows
 *                        the results and borrows an available book.
 * user_stories:          US-001
 * functionalities:       FUNC-001, FUNC-002, FUNC-008
 * external_dependencies: catalogue-search-index
 * page-object:           CatalogueSearchPage.ts
 * notes:
 *   - Results are paged 20 at a time; filters and sorting apply to every page.
 * ============================================================================= */

import type { Locator, Page } from "@playwright/test";

export class CatalogueSearchPage {
  readonly searchInput: Locator;
  readonly searchButton: Locator;
  readonly authorFilter: Locator;
  readonly subjectFilter: Locator;
  readonly clearFiltersButton: Locator;
  readonly sortSelect: Locator;
  readonly results: Locator;

  constructor(private readonly page: Page) {
    this.searchInput = page.getByTestId("catalogue-search-input");
    this.searchButton = page.getByTestId("catalogue-search-submit");
    this.authorFilter = page.getByTestId("filter-author");
    this.subjectFilter = page.getByTestId("filter-subject");
    this.clearFiltersButton = page.getByTestId("filter-clear");
    this.sortSelect = page.getByTestId("results-sort");
    this.results = page.getByTestId("result-item");
  }

  async goto(): Promise<void> {
    await this.page.goto("/catalogue");
  }

  async search(query: string): Promise<void> {
    await this.searchInput.fill(query);
    await this.searchButton.click();
  }

  async filterByAuthor(author: string): Promise<void> {
    await this.authorFilter.selectOption({ label: author });
  }

  async clearFilters(): Promise<void> {
    await this.clearFiltersButton.click();
  }

  async borrow(title: string): Promise<void> {
    await this.results.filter({ hasText: title }).getByTestId("result-borrow").click();
  }
}
