class HomeController < ApplicationController
  def index
    @events = Event.upcoming.order("date")
  end
end
