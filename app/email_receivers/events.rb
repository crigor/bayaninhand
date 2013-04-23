class EventEmailReceiver < Incoming::Strategies::SendGrid
  def receive(mail)
    Rails.logger.info("mail: #{mail.inspect}")
    participation = Participation.find(mail.to.first.split("@").first)
    user = User.where(:email => mail.from.first).first
    if participation && user
      event_message = EventMessage.new :participation => participation, :sender => user, :sender_email => user.email
      event_message.body = mail.body.to_s
      result = event_message.save
      if result
        # send the emails to the user and organization admins
        EventMailer.reply_from_inbound(participation, mail).deliver
      end
    else
      # log the message and investigate
    end
  end
end
