Feature: Event
  As an organization admin
  I want to be able to create an event
  So volunteers can join

  Scenario: Organization admin creates an event
    Given I am logged in
    And an organization exists with a name of "DSWD"
    And a category exists with a name of "Education"
    And an event type exists with a name of "IT Development"
    And the following organization role exists:
      | User                          | Organization | Role  |
      | Email: test@ivolunteer.com.ph | Name: DSWD   | owner |
    And I am on the new event page for "DSWD"
    And I fill in the following:
      | Title                | New Event          |
      | Description          | Event description. |
      | Start Date           | 2020-01-01         |
      | End Date             | 2020-06-30         |
      | Volunteers Needed    | 100                |
    And I select "09:00 AM" from "Start Time"
    And I select "05:00 PM" from "End Time"
    And I select "Education" from "Category"
    And I select "IT Development" from "Event Type"
    And I press "Submit"
    Then I should be on the event page of "New Event"

  @allow-rescue
  Scenario: Regular user tries to create an event
    Given I am logged in
    And an organization exists with a name of "DSWD"
    And I am on the new event page for "DSWD"
    Then I should not get a response with status 200

  Scenario: User volunteers for an event
    Given I am logged in
    Given an event exists with a title of "Event"
    And I am on the event page of "Event"
    And I click the volunteer button
    Then "test@ivolunteer.com.ph" should be on the list of volunteers for "Event"
    And I should be on the event page of "Event"
