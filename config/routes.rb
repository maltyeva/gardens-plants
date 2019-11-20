Rails.application.routes.draw do
  get 'plants/new'
  root to: "gardens#index"
  resources :gardens do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :plants, only: [:new, :create]
  end
  resources :plants, only: [:destroy]

end
