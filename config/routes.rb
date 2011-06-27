Ignis::Application.routes.draw do
  devise_for :users

  resources :message,    :only => [:create, :destroy]
  resources :room,       :only => [:index, :create, :update, :destroy]
  resources :group,      :only => [:index, :create, :update, :destroy] do
    get 'associate' => 'group#associated_users'
    post 'associate' => 'group#associate_users'
  end
  resources :membership, :only => [:index, :create, :update, :destroy]

  post 'poll' => "poll#provider"
  match 'history(.:format)' => "history#show"
  get 'users' => 'home#userlist'

  root :to => "home#index"

  # See all routes with "rake routes"

end
