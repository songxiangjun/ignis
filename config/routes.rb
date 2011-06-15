Ignis::Application.routes.draw do
  devise_for :users

  # for the near future....
#  resources :room, :only => [:create, :show, :update, :destroy ] do
#    resources :message, :only => [:create, :show, :update, :destroy]
#  end

  resources :message, :only => [:create, :show, :update, :destroy]
  resources :room,    :only => [:create, :show, :update, :destroy]
  get 'rooms' => "room#index"
  post 'poll' => "home#provider"
  post 'history' => "home#history"

  root :to => "home#index"


  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # See how all your routes lay out with "rake routes"

end
