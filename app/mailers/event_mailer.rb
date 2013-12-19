class EventMailer < ActionMailer::Base
  default :from  => "contactus@ivolunteer.com.ph"
  helper :events

  def new_volunteer(participation)
    @user = participation.user
    @event = participation.event
    mail(:to => @user.email, :reply_to => "contactus@ivolunteer.com.ph", :cc => "contactus@ivolunteer.com.ph", :subject => "Thank you for volunteering")
  end

end
