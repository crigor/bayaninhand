class EventMailer < ActionMailer::Base
  default :from  => "notifier@ivolunteer.com.ph"

  def new_volunteer(participation)
    @user = participation.user
    @event = participation.event
    mail(:to => @user.email, :reply_to => "event-#{@event.id}@mail-staging.ivolunteer.com.ph", :subject => "Thank you for volunteering")
  end
end
