Rails.application.routes.draw do
  resources :moments
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'twilio/process_sms' => 'moments#process_sms'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
