Rails.application.routes.draw do

  scope '/api' do 
    resources :movies
    get '/refresh', to: 'movies#scrape'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
