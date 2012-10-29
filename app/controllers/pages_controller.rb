class PagesController < ApplicationController
  def about
    @highlighted_page = "about"
  end

  def contact_us
    @errors = []
    @highlighted_page = "contact_us"
    if request.post?
      @name = params[:user][:name]
      @email = params[:user][:email]
      @number = params[:user][:number]
      @message = params[:user][:message]
      @errors << "Name should not be blank" if @name.blank?
      @errors << "Email should not be blank" if @email.blank?
      @errors << "Message should not be blank" if @message.blank?
      if @errors.empty? # send the email
        ContactUsMailer.contact_us(params[:user]).deliver
        flash.now[:notice] = "Email successfully sent."
        @name = @email = @number = @message = ""
      else
        render and return # show the page again with errors
      end
    else # get request
      if current_user
        @name = current_user.full_name
        @email = current_user.email
        @number = current_user.mobile_number
      end
    end
  end
end
