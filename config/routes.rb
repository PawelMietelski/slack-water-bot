Rails.application.routes.draw do
  require 'sidekiq/web'

  mount Sidekiq::Web => "/sidekiq" # mount Sidekiq::Web in your Rails app
  get 'bot/setup', :to => 'bot#setup'
end
