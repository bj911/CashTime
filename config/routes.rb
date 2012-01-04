Z3::Application.routes.draw do

  resources :comments
  resources :pictures


  devise_for :users#, :controllers => { :sessions => "sessions" }
  root :to => 'welcome#index'
  #match '/:service/wall' => 'services#wall', :as => :service_wall
  match '/categories' => 'pictures#categories', :as => :categories
  match '/pict_like' => 'pictures#pict_like', :as => :pict_like
  match '/comment_date' => 'pictures#comment_date', :as => :comment_date
  match '/categories' => 'pictures#categories', :as => :categories
  match '/categories/:category' => 'pictures#list_category', :as => :list_category
  match '/categories/:category/:id' => 'pictures#list_id', :as => :list_id
  post '/like/:picture_id' => 'pictures#like_set', :as => :like_set
  match '/events' => 'pictures#events', :as => :events
  match '/events/:info/:user_id' => 'pictures#info_set', :as => :info_set
  match '/logout' => 'application#logout', :as => :logout
  #destroy_user_session_path, :method => :delete
  #post '/pic/:picture_id' => 'pictures#pic_sort', :as => :pic_sort
  #post '/new_comment/:picture_id' => 'pictures#comment_add', :as => :comment_add
  #match '/:service/wall' => 'services#wall', :as => :service_wall

end
