Cmunity::Application.routes.draw do

  # Devise Routes

  devise_for :users do
    get "login" => "devise/sessions#new", :as => :login
    delete "logout" => "devise/sessions#destroy", :as => :logout
    get "register" => "devise/registrations#new", :as => :register
  end
  # Root

  root :to => 'home#index'
  
  match "mycommunities" => "groups#index_my_groups"
  match "communities" => "groups#index"
  match "fetch" => "url_posts#fetch"
  match "fetchvid" => "video_posts#fetch"
  match "fetchimg" => "image_posts#fetch"

  #Autogenerated routes
  match "group_message" => "groups#send_message"
  
  #Autogenerated routes
  resources :activities
  resources :groups
  resources :users

  resources :contents, :path => "posts", :constraints => {:id => /[0-9]+/}, :as => "posts"
  resources :event_posts, :path => "posts/events", :as => "events"
  resources :video_posts, :path => "posts/videos", :as => "videos"
  resources :text_posts, :path => "posts/texts", :as => "texts"
  resources :url_posts, :path => "posts/urls", :as => "urls"
  resources :image_posts, :path => "posts/images", :as => "images"

  resources :memberships

end
