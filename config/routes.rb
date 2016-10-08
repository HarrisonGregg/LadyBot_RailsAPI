Rails.application.routes.draw do
  get '/receive', to:"messenger#receive"
end
