Rails.application.routes.draw do
  scope "(:locale)", locale: /en|zh/ do
  
    resources :comments
    resources :posts
    devise_for :people, :controllers => { :invitations => 'people/invitations' }
    resources :companies, type: 'Company'  do
      member do
        post 'follow'
      end
    end

  
    get '/embed/:id' => 'supergroups#show', type: 'Union', embed: true
    get '/embed/:union_id/new' => 'recs#new', embed: true
    #patch '/embed/:union_id/create' => 'recs#create'
    get '/embed/:union_id/review/:id' => 'recs#review', embed: true
    #patch '/embed/:union_id/file_upload' => 'recs#file_upload'
  
    resources :unions, controller: :supergroups, type: 'Union' do
      member do
        post 'follow'
        get 'all'
      end
      resources :recs do
        member do
          post 'follow'
          get 'review'
          patch 'video_upload'
          get 'toggle' # get so it can be done from email link
        end
      end
    end
  
    resources :people
  
    resources :recs do
      member do
        post 'follow'
        get 'review'
        patch 'video_upload'
        get 'toggle' # get so it can be done from email link
      end
    end
  
    resources :submission, controller: :recs, type: 'Rec'
    
    get '/en' => "recs#index", locale: 'en'
    get '/zh' => "recs#index", locale: 'zh'
    
    get '/:id' => 'supergroups#show', type: 'Union'
    get '/:union_id/new' => 'recs#new'
  
    root "recs#index"
  end 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
