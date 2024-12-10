Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Health check route (can be used by load balancers)
  get "up" => "rails/health#show", as: :rails_health_check

  # Projects routes
  resources :projects do
    # Boards routes, only the 'show' action
    resources :boards, only: [ :show ] do
      # Tasks routes inside boards
      resources :tasks
    end

    # Teams routes
    resources :teams
  end

  # Root route (landing page for the app)
  root "projects#index"  # This makes the index action of the ProjectsController the homepage
end
