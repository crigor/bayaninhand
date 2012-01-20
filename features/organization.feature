Feature: Organization
  As a user
  I want to be able to create an organization
  So I can create events

  Scenario: Create an organization
    Given a user exists with an email of "me@crigor.com"
    And "me@crigor.com" is logged in
    When I go to the new organization page
    And I fill in the following:
      | Name   | DSWD  |
    And I press "Create Organization"
    Then I should be on the organization admin page of "DSWD"

  @allow-rescue
  Scenario: Ordinary user on the org admin page
    Given a user exists with an email of "me@crigor.com"
    And "me@crigor.com" is logged in
    Given an organization exists with a name of "DSWD"
    When I go to the organization admin page of "DSWD"
    Then I should not get a response with status 200

