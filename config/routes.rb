RacketBracket::Application.routes.draw do

  devise_for :users

  resources :leagues
  resources :tournaments do
     match "matches_setup", :to => "tournaments#matches_setup"
  end

  root :to => "dashboard#index"
end
