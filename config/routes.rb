
Rails.application.routes.draw do

  root :to => 'sessions#login'

  get 'sessions/login'
  post '/sessions/login' , to: 'sessions#login_attempt'

  get 'sessions/home'

  get 'sessions/logout'

  get 'users/history'

  get 'users/list_admins'
  get 'users/list_members'

  resources :rooms do
    resources :bookings
  end

  resources :users
end

