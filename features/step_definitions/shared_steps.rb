Given /^"([^"]*)" is logged in$/ do |email|
  steps %Q{
  Given I am on the login page
  When I fill in "Email" with "#{email}"
  And I fill in "Password" with "password"
  And I press "Sign in"
  }

end


