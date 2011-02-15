RacketBracket::Application.routes.draw do

  devise_for :users

  resources :leagues

  root :to => "dashboard#index"
end
