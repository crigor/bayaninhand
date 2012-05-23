class VolunteersController < ApplicationController
  before_filter :authenticate_user!
  
  def profile
    @user = current_user
  end

end
