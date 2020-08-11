Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'home#index'
  resources :users
  get 'topics/new'
  get 'topics/index'
  get 'topics/show/:id' => 'topics#show', as: :topics_show
  post 'topics/create' => 'topics#create'
  delete 'topics/delete/:id' => 'topics#delete', as: :topic_delete
  post 'posts/create' => 'posts#create', as: :posts_create
  get 'posts/new/:id' => 'posts#new', as: :posts_new
  get    'profile/:id'   =>  'users#show'
end
