Cmunity::Application.routes.draw do

  devise_for :users
  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  
  resources :user_groups

  get "home/index"
  
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  resources :groups

  resources :users

  resources :event_posts

  resources :video_posts

  resources :text_posts

  resources :url_posts

  resources :image_posts

  resources :contents

end
