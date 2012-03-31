class HomeController < ApplicationController
  def index
    if params[:category].nil?
      @events = Event.upcoming.order("start_date")
    else
      @category = Category.find_by_name(params[:category])
      @events = Event.search(:conditions => {:categories => @category.name})
    end
    @popular_categories = Category.popular(4)
  end
end
