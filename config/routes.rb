Rails.application.routes.draw do
  root to: 'application#calendars'
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' } do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end
