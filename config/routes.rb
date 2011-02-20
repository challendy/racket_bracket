RacketBracket::Application.routes.draw do

  resources :tournaments

  devise_for :users

  resources :leagues

  root :to => "dashboard#index"
end
