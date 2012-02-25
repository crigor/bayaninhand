Given /^I am an unauthenticated user$/ do
  visit('/users/sign_out')
end

Given /^I am logged in$/ do
  signup
end

Then /^I should have an expertise of "([^"]*)"$/ do |expertise_name|
  user = User.find_by_email("test@ivolunteer.com.ph")
  expertise = Expertise.find_by_name(expertise_name)
  user.expertises.include?(expertise).should == true
end

When /^I check the expertise "([^"]*)"$/ do |expertise_name|
  #TODO find a better way to check the boxes
  expertise_name_underscore = expertise_name.gsub(/,/,'').gsub(/\s/, '_').downcase
  check("user_expertise_#{expertise_name_underscore}")
end

Given /^I am an existing user$/ do
  signup
  User.find_by_email("test@ivolunteer.com.ph").should_not be_nil
end

When /^I log in with valid credentials$/ do
  visit('/users/sign_out')
  signin
end

When /^I log in with invalid credentials$/ do
  visit('/users/sign_out')
  visit('users/sign_in')
  fill_in("Email", :with => "test@ivolunteer.com.ph")
  fill_in("Password", :with => "wrongpassword")
  click_button("Sign in")
end

def signin
  visit('users/sign_in')
  fill_in("Email", :with => "test@ivolunteer.com.ph")
  fill_in("Password", :with => "mypassword")
  click_button("Sign in")
end

def signup
  steps %Q{
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
  }
end
