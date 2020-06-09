Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
  root 'home#top'
  get 'home/about'
  get '/search' => 'search#search'
  resources :users, only: [:show, :edit, :update, :index]
  get 'users/:id/follows' => 'users#following', as: 'follows'
  get 'users/:id/followers' => 'users#followers', as: 'followers'
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]do
  	resources :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]
end
