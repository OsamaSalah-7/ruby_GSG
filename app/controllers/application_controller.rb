class ApplicationController < ActionController::Base
  # Ensure that the user is authenticated before accessing any actions
  before_action :authenticate_user!

  # Override the default Devise method to redirect to the projects index
  def after_sign_in_path_for(resource)
    projects_path # This will redirect users to the main page (projects index)
  end
end
