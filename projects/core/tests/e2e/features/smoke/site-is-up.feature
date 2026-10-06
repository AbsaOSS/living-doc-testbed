@smoke
Feature: Site is up
  Quick checks run after every deployment.

  Scenario: Catalogue page loads
    When a visitor opens "/catalogue"
    Then the catalogue search box is shown

  Scenario: Sign-up wizard loads
    When a visitor opens "/join"
    Then the details step is shown
