Feature: EventEmailReceiver
  As a user
  I want to be able to reply to an email
  So that I can communicate with the organizer

  Scenario: User receives an email after joining an event then replies
    Given I am logged in
    Given the following event exists:
      | Title | Address |
      | Event | Address |
    And I am on the event page of "Event"
    And I click the volunteer button
    Then "test@ivolunteer.com.ph" should receive an email
    When I reply to the email notification for "Event"
    Then an event message is created for "Event"
