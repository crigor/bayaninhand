class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  # used by config/initializers/active_admin.rb
  def authenticate_user_for_admin_pages!
    authenticate_user!
    if !current_user.admin?
      render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
    ## to avoid deprecation warnings with Rails 3.2.x (and incidentally using Ruby 1.9.3 hash syntax)
    ## this render call should be:
    # render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  end
end
