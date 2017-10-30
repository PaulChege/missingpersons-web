Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :cases, only: [:index , :show ]
  resources :sightings, only: [:index,:show]
  resources :public_users,  only: [:index]



  #api
  namespace 'api' do
  namespace 'v1' do
    post 'authenticate', to: 'authentication#authenticate'
    post 'create_case', to: 'api#create_case'
    post 'signup', to: 'authentication#signup'
  end
  end


end
