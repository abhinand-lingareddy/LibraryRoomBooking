
Rails.application.routes.draw do
  resources :rooms do
    resources :bookings
  end
  resources :admins
  get "/sessions/login"
  post "/sessions/login" , to: 'sessions#login_attempt'

end

