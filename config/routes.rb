Rails.application.routes.draw do
  get '/refresh', to: 'movies#scrape'
  scope '/api' do 
    resources :movies
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
