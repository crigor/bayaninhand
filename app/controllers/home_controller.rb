class HomeController < ApplicationController
  def index
    if params[:category].nil?
      @events = Event.upcoming.order("start_date")
      @selected_category = "all"
    else
      @category = Category.find_by_name(params[:category])
      redirect_to root_url and return if @category.nil?
      @selected_category = @category.name
      @events = Event.search(:conditions => {:categories => @category.name, :status => "open"}, :order => :start_date, :per_page => 8)
    end
    @categories = Category.all(:order => "name")
    @popular_categories = Category.popular(4)
  end
end
