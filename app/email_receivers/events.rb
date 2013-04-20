class EventEmailReceiver < Incoming::Strategies::SendGrid
  def receive(mail)
    Rails.logger.info("mail: #{mail.inspect}")
  end
end
