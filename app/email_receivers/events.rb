class EventEmailReceiver < Incoming::Strategies::SendGrid
  def receive(mail)
    Rails.logger.info("mail: #{mail.inspect}")
    event = Event.find(mail.to.first.split("@").first.gsub("event-",""))
    user = User.where(:email => mail.from.first).first
    if event && user
      participation = Participation.where(:event_id => event.id, :user_id => user.id).first
      event_message = EventMessage.new :participation => participation, :sender => user, :sender_email => user.email
      event_message.body = mail.body.to_s
      event_message.save
    else
      # log the message and investigate
    end
  end
end
