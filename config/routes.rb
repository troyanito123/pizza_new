Rails.application.routes.draw do
  root 'pizzas#new'

  post 'add_ingredient', to: 'pizzas#add_ingredient', as: 'add'

  post 'remove_ingredient', to: 'pizzas#remove_ingredient', as: 'remove'

  post 'change_size', to: 'pizzas#change_size', as: 'change'

  get 'preview', to: 'pizzas#preview'

  post 'create', to: 'pizzas#create'
end
