Rails.application.routes.draw do

  devise_for :artists

  mount Ckeditor::Engine => '/ckeditor'
  get 'principal/index'

  get 'welcome/index'

  #novo 
  get '/novo_disco/'           => 'principal#novo_disco'
  get '/novo_agenda/'          => 'principal#novo_agenda'
  get '/novo_email/'           => 'principal#novo_email'
  get '/novo_telefone/'        => 'principal#novo_telefone'
  get '/novo_video/'           => 'principal#novo_video'
  get '/novo_rede_social/'     => 'principal#novo_rede_social'
  #rotas ajax
  #views padrão (sem login)
  get '/album/:id/:profile'        => 'artist_datas#discography'  
  get '/contato/:id'               => 'artist_datas#contact'
  get '/historia/:id'              => 'artist_datas#history'
  get '/agenda/:id/:profile'       => 'artist_datas#agenda'
  get '/videos/:id/:profile'        => 'artist_datas#videos'
  get '/rede_social/:id/:profile'  => 'artist_datas#rede_social'

  #views user


  #apresenta artista existente
  get '/show_artista/:id'                   => 'principal#artista'
  get '/show_agenda/:id/:profile'           => 'principal#agenda'
  get '/show_disco/:id/:profile'            => 'principal#disco'
  get '/show_contato/:id'                   => 'principal#contato'
  get '/show_email/:id/:profile'            => 'principal#email'
  get '/show_telefone/:id/:profile'         => 'principal#telefone'
  get '/show_rede_social/:id/:profile'      => 'principal#rede_social'
  get '/show_video/:id/:profile'            => 'principal#video'
  
  post '/show_agenda/:id/:profile'           => 'principal#artista'
  get '/show_agenda/:id/:profile'           => 'principal#agenda'


  #edita artista existente
  get '/edit_artista/:id'                 => 'principal#artista'
  get '/edit_agenda/:id/:profile'         => 'principal#edit_agenda'
  get '/edit_disco/:id/:profile'          => 'principal#edit_disco'  
  get '/edit_email/:id/:profile'          => 'principal#edit_email'  
  get '/edit_telefone/:id/:profile'       => 'principal#edit_telefone'  
  get '/edit_rede_social/:id/:profile'    => 'principal#edit_rede_social'  
  
  
  #remove items
  delete '/remove_disco/:id/:profile'          => 'principal#remove_disco'
  delete '/remove_agenda/:id/:profile'         => 'principal#remove_agenda'
  delete '/remove_email/:id/:profile'          => 'principal#remove_email'
  delete '/remove_telefone/:id/:profile'       => 'principal#remove_telefone'
  delete '/remove_video/:id/:profile'          => 'principal#remove_video'
  delete '/remove_rede_social/:id/:profile'    => 'principal#remove_rede_social'  

  resources :discographys
  resources :phones
  resources :emails
  resources :artist_datas
  resources :rede_sociais
  resources :videos
  resources :commitments  
  resources :historys
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  # You can have the root of your site routed with "root"
   root 'welcome#index'

  # Example of regular route:
     

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
