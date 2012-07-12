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
    And an organization exists with a name of "DSWD"
    When I go to the organization admin page of "DSWD"
    Then I should see "You are not allowed to view this page"

  Scenario: Ordinary user sees organization profile page
    Given I am an unauthenticated user
    And an organization exists with a name of "DSWD"
    When I go to the organization page of "DSWD"
    Then I should see "123 Test Street"
    And I should see "Contack Pearson"
    And I should see "1234567"
    And I should see "Email"
    And I should see "Website"
    And I should see "Philippines"
    And I should see "Lorem Ipsum Statement"
    And I should see "This is a test organization"

  Scenario: Organization creator should be able to edit organization details
    Given I am logged in
    And I create an organization with the name "Bantay Bata"
    And I am on the organization admin page of "Bantay Bata"
    And I follow "Edit Profile"
    Then I should be on the organization edit page of "Bantay Bata"
    And I fill in "Name" with "Child Security 163"
    When I press "Submit"
    Then I should see "Organization was successfully updated."
    And I should see "Child Security 163"
    And I should not see "Bantay Bata"
