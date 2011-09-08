class EventsController < InheritedResources::Base
  before_filter :authenticate_user!, :only => [:new, :volunteer]
  belongs_to :organization
  def new
    new!
    authorize! :create, @event
  end
  def volunteer
    Participation.volunteer(resource, current_user)
    redirect_to organization_event_url(@event.organization, @event)
  end
end
