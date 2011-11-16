class HomeController < ApplicationController
  def index
    @events = Event.upcoming.order("start_date")
  end
end
