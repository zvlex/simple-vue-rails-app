Rails.application.routes.draw do
  namespace :admin do
    root 'post_versions#index'

    resources :post_versions, except: :destroy do
      member do
        get :edit_decline
        put :approve
        put :decline
      end
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'posts#index'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  resources :posts do
    collection do
      post :preview
      put :add_to_favorites
      put :vote

      get '/:state', action: :posts_list, state: /draft|on_moderation|declined/
    end

    resources :comments
  end

  resources :post_versions do
    member do
      put :send_to_moderation
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets

  resources :users, expect: :destroy do
    member do
      get :activate
    end
  end

  get 'login' => 'sessions#new', as: :login
  post 'logout' => 'sessions#destroy', as: :logout

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
