Rails.application.routes.draw do
   get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#show"

  resource :dashboard, controller: :dashboard
  devise_for :users, controllers: {
   sessions: 'users/sessions'
  }
  resource :two_factor_authentication do
    scope module: :two_factor_authentication do
      resource :confirmation
    end
  end

  devise_scope :user do
    get '/users/sign_in/otp' => 'users/otp/sessions#new'
    post '/users/sign_in/otp' => 'users/otp/sessions#create'
    get '/users/sign_in/recovery_code' => 'users/recovery_code/sessions#new'
    post '/users/sign_in/recovery_code' => 'users/recovery_code/sessions#create'
  end
end
