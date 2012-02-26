@login @registration
Feature: Login and registration
  As a volunteer
  I want to be able to sign in
  So that I can volunteer for projects

  Scenario: User creates an account
    Given I am an unauthenticated user
    And an expertise exists with a name of "Education"
    And I am on the new user registration page
    When I fill in "Email" with "test@ivolunteer.com.ph"
    And I fill in "Password" with "mypassword"
    And I fill in "Password confirmation" with "mypassword"
    And I fill in the following:
      | First name | First |
      | Middle name | Middle |
      | Last name | Last |
      | Mobile number | 1234 |
      | City | City |
      | Nationality| Nationality |
    And I select "Philippines" from "Country"
    And I select "NCR" from "Region"
    And I choose "Male"
    And I check the expertise "Education"
    And I press "Sign up"
    Then I should be on the dashboard page
    And I should see "Welcome! You have signed up successfully."

  @email
  Scenario: User creates an account, should receive email
    Given I am an unauthenticated user
    And an expertise exists with a name of "Education"
    And I am on the new user registration page
    When I fill in "Email" with "test@ivolunteer.com.ph"
    And I fill in "Password" with "mypassword"
    And I fill in "Password confirmation" with "mypassword"
    And I fill in the following:
      | First name | First |
      | Middle name | Middle |
      | Last name | Last |
      | Mobile number | 1234 |
      | City | City |
      | Nationality| Nationality |
    And I select "Philippines" from "Country"
    And I select "NCR" from "Region"
    And I choose "Male"
    And I check the expertise "Education"
    And I press "Sign up"
    Then "test@ivolunteer.com.ph" should receive an email
    When I open the email
    Then I should see "confirm" in the email body
    When I follow "Confirm my account" in the email
    Then I should see "successfully confirmed"

  Scenario: User creates an account with expertises
    Given I am an unauthenticated user
    And an expertise exists with a name of "Education"
    And I am on the new user registration page
    When I fill in "Email" with "test@ivolunteer.com.ph"
    And I fill in "Password" with "mypassword"
    And I fill in "Password confirmation" with "mypassword"
    And I fill in the following:
      | First name | First |
      | Middle name | Middle |
      | Last name | Last |
      | Mobile number | 1234 |
      | City | City |
      | Nationality| Nationality |
    And I select "Philippines" from "Country"
    And I select "NCR" from "Region"
    And I choose "Male"
    And I check the expertise "Education"
    And I press "Sign up"
    Then I should be on the dashboard page
    And I should have an expertise of "Education"

  Scenario: User logins in with valid credentials
    Given I am an existing user
    And I am on the login page
    When I log in with valid credentials
    Then I should be on the dashboard page

  Scenario: User logins in with invalid credentials
    Given I am an existing user
    And I am on the login page
    When I log in with invalid credentials
    Then I should be on the home page
    And I should see "Invalid email or password"
