Rails.application.routes.draw do
  root 'sessions#new'

  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#delete'

  get 'pizza', to: 'pizzas#new', as: 'pizza'
  post 'add_ingredient', to: 'pizzas#add_ingredient', as: 'add'

  post 'remove_ingredient', to: 'pizzas#remove_ingredient', as: 'remove'

  post 'change_size', to: 'pizzas#change_size', as: 'change'

  get 'preview', to: 'pizzas#preview'

  post 'create', to: 'pizzas#create'

  get 'my_pizzas', to: 'pizzas#my_pizzas'

  get '*path', to: 'pizzas#new'
end
