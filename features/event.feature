Feature: Event
  As an organization admin
  I want to be able to create an event
  So volunteers can join

  @wip
  Scenario: Organization admin creates an event
    Given a user exists with an email of "me@crigor.com"
    And an organization exists with a name of "DSWD"
    And the following organization role exists:
      | User                 | Organization | Role  |
      | Email: me@crigor.com | Name: DSWD   | owner |
    Given "me@crigor.com" is logged in
    And I am on the new event page for "DSWD"
    Then show me the page

  @allow-rescue
  Scenario: Regular user tries to create an event
    Given a user exists with an email of "me@crigor.com"
    And an organization exists with a name of "DSWD"
    Given "me@crigor.com" is logged in
    And I am on the new event page for "DSWD"
    Then I should not get a response with status 200

  Scenario: User volunteers for an event
    Given a user exists with an email of "me@crigor.com"
    And "me@crigor.com" is logged in
    Given an event exists with a title of "Event"
    And I am on the event page of "Event"
    And I click the volunteer button
    Then "me@crigor.com" should be on the list of volunteers for "Event"
    And I should be on the event page of "Event"
