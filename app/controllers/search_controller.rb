class SearchController < ApplicationController
  def simple
    @query = params[:q]
    @events = Event.search(@query) #ThinkingSphinx.search(@query)
    #@organizations = Organization.search(@query)
    @events_total_entries = @events.total_entries
    #@organizations_total_entries = @organizations.total_entries
  end

  def advanced
    @categories = Category.all(:order => "name")
  end

  def advanced_results
    @query = params[:q]
    @users = User.search(@query)
    @organizations = Organization.search(@query)
    @users_total_entries = @users.total_entries
    @organizations_total_entries = @organizations.total_entries
  end

  def advanced_events
    @query = params[:q]
    @created_within = params[:created_within]
    @events = Event.advanced_search(@query, :created_within => @created_within, :category_id => params[:search_category_id])
    @events_total_entries = @events.total_entries
  end
end
