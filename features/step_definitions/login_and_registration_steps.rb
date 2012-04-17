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
  signin("test@ivolunteer.com.ph", "wrongpassword")
end

When /^I sign up with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  signup(email,password)
end

When /^I click the submit button$/ do
  find(:xpath, '//input[@data="registration-submit"]').click
end

def signin(email=nil, password=nil)
  email ||= "test@ivolunteer.com.ph"
  password ||= "mypassword"

  visit('/users/sign_in')
  within("#sign-in") do
    fill_in("Email", :with => email)
    fill_in("Password", :with => password)
    click_button("Sign in")
  end
end

def signup(email=nil, password=nil)
  email ||= "test@ivolunteer.com.ph"
  password ||= "mypassword"

  steps %Q{
    Given I am an unauthenticated user
    And an expertise exists with a name of "Education"
    And I am on the new user registration page
    When I fill in "Email" with "#{email}" within ".register"
    And I fill in "Password" with "#{password}" within ".register"
    And I fill in "Password confirmation" with "#{password}" within ".register"
    And I fill in the following:
      | First name | First |
      | Middle name | Middle |
      | Last name | Last |
      | Mobile number | 1234 |
      | City | City |
    And I select "Philippines" from "Country"
    And I select "Philippines" from "Nationality"
    And I select "NCR" from "Region"
    And I choose "Male"
    And I check the expertise "Education"
    And I click the submit button
  }
end
