@login @registration
Feature: Login and registration
  As a volunteer
  I want to be able to sign in
  So that I can volunteer for projects

  Scenario: User creates an account
    Given I am an unauthenticated user
    And I am on the new user registration page
    When I fill in "Email" with "my_email@email.com"
    And I fill in "Password" with "mypassword"
    And I fill in "Password confirmation" with "mypassword"
    And I press "Sign up"
    Then I should be on the home page
    And I should see "Welcome! You have signed up successfully."
