class EventsController < InheritedResources::Base
  belongs_to :organization
  def new
    new!
    authorize! :create, @event
  end
end
