class ProjectsController < ApplicationController
  # Ensure that the user is authenticated before accessing any project actions
  before_action :authenticate_user!

  # The index action will display all projects
  def index
    # Fetch all projects, which will be available in the view for rendering
    @projects = Project.all
  end

  # Show a specific project
  def show
    # Find the project based on the id from params
    @project = Project.find(params[:id])
  end

  # Other actions for creating, editing, updating, and deleting projects...
end
