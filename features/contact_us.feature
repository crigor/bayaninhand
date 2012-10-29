Feature: Contact Us
  As a user
  I want to be able to send a message
  So that I can contact the site admin

  Scenario: User sends a message
    Given I am an unauthenticated user
    And I am on the contact us page
    When I fill in the following:
      | Name | First Last |
      | Number | 987654321 |
      | Message | This is a test. |
    And I fill in "Email" with "test@ivolunteer.com.ph" within "#content"
    And I press "Submit"
    Then "contactus@ivolunteer.com.ph" should receive an email
