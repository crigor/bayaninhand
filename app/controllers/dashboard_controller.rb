class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def volunteer
    @user = current_user
    @upcoming_events = @user.upcoming_events
  end

  def events
    @user = current_user
    @upcoming_events = @user.upcoming_events
    @ongoing_events = @user.ongoing_events
    @finished_events = @user.finished_events
  end
end
