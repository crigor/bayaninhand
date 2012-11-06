class ContactUsMailer < ActionMailer::Base
  default from: "no-reply@ivolunteer.com.ph"

  def contact_us(user)
    @user = user
    @number = user[:number].blank? ? "blank" : user[:number]
    mail(:to => "contactus@ivolunteer.com.ph", :reply_to => user[:email], :subject => "Contact Us - #{user[:name]}")
  end
end
