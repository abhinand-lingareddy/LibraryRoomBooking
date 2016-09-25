
Rails.application.routes.draw do
  resources :users
  resources :rooms

  get "/sessions/login"
  post "/sessions/login" , to: 'sessions#login_attempt'

end

