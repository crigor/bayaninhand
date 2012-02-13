Feature: Organization
  As a user
  I want to be able to create an organization
  So I can create events

  Scenario: Create an organization
    Given I am logged in
    And an organization type exists with a name of "Government Agency"
    When I go to the new organization page
    And I fill in the following:
      | Name   | DSWD  |
      | Address | Address |
      | Contact Person | Contact Person |
      | Contact Number | 1234 |
      | Email | org@ivolunteer.com.ph |
      | Website | ivolunteer.com.ph |
      | Mission Statement | Mission Statement |
      | Description | Description |
    And I select "Philippines" from "Country"
    And I select "Government Agency" from "Organization Type"
    And I press "Submit"
    Then I should be on the organization admin page of "DSWD"
    And the organization type of "DSWD" should be "Government Agency"

  Scenario: Create a blank organization
    Given I am logged in
    When I go to the new organization page
    And I press "Submit"
    Then I should be on the create organization page

  @allow-rescue
  Scenario: Ordinary user on the org admin page
    Given I am logged in
    Given an organization exists with a name of "DSWD"
    When I go to the organization admin page of "DSWD"
    Then I should not get a response with status 200

