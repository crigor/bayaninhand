@login @registration
Feature: Login and registration
  As a volunteer
  I want to be able to sign in
  So that I can volunteer for projects

  Scenario: User creates an account
    Given I am an unauthenticated user
    When I sign up with email "test@ivolunteer.com.ph" and password "mypassword"
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
