Rails.application.routes.draw do
  get 'plants/new'
  resources :gardens do
    resources :plants, only: [:new, :create]
  end

  resources :plants, only: [:destroy]

  root to: "gardens#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
