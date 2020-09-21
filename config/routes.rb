Rails.application.routes.draw do

  resources :flights, only: [:index]

  resources :airlines, only: [:show]

  delete "/passengers/:passenger_id/flights/:flight_id", to: "passenger_flights#destroy"
end
