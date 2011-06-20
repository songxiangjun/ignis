Ignis::Application.routes.draw do
  devise_for :users

  # for the near future....
#  resources :room, :only => [:create, :show, :update, :destroy ] do
#    resources :message, :only => [:create, :show, :update, :destroy]
#  end

  resources :message,    :only => [:create, :destroy]
  resources :room,       :only => [:index, :create, :update, :destroy]
  resources :group,      :only => [:index, :create, :update, :destroy]
  resources :membership, :only => [:index, :create, :update, :destroy]

  post 'poll' => "poll#provider"
  match 'history(.:format)' => "history#show"

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
