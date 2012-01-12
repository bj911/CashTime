Z3::Application.routes.draw do

  resources :comments, :only => [:index, :create]

  devise_for :users
  root :to => 'welcome#categories'

  get '/comment_date' => 'comments#comment_date', :as => :comment_date
  get '/pict_like' => 'pictures#pict_like', :as => :pict_like
  post '/like/:picture_id' => 'pictures#like_set', :as => :like_set

  scope '/events' do
    get '/' => 'event#events', :as => :events
    get '/:info/:user_id' => 'event#info_set', :as => :info_set
  end

  scope 'categories/:category' do
    get '/:id' => 'pictures#list_id', :as => :list_id
    get '/' => 'pictures#list_category', :as => :list_category
  end

end
