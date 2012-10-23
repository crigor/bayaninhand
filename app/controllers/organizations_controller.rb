class OrganizationsController < InheritedResources::Base
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :admin]

  def new
    @organization = Organization.new :country => "Philippines"
    new!
  end

  def show
    @organization = resource
    @upcoming_events = @organization.events.upcoming
  end

  def admin
    @organization = resource
    @upcoming_events = @organization.upcoming_events
    @ongoing_events = @organization.ongoing_events
    @finished_events = @organization.finished_events
    authorize! :administer, @organization
  end

  def create
    @organization = Organization.new(params[:organization])
    create! do |success, failure|
      success.html do
        OrganizationRole.create(:organization => @organization, :role => "owner", :user => current_user)
        redirect_to user_admin_organization_path(@organization)
      end
    end
  end

  def edit
    @organization = resource
    authorize! :administer, @organization
    edit!
  end

  def update
    @organization = resource
    authorize! :administer, @organization
    update!
  end

end
