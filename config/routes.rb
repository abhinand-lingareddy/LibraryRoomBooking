
Rails.application.routes.draw do

  get 'sessions/login'
  post '/sessions/login' , to: 'sessions#login_attempt'

  get 'sessions/home'

  get 'sessions/logout'

  resources :rooms do
    resources :bookings
  end

  resources :users
end

