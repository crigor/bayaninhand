class SearchController < ApplicationController
  def simple
    @query = params[:q]
    @events = Event.search(@query) #ThinkingSphinx.search(@query)
    #@organizations = Organization.search(@query)
    @events_total_entries = @events.total_entries
    #@organizations_total_entries = @organizations.total_entries
  end
end
