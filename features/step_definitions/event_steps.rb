When /^I click the volunteer button$/ do
  find(:xpath, '//a[@rel="volunteer-event"]').click
end

Then /^"([^"]*)" should be on the list of volunteers for "([^"]*)"$/ do |email, title|
  event = Event.find_by_title(title)
  user = User.find_by_email(email)
  event.volunteers.include?(user).should == true
end

