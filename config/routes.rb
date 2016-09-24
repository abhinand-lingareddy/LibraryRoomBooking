
Rails.application.routes.draw do
  resources :rooms
  resources :admins
  root :to => redirect('/admins')
end

