Rails.application.routes.draw do
  root to: 'application#calendars'
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
end
