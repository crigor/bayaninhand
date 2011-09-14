class OrganizationsController < InheritedResources::Base
  def admin
    @organization = resource
    authorize! :administer, @organization
  end
end
