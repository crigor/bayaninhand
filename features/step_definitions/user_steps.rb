When /^I am a site admin$/ do
  steps %Q{
    Given the following user role exists:
      | User                          | Role  |
      | Email: test@ivolunteer.com.ph | admin |
  }
end
