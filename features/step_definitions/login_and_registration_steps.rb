Given /^I am an unauthenticated user$/ do
  visit('/users/sign_out')
end

Then /^I should have an expertise of "([^"]*)"$/ do |expertise_name|
  user = User.find_by_email("me@ivolunteer.com.ph")
  expertise = Expertise.find_by_name(expertise_name)
  user.expertises.include?(expertise).should == true
end

When /^I check the expertise "([^"]*)"$/ do |expertise_name|
  #TODO find a better way to check the boxes
  expertise_name_underscore = expertise_name.gsub(/,/,'').gsub(/\s/, '_').downcase
  check("user_expertise_#{expertise_name_underscore}")
end

