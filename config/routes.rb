Rails.application.routes.draw do
  post '/encode', to: 'urls#encode'
  get '/decode', to: 'urls#decode'
end
