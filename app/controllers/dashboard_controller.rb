class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def volunteer
   @user = current_user
   @upcoming_events = @user.upcoming_events
  end
end
