Given /^"([^"]*)" is logged in$/ do |email|
  steps %Q{
  Given I am on the home page
  When I fill in "user_email" with "#{email}"
  And I fill in "user_password" with "password"
  And I press "Login"
  }

end


