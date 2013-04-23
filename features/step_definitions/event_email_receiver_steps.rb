When /^I reply to the email notification for "([^"]*)"$/ do |event_title|
  event = Event.where(:title => event_title).first
  user = User.where(:email => "test@ivolunteer.com.ph").first
  participation = Participation.where(:event_id => event.id, :user_id => user.id).first
  email = "#{participation.id}@mail-test.ivolunteer.com.ph"
  params =  {
      "SPF" => "pass",
      "charsets" => '{"from": "UTF-8", "subject": "UTF-8", "text": "ISO-8859-1", "to": "UTF-8"}',
      "dkim" => "none",
      "envelope" => JSON.generate({
        "to" => [email],
        "from" => "test@ivolunteer.com.ph"
      }),
      "from" => "Test <test@ivolunteer.com.ph>",
      "headers" => "",
      "subject" => "Thank you",
      "text" => "I have a question regarding this event.",
      "html" => "<strong>I have a question regarding this event.</strong>",
      "to" => email
  }
  post emails_path(params)
end

Then /^an event message is created for "([^"]*)"$/ do |event_title|
 event = Event.where(:title => event_title).first
 user = User.where(:email => "test@ivolunteer.com.ph").first
 participation = Participation.where(:event_id => event.id, :user_id => user.id).first
 EventMessage.where(:participation_id => participation.id, :user_id => user.id).first.should_not be_nil
end
