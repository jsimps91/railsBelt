Rails.application.routes.draw do
  root 'users#index'
  post 'users' => 'users#create'
  post 'users/authenticate' => 'users#authenticate'
  get 'shoes' => 'shoes#index'
  get 'logout' =>'users#logout'
  get 'dashboard' => 'shoes#dashboard'
  post 'shoes' => 'shoes#create'
  post 'shoes/:shoe_id/buy' => 'shoes#buy'
  delete 'shoes/:id/delete' => 'shoes#destroy'
end
