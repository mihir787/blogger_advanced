Rails.application.routes.draw do
  resources :tenants, path: "", param: "slug"

  namespace :tenants, as: :tenant, path: "/:slug" do
    resources :articles
    resources :comments
    resource  :account,   only: [:show] do
      get :work
    end

  get  '/login'     => 'sessions#new'
  post '/login'     => 'sessions#create'
  get  '/logout'    => 'sessions#destroy'

  end
  get  '/dashboard' => 'dashboard#show'

  root to: 'tenants#index'
end
