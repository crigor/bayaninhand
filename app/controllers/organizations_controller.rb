class OrganizationsController < InheritedResources::Base
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :admin]

  def show
    @organization = resource
    @upcoming_events = @organization.events.upcoming
  end

  def admin
    @organization = resource
    authorize! :administer, @organization
  end

  def create
    @organization = Organization.new(params[:organization])
    create! do |success, failure|
      success.html do
        OrganizationRole.create(:organization => @organization, :role => "owner", :user => current_user)
        redirect_to admin_organization_path(@organization)
      end
    end
  end
end
