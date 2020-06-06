Rails.application.routes.draw do  

  get '/users/index', to: 'users#index'
  
  get '/posts/new', to: 'posts#new'
  
  get '/posts/index', to: 'posts#index'

  get '/posts/:id', to: 'posts#show'

  post '/posts/create', to: 'posts#create'

  get '/posts/:id/edit', to: 'posts#edit'

  post '/posts/:id/update', to: 'posts#update'

  post '/posts/:id/destroy', to: 'posts#destroy'

  get '/top', to: 'home#top'

  get '/about', to: 'home#about'

end
