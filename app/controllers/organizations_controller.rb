class OrganizationsController < InheritedResources::Base
  def show
    @organization = resource
    @upcoming_events = @organization.events.upcoming
  end

  def admin
    @organization = resource
    authorize! :administer, @organization
  end
end
