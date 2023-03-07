Rails.application.routes.draw do
  get 'bot/setup', :to => 'bot#setup'
end
