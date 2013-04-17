Cmunity::Application.routes.draw do

  # Devise Routes

  devise_for :users
  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  # Root

  root :to => 'home#index'
  
  match "posts" => "contents#index"
  match "communities" => "groups#index"
  match "events" => "event_posts#index"

  #Autogenerated routes
  
  resources :activities
  
  resources :groups do
    resources :contents do
      resources :event_posts
      resources :video_posts
      resources :text_posts
      resources :url_posts
      resources :image_posts
    end
  end

  resources :users

  resources :contents do
    resources :event_posts
    resources :video_posts
    resources :text_posts
    resources :url_posts
    resources :image_posts
  end

  resources :memberships

end
